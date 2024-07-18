BattleCommand_Disable:
	ld a, [wAttackMissed]
	and a
	jr nz, .did_not_affect_nonzero

	ld de, wEnemyDisableCount
	ld hl, wEnemyMonMoves
	ldh a, [hBattleTurn]
	and a
	jr z, .got_moves
	ld de, wPlayerDisableCount
	ld hl, wBattleMonMoves
.got_moves

	ld a, [de]
	and a
.did_not_affect_nonzero
	jp nz, PrintDidntAffectWithMoveAnimDelay

	ld a, BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	call GetBattleVar
	and a
	jr z, .did_not_affect_zero
	cp STRUGGLE
	jr z, .did_not_affect_zero

	ld b, a
	ld c, $ff
.loop
	inc c
	ld a, [hli]
	cp b
	jr nz, .loop

	ldh a, [hBattleTurn]
	and a
	ld hl, wEnemyMonPP
	jr z, .got_pp
	ld hl, wBattleMonPP
.got_pp
	ld b, 0
	add hl, bc
	ld a, [hl]
	and a
.did_not_affect_zero
	jp z, PrintDidntAffectWithMoveAnimDelay
	ld a, 5
	inc c
	swap c
	add c
	ld [de], a
	call AnimateCurrentMove
	ld hl, wDisabledMove
	ldh a, [hBattleTurn]
	and a
	jr nz, .got_disabled_move_pointer
	inc hl
.got_disabled_move_pointer
	ld a, BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	call GetBattleVar
	ld [hl], a
	ld [wNamedObjectIndexBuffer], a
	call GetMoveName
	ld hl, WasDisabledText
	jp StdBattleTextBox