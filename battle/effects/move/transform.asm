BattleCommand_Transform:
; transform
	call ClearLastMove
	ld a, BATTLE_VARS_SUBSTATUS5_OPP
	call GetBattleVarAddr
	bit SUBSTATUS_TRANSFORMED, [hl]
	call z, CheckHiddenOpponent
	jr z, .not_hidden_or_transformed
	jpba FailedGeneric

.not_hidden_or_transformed
	xor a
	ld [wNumHits], a
	ld [wFXAnimIDHi], a
	inc a
	ld [wBattleAnimParam], a
	call CheckSubstituteOpp
	push af ; save flags for later
	jr z, .mimic_substitute
	call CheckUserIsCharging
	jr z, .mimic_substitute
	callba PlaySubstituteAnim
.mimic_substitute
	ld a, BATTLE_VARS_SUBSTATUS5
	call GetBattleVarAddr
	set SUBSTATUS_TRANSFORMED, [hl]
	ldh a, [hBattleTurn]
	and a
	jr nz, .enemyTurn
	ld hl, wEnemyMonSpecies
	ld de, wBattleMonSpecies
	xor a
	ld [wCurMoveNum], a
	ld [wPlayerDisableCount], a
	ld [wDisabledMove], a
	jr .got_mon_species
.enemyTurn
	ld hl, wBattleMonSpecies
	ld de, wEnemyMonSpecies
	xor a
	ld [wEnemyDisableCount], a
	ld [wEnemyDisabledMove], a
.got_mon_species
	push hl
	ld a, [hli]
	ld [de], a
	inc hl
	inc de
	inc de
	ld bc, NUM_MOVES
	rst CopyBytes
	ldh a, [hBattleTurn]
	and a
	jr z, .mimic_enemy_backup
	ld a, [de]
	ld [wEnemyBackupDVs], a
	inc de
	ld a, [de]
	ld [wEnemyBackupDVs + 1], a
	dec de
.mimic_enemy_backup
; copy DVs
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
; move pointer to stats
	ld bc, wBattleMonStats - wBattleMonPP
	add hl, bc
	push hl
	ld h, d
	ld l, e
	add hl, bc
	ld d, h
	ld e, l
	pop hl
	ld bc, wBattleMonStructEnd - wBattleMonStats
	rst CopyBytes
; init the power points
	ld bc, wBattleMonMoves - wBattleMonStructEnd
	add hl, bc
	push de
	ld d, h
	ld e, l
	pop hl
	ld bc, wBattleMonPP - wBattleMonStructEnd
	add hl, bc
	ld b, NUM_MOVES
.pp_loop
	ld a, [de]
	inc de
	and a
	jr z, .done_move
	ld a, 5
.done_move
	ld [hli], a
	dec b
	jr nz, .pp_loop
	pop hl
	ld a, [hl]
	ld [wNamedObjectIndexBuffer], a
	call GetPokemonName
	ld hl, wEnemyStats
	ld de, wPlayerStats
	ld bc, 2 * 5
	call BattleSideCopy
	ld hl, wEnemyStatLevels
	ld de, wPlayerStatLevels
	ld bc, 8
	call BattleSideCopy
	call CheckBattleScene
	jr c, .mimic_anims
	ldh a, [hBattleTurn]
	and a
	ld a, [wPlayerMinimized]
	jr z, .got_byte
	ld a, [wEnemyMinimized]
.got_byte
	and a
	jr nz, .mimic_anims
	callba LoadMoveAnim
	jr .after_anim

.mimic_anims
	call BattleCommand_MoveDelay
	call BattleCommand_RaiseSubNoAnim
.after_anim
	xor a
	ld [wNumHits], a
	ld [wFXAnimIDHi], a
	ld a, 2
	ld [wBattleAnimParam], a
	pop af
	jr z, .no_substitute
	callba PlaySubstituteAnim
.no_substitute
	ld hl, TransformedText
	jp StdBattleTextBox

BattleSideCopy:
; Copy bc bytes from hl to de if it's the player's turn.
; Copy bc bytes from de to hl if it's the enemy's turn.
	ldh a, [hBattleTurn]
	and a
	jr z, .copy

; Swap hl and de
	push hl
	ld h, d
	ld l, e
	pop de
.copy
	rst CopyBytes
	ret