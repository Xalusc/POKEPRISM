BattleCommand_Curse:
; curse
	ld de, wBattleMonType1
	ld bc, wPlayerStatLevels
	ldh a, [hBattleTurn]
	and a
	jr z, .go
	ld de, wEnemyMonType1
	ld bc, wEnemyStatLevels
.go

; Curse is different for Ghost-types.
	ld a, [de]
	cp GHOST
	jr z, .ghost
	inc de
	ld a, [de]
	cp GHOST
	jr z, .ghost

; If no stats can be increased, don't.
; Attack
	ld a, [bc]
	cp MAX_STAT_LEVEL
	jr c, .raise
; Defense
	inc bc
	ld a, [bc]
	cp MAX_STAT_LEVEL
	jr nc, .cantraise

.raise
; Raise Attack and Defense, and lower Speed.
	ld a, 1
	ld [wBattleAnimParam], a
	call AnimateCurrentMove
	call SwitchTurn
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVarAddr
	ld [hl], CURSE

	; Handle stat decrease properly
	ln b, 0, SPEED
	ld hl, DoStatDown
	ld de, DoStatUp
	call ApplySimpleAndContraryOpp
	call BattleCommand_StatDownMessage
	call ResetMiss
	call SwitchTurn
	call BattleCommand_AttackUp
	call BattleCommand_StatUpMessage
	call ResetMiss
	call BattleCommand_DefenseUp
	jp BattleCommand_StatUpMessage

.ghost
; Cut HP in half and put a curse on the opponent.
	call CheckHiddenOpponent
	call z, CheckSubstituteOpp
	jr nz, .failed_non_zero

	ld a, BATTLE_VARS_SUBSTATUS1_OPP
	call GetBattleVarAddr
	bit SUBSTATUS_CURSE, [hl]
.failed_non_zero
	jp nz, FailedGeneric

	set SUBSTATUS_CURSE, [hl]
	call AnimateCurrentMove
	callba GetHalfMaxHP
	callba SubtractHPFromUser
	call UpdateUserInParty
	ld hl, PutACurseText
	jp StdBattleTextBox

.cantraise
; Can't raise either stat.
	ld b, ABILITY + 1
	call GetStatName
	call AnimateFailedMove
	ld hl, WontRiseAnymoreText
	jp StdBattleTextBox
