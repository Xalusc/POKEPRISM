BattleCommand_Spite:
	ld a, [wAttackMissed]
	and a
.failed_non_zero
	jp nz, PrintDidntAffectWithMoveAnimDelay
	ld hl, wEnemyMonMoves
	ldh a, [hBattleTurn]
	and a
	jr z, .got_moves
	ld hl, wBattleMonMoves
.got_moves
	ld a, BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	call GetBattleVar
	and a
	jr z, .failed_zero
	cp STRUGGLE
	jr z, .failed_zero
	ld b, a
	ld c, -1
.loop
	inc c
	assert NUM_MOVES == 4
	bit 2, c
	jr nz, .failed_non_zero
	ld a, [hli]
	cp b
	jr nz, .loop
	ld [wTypeMatchup], a
	dec hl
	ld b, 0
	push bc
	ld c, wBattleMonPP - wBattleMonMoves
	add hl, bc
	pop bc
	ld a, [hl]
	and $3f
.failed_zero
	jp z, PrintDidntAffectWithMoveAnimDelay
	push bc
	call GetMoveName
	ld b, 4 ; made spite non-random
	ld a, [hl]
	and $3f
	cp b
	jr nc, .deplete_pp
	ld b, a
.deplete_pp
	ld a, [hl]
	sub b
	ld [hl], a
	push af
	ld a, MON_PP
	call OpponentPartyAttr
	ld d, b
	pop af
	pop bc
	add hl, bc
	ld e, a
	ld a, BATTLE_VARS_SUBSTATUS5_OPP
	call GetBattleVar
	bit SUBSTATUS_TRANSFORMED, a
	jr nz, .transformed
	ldh a, [hBattleTurn]
	and a
	jr nz, .not_wildmon
	ld a, [wBattleMode]
	dec a
	jr nz, .not_wildmon
	ld hl, wWildMonPP
	add hl, bc
.not_wildmon
	ld [hl], e
.transformed
	push de
	call AnimateCurrentMove
	pop de
	ld a, d
	ld [wTypeMatchup], a
	ld hl, SpiteEffectText
	jp StdBattleTextBox
