AIChooseMove:
; Score each move in wEnemyMonMoves starting from wAIMoveScores. Lower is better.
; Pick the move with the lowest score.

; Wildmons attack at random.
	ld a, [wBattleMode]
	dec a
	ret z

	ld a, [wLinkMode]
	and a
	ret nz

; No use picking a move if there's no choice.
	callba CheckEnemyLockedIn
	ret nz


; The default score is 20. Unusable moves are given a score of 80.
	ld a, 20
	ld hl, wAIMoveScores
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a

; Don't pick disabled moves.
	ld a, [wEnemyDisabledMove]
	and a
	jr z, .CheckPP

	ld hl, wEnemyMonMoves
	ld c, 0
.CheckDisabledMove
	cp [hl]
	jr z, .ScoreDisabledMove
	inc c
	inc hl
	jr .CheckDisabledMove

.ScoreDisabledMove
	ld hl, wAIMoveScores
	ld b, 0
	add hl, bc
	ld [hl], 80

; Don't pick moves with 0 PP.
.CheckPP
	ld hl, wAIMoveScores - 1
	ld de, wEnemyMonPP
	ld b, 0
.CheckMovePP
	inc b
	ld a, b
	cp wEnemyMonMovesEnd - wEnemyMonMoves + 1
	jr z, .ApplyLayers
	inc hl
	ld a, [de]
	inc de
	and $3f
	jr nz, .CheckMovePP
	ld [hl], 80
	jr .CheckMovePP


; Apply AI scoring layers depending on the trainer class.
.ApplyLayers
	ld hl, TrainerClassAttributes + TRNATTR_AI_MOVE_WEIGHTS

	; If we have a battle in BattleTower just load the Attributes of the first trainer class (Josiah)
	; so we have always the same AI, regardless of the loaded class of trainer
	ld a, [wInBattleTowerBattle]
	bit 0, a
	jr nz, .battle_tower_skip

	ld a, [wTrainerClass]
	dec a
	ld bc, 7 ; Trainer2AI - Trainer1AI
	rst AddNTimes
.battle_tower_skip
	ld a, BANK(TrainerClassAttributes)
	call GetFarHalfword
; hl = flags
	ld c, 0
.checkLayerLoop
	srl h
	rr l
	jr nc, .noAttribute
	push hl
	push bc
	ld hl, AIScoringPointers
	ld b, 0
	add hl, bc
	add hl, bc
	ld a, BANK(AIScoring)
	call FarCall_Pointer
	pop bc
	pop hl
.noAttribute
	inc c
	ld a, c
	cp 16
	jr c, .checkLayerLoop

; Decrement the scores of all moves one by one until one reaches 0.
.DecrementScores
	ld hl, wAIMoveScores
	ld de, wEnemyMonMoves
	ld c, wEnemyMonMovesEnd - wEnemyMonMoves

.DecrementNextScore
	; If the enemy has no moves, this will infinite.
	ld a, [de]
	inc de
	and a
	jr z, .DecrementScores

	; We are done whenever a score reaches 0
	dec [hl]
	jr z, .PickLowestScoreMoves

	; If we just decremented the fourth move's score, go back to the first move
	inc hl
	dec c
	jr z, .DecrementScores

	jr .DecrementNextScore

; In order to avoid bias towards the moves located first in memory, increment the scores
; that were decremented one more time than the rest (in case there was a tie).
; This means that the minimum score will be 1.
.PickLowestScoreMoves
	ld a, c

.move_loop
	inc [hl]
	dec hl
	inc a
	cp NUM_MOVES + 1
	jr nz, .move_loop

	ld hl, wAIMoveScores
	ld de, wEnemyMonMoves
	ld c, NUM_MOVES

; Give a score of 0 to a blank move
.loop2
	ld a, [de]
	and a
	jr nz, .skip_load
	ld [hl], a

; Disregard the move if its score is not 1
.skip_load
	ld a, [hl]
	dec a
	jr z, .keep
	xor a
	ld [hli], a
	jr .after_toss

.keep
	ld a, [de]
	ld [hli], a
.after_toss
	inc de
	dec c
	jr nz, .loop2

; Randomly choose one of the moves with a score of 1
.ChooseMove
	ld hl, wAIMoveScores
	call Random
	and 3
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	and a
	jr z, .ChooseMove

	ld [wCurEnemyMove], a
	ld a, c
	ld [wCurEnemyMoveNum], a
	ret

AIScoringPointers:
	dw AI_Basic
	dw AI_Setup
	dw AI_Types
	dw AI_Offensive
	dw AI_Smart
	dw AI_Opportunist
	dw AI_Aggressive
	dw AI_Cautious
	dw AI_Status
	dw AI_Risky
	dw GenericDummyFunction
	dw GenericDummyFunction
	dw GenericDummyFunction
	dw GenericDummyFunction
	dw GenericDummyFunction
	dw GenericDummyFunction
