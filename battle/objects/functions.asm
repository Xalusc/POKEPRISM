DoBattleAnimFrame:
	ld hl, BATTLEANIMSTRUCT_FUNCTION
	add hl, bc
	ld a, [hl]
	jumptable

	dw BattleAnimFunction_Null
	dw BattleAnimFunction_MoveFromPlayerToEnemyByParam
	dw BattleAnimFunction_MoveFromPlayerToEnemyByParamAndDisappear
	dw BattleAnimFunction_03
	dw BattleAnimFunction_ArcFromPlayerToEnemyAndDisappear
	dw BattleAnimFunction_ThrowFromPlayerToEnemy
	dw BattleAnimFunction_ThrowFromPlayerToEnemyAndDisappear
	dw BattleAnimFunction_07
	dw BattleAnimFunction_08
	dw BattleAnimFunction_09
	dw BattleAnimFunction_0A
	dw BattleAnimFunction_RazorLeaf
	dw BattleAnimFunction_0C
	dw BattleAnimFunction_0D
	dw BattleAnimFunction_0E
	dw BattleAnimFunction_0F
	dw BattleAnimFunction_10
	dw BattleAnimFunction_11
	dw BattleAnimFunction_PokeBall
	dw BattleAnimFunction_PokeBallBlocked
	dw BattleAnimFunction_14
	dw BattleAnimFunction_15
	dw BattleAnimFunction_16
	dw BattleAnimFunction_17
	dw BattleAnimFunction_18
	dw BattleAnimFunction_19
	dw BattleAnimFunction_1A
	dw BattleAnimFunction_1B
	dw BattleAnimFunction_1C
	dw BattleAnimFunction_1D
	dw BattleAnimFunction_RaiseByParam
	dw BattleAnimFunction_1F
	dw BattleAnimFunction_LeechSeed
	dw BattleAnimFunction_21
	dw BattleAnimFunction_22
	dw BattleAnimFunction_23
	dw BattleAnimFunction_24
	dw BattleAnimFunction_25
	dw BattleAnimFunction_26
	dw BattleAnimFunction_27
	dw BattleAnimFunction_28
	dw BattleAnimFunction_SpiralDescent
	dw BattleAnimFunction_PoisonGas
	dw BattleAnimFunction_Horn
	dw BattleAnimFunction_2C
	dw BattleAnimFunction_2D
	dw BattleAnimFunction_2E
	dw BattleAnimFunction_2F
	dw BattleAnimFunction_30
	dw BattleAnimFunction_31
	dw BattleAnimFunction_32
	dw BattleAnimFunction_33
	dw BattleAnimFunction_34
	dw BattleAnimFunction_35
	dw BattleAnimFunction_36
	dw BattleAnimFunction_37
	dw BattleAnimFunction_38
	dw BattleAnimFunction_39
	dw BattleAnimFunction_3A
	dw BattleAnimFunction_3B
	dw BattleAnimFunction_3C
	dw BattleAnimFunction_3D
	dw BattleAnimFunction_3E
	dw BattleAnimFunction_3F
	dw BattleAnimFunction_40
	dw BattleAnimFunction_41
	dw BattleAnimFunction_42
	dw BattleAnimFunction_43
	dw BattleAnimFunction_44
	dw BattleAnimFunction_45
	dw BattleAnimFunction_46
	dw BattleAnimFunction_47
	dw BattleAnimFunction_48
	dw BattleAnimFunction_49
	dw BattleAnimFunction_4A
	dw BattleAnimFunction_4B
	dw BattleAnimFunction_4C
	dw BattleAnimFunction_4D
	dw BattleAnimFunction_4E
	dw BattleAnimFunction_4F

BattleAnimFunction_Null:
	call BattleAnim_AnonJumptable
	dw GenericDummyFunction
	dw DeinitBattleAnimation

BattleAnimFunction_03:
	call BattleAnim_AnonJumptable
	dw .zero
	dw .one

.zero
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	bit 7, [hl]
	ld a, $20
	jr nz, .asm_cd0f9
	xor a
.asm_cd0f9
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and $7f
	ld [hl], a
.one
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld d, [hl]
	push af
	push de
	call Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	inc [hl]
	ret

BattleAnimFunction_PokeBall:
	call BattleAnim_AnonJumptable
	dw .load_ball_palette
	dw .throw_ball
	dw GenericDummyFunction
	dw .prepare_bounce
	dw .bounce
	dw GenericDummyFunction
	dw .shake
	dw .seven
	dw .eight_or_ten
	dw GenericDummyFunction
	dw .eight_or_ten
	dw DeinitBattleAnimation
	dw .twelve
	dw GenericDummyFunction
	dw .fourteen
	dw GenericDummyFunction

.load_ball_palette
	call GetBallAnimPal
	jp BattleAnim_IncAnonJumptableIndex

.throw_ball
	; throw the ball; if the ball hasn't reached the enemy yet, we're done
	call BattleAnimFunction_ThrowFromPlayerToEnemy
	ret c
	; absorb the Y offset into the coordinate...
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	add a, [hl]
	ld [hl], a
	; ...select a new frameset, and move onto the next part of the animation
	ld a, BATTLEANIMFRAMESET_0B
	call ReinitBattleAnimFrameset
	jp BattleAnim_IncAnonJumptableIndex

.prepare_bounce
	; initialize the parameters for the bounce; make sure this is only done once
	call BattleAnim_IncAnonJumptableIndex
	ld a, BATTLEANIMFRAMESET_09
	call ReinitBattleAnimFrameset
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	; initial height 16, angle 0
	ld [hl], 0
	inc hl
	ld [hl], 16
.bounce
	; bounce up based on a sine wave with the current parameters (the angle is always negative, creating a negative Y offset)
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld a, [hld]
	ld d, a
	ld a, [hl]
	dec [hl]
	push af
	call Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop af
	; if we didn't reach -180°, do nothing
	cp -$1f
	ret nz
	; otherwise, reset the angle and reduce the bounce height by 4
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld a, [hl]
	sub 4
	ld [hld], a
	ld [hl], 0
	ret nz
	; if the bounce height became 0, load a new frameset and go to the next part of the animation
	ld a, BATTLEANIMFRAMESET_0C
	call ReinitBattleAnimFrameset
	jp BattleAnim_IncAnonJumptableIndex

.shake
	ld a, BATTLEANIMFRAMESET_0D
	call ReinitBattleAnimFrameset
	ld hl, BATTLEANIMSTRUCT_ANON_JT_INDEX
	add hl, bc
	dec [hl]
	ret

; Bottom of the PokeBall
.seven ; open
	call GetBallAnimPal
	ld a, BATTLEANIMFRAMESET_0A
	call ReinitBattleAnimFrameset
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld [hl], $20
.eight_or_ten ; close
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hli]
	ld d, [hl]
	call Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	dec [hl]
	ld a, [hl]
	and $1f
	jp z, DeinitBattleAnimation
	and $f
	ret nz
	jp BattleAnim_IncAnonJumptableIndex

.twelve
; critical shake
	ld a, BATTLEANIMFRAMESET_0C
	call ReinitBattleAnimFrameset
	ld hl, BATTLEANIMSTRUCT_11
	add hl, bc
	ld a, $10
	ld [hl], a
	jp BattleAnim_IncAnonJumptableIndex

.fourteen
	ld hl, BATTLEANIMSTRUCT_11
	add hl, bc
	ld a, [hl]
	and a
	jr z, .done
	dec [hl]
	; a = ($10 - a) * 4
	cpl
	add $10 + 1
	add a
	add a
	ld d, 2
	call Sine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ret

.done
	ld a, BATTLEANIMFRAMESET_09
	call ReinitBattleAnimFrameset
	jp BattleAnim_IncAnonJumptableIndex

BattleAnimFunction_PokeBallBlocked:
	call BattleAnim_AnonJumptable
	dw .zero
	dw .one
	dw .two

.zero
	call GetBallAnimPal
	jp BattleAnim_IncAnonJumptableIndex

.one
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $70
	jp c, BattleAnimFunction_ThrowFromPlayerToEnemy
	call BattleAnim_IncAnonJumptableIndex
.two
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	ld a, [hl]
	cp $80
	jp nc, DeinitBattleAnimation
	add a, 4
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	dec [hl]
	dec [hl]
	ret

BattleAnimFunction_10:
	call BattleAnim_AnonJumptable
	dw .zero
	dw .one
	dw DeinitBattleAnimation
	dw .three
	dw GenericDummyFunction

.zero
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	swap a
	and $f
	ld hl, BATTLEANIMSTRUCT_ANON_JT_INDEX
	add hl, bc
	ld [hl], a
	ret

.one
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $88
	ret nc
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	jp BattleAnim_ShiftCoordsRightUpHalved

.three
	call BattleAnim_IncAnonJumptableIndex
	ld a, $f
	jp ReinitBattleAnimFrameset

BattleAnimFunction_07:
	call BattleAnim_AnonJumptable
	dw .zero
	dw .one

.zero
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld [hl], $30
	inc hl
	ld [hl], $48
.one
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hli]
	ld d, [hl]
	call Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	inc [hl]
	ld a, [hl]
	and $3f
	ret nz
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld [hl], $20
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	sub [hl]
	jp z, DeinitBattleAnimation
	jp c, DeinitBattleAnimation
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld [hl], a
	ret

BattleAnimFunction_08:
	call BattleAnim_AnonJumptable
	dw .zero
	dw .one
	dw .two
	dw .three

.zero
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $80
	jr c, .set_coords
	call BattleAnim_IncAnonJumptableIndex
.one
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld [hl], 0
.two
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	cp $40
	jr nc, .loop_back
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	ld d, $18
	call Cosine
	sub $18
	sra a
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	ld d, $18
	call Sine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and $f
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	add [hl]
	ld [hl], a
	ret

.loop_back
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and $f0
	jr z, .finish
	sub $10
	ld d, a
	ld a, [hl]
	and $f
	or d
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_ANON_JT_INDEX
	add hl, bc
	dec [hl]
	ret

.finish
	call BattleAnim_IncAnonJumptableIndex
.three
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $b0
	jp nc, DeinitBattleAnimation
.set_coords
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and $f
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	add [hl]
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and $f
	ld e, a
	srl e
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
.loop
	dec [hl]
	dec e
	jr nz, .loop
	ret

BattleAnimFunction_09:
	call BattleAnim_AnonJumptable
	dw .zero
	dw .one
	dw DeinitBattleAnimation

.zero
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld [hl], 0
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and $f
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
.one
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	and a
	jr z, .done_one
	dec [hl]
	ret

.done_one
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	swap a
	and $f
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld a, [hl]
	cpl
	inc a
	ld [hl], a
	ret

BattleAnimFunction_0A:
	call BattleAnim_AnonJumptable
	dw .zero
	dw .one
	dw .two
	dw .three
	dw .four
	dw .five
	dw GenericDummyFunction
	dw .seven
	dw .eight
	dw DeinitBattleAnimation

.zero
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_ANON_JT_INDEX
	add hl, bc
	ld [hl], a
	cp 7
	jr z, .seven
	ld a, $11
	jp ReinitBattleAnimFrameset

.seven
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $88
	jr nc, .set_up_eight
	add a, 2
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	dec [hl]
	ret

.set_up_eight
	call BattleAnim_IncAnonJumptableIndex
	ld a, $10
	call ReinitBattleAnimFrameset
.eight
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	ld d, $10
	push af
	push de
	call Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	inc [hl]
	ret

.one
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	dec [hl]
	ret

.four
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	inc [hl]
.two
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	dec [hl]
	ret

.five
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	inc [hl]
.three
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	inc [hl]
	ret

BattleAnimFunction_RazorLeaf:
	call BattleAnim_AnonJumptable
	dw .zero
	dw .one
	dw .two
	dw .three
	dw BattleAnim_IncAnonJumptableIndex
	dw BattleAnim_IncAnonJumptableIndex
	dw BattleAnim_IncAnonJumptableIndex
	dw BattleAnim_IncAnonJumptableIndex
	dw .eight

.zero
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld [hl], $40
.one
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	cp $30
	jr nc, .sine_cosine
	call BattleAnim_IncAnonJumptableIndex
	xor a
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld [hli], a
	ld [hl], a
	ld a, $17
	call ReinitBattleAnimFrameset
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	bit 6, [hl]
	ret z
	ld hl, BATTLEANIMSTRUCT_FRAME
	add hl, bc
	ld [hl], 5
	ret

.sine_cosine
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and $3f
	ld d, a
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	dec [hl]
	call Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	call Functioncd557
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld h, [hl]
	ld l, a
	add hl, de
	ld e, l
	ld d, h
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld [hl], d
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld [hl], e
	ret

.two
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld a, [hl]
	cp $20
	jp z, DeinitBattleAnimation
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	ld d, $10
	call Sine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	bit 6, [hl]
	jr nz, .decrease
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	inc [hl]
	jr .finish

.decrease
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	dec [hl]
.finish
	ld de, $80
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld h, [hl]
	ld l, a
	add hl, de
	ld e, l
	ld d, h
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], d
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld [hl], e
	ret

.three
	ld a, $16
	call ReinitBattleAnimFrameset
	ld hl, BATTLEANIMSTRUCT_FLAGS
	add hl, bc
	res 5, [hl]
	jp BattleAnim_IncAnonJumptableIndex

.eight
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $c0
	ret nc
	ld a, 8
	jp BattleAnim_ShiftCoordsRightUpHalved

Functioncd557:
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	bit 7, a
	jr nz, .negative
	cp $20
	jr nc, .plus_256
	cp $18
	jr nc, .plus_384
	ld de, $200
	ret

.plus_384
	ld de, $180
	ret

.plus_256
	ld de, $100
	ret

.negative
	and $3f
	cp $20
	jr nc, .minus_256
	cp $18
	jr nc, .minus_384
	ld de, -$200
	ret

.minus_384
	ld de, -$180
	ret

.minus_256
	ld de, -$100
	ret

BattleAnimFunction_4E:
	call BattleAnim_AnonJumptable
	dw .zero
	dw .one

.zero
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and $40
	rlca
	rlca
	add $19
	ld hl, BATTLEANIMSTRUCT_FRAMESET_ID
	add hl, bc
	ld [hl], a
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld [hl], $40
.one
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	cp $30
	jp c, DeinitBattleAnimation
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and $3f
	ld d, a
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	dec [hl]
	call Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	call Functioncd557
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld h, [hl]
	ld l, a
	add hl, de
	ld e, l
	ld d, h
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld [hl], d
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld [hl], e
	ret

BattleAnimFunction_0C:
	call BattleAnim_AnonJumptable
	dw .zero
	dw .one
	dw .two

.zero
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld [hl], $c
.one
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	and a
	jr z, .next
	dec [hl]
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	jp BattleAnim_ShiftCoordsRightUpHalved

.next
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld [hl], 0
	ld a, $22
	call ReinitBattleAnimFrameset
.two
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $98
	jr nc, .okay
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld h, [hl]
	ld l, a
	ld de, $60
	add hl, de
	ld e, l
	ld d, h
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld [hl], e
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld [hl], d
.okay
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	ld a, [hl]
	cp $20
	ret c
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and $f0
	ld e, a
	ld d, $ff
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	ld h, [hl]
	ld l, a
	add hl, de
	ld e, l
	ld d, h
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld [hl], e
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	ld [hl], d
	ret

BattleAnimFunction_0D:
	call BattleAnim_AnonJumptable
	dw .zero
	dw .one
	dw GenericDummyFunction
	dw .three
	dw DeinitBattleAnimation

.zero
	call BattleAnim_IncAnonJumptableIndex
	ld a, rSCY & $ff
	ld [wLCDCPointer], a
	ld a, $58
	ldh [hLYOverridesStart], a
	ld a, $5e
	ldh [hLYOverridesEnd], a
	ret

.one
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld e, [hl]
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	ld a, [hl]
	cp e
	jr nc, .asm_cd69b
	call BattleAnim_IncAnonJumptableIndex
	xor a
	ldh [hLYOverridesStart], a
	ret

.asm_cd69b
	dec a
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	ld d, $10
	call Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	add [hl]
	sub $10
	ret c
	ldh [hLYOverridesStart], a
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld a, [hl]
	inc a
	and 7
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	inc [hl]
	inc [hl]
	ret

.three
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	ld a, [hl]
	cp $70
	jr c, .asm_cd6da
	xor a
	ld [wLCDCPointer], a
	ldh [hLYOverridesStart], a
	ldh [hLYOverridesEnd], a
	jp DeinitBattleAnimation

.asm_cd6da
	inc a
	inc a
	ld [hl], a
	sub $10
	ret c
	ldh [hLYOverridesStart], a
	ret

BattleAnimFunction_0E:
	call BattleAnim_AnonJumptable
	dw .zero
	dw .one

.zero
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, $24
	add [hl]
	call ReinitBattleAnimFrameset

.one
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $b8
	jp nc, DeinitBattleAnimation
	ld a, 2
	call BattleAnim_ShiftCoordsRightUpHalved
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	dec [hl]
	ld d, 8
	call Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ret

BattleAnimFunction_0F:
	call BattleAnim_AnonJumptable
	dw .zero
	dw .one
	dw .two
	dw GenericDummyFunction

.zero
	call BattleAnim_IncAnonJumptableIndex
.one
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	ld a, [hl]
	cp $30
	jr c, .asm_cd747
	ld a, 2
	call BattleAnim_ShiftCoordsRightUpHalved
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	dec [hl]
	ld d, 8
	call Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ret

.asm_cd747
	call BattleAnim_IncAnonJumptableIndex
	ld a, $28
	call ReinitBattleAnimFrameset
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], 0
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	ld [hl], $30
	ld hl, BATTLEANIMSTRUCT_FLAGS
	add hl, bc
	ld a, [hl]
	and 1
	ld [hl], a
.two
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld a, [hl]
	cp $18
	jr nc, .asm_cd76e
	inc [hl]
	ret

.asm_cd76e
	call BattleAnim_IncAnonJumptableIndex
	ld a, $29
	jp ReinitBattleAnimFrameset

BattleAnimFunction_11:
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld a, [hl]
	cp $38
	jp nc, DeinitBattleAnimation
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld l, [hl]
	ld h, a
	ld de, $80
	add hl, de
	ld e, l
	ld d, h
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld [hl], e
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], d
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld a, [hl]
	xor $10
	ld [hl], a
	ret

BattleAnimFunction_14:
	call BattleAnim_AnonJumptable
	dw .zero
	dw .one

.zero
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and $f0
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and $f
	add a, a
	add a, a
	add a, a
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld [hl], 1
.one
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld a, [hl]
	and a
	jp z, DeinitBattleAnimation
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	inc [hl]
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld d, [hl]
	push af
	push de
	call Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	xor $1
	ld [hl], a
	ret z
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	dec [hl]
	ret

BattleAnimFunction_15:
	call BattleAnim_AnonJumptable
	dw GenericDummyFunction
	dw .one
	dw GenericDummyFunction
	dw DeinitBattleAnimation

.one
	call BattleAnim_IncAnonJumptableIndex
	ld a, $35
	jp ReinitBattleAnimFrameset

BattleAnimFunction_16:
	call BattleAnim_AnonJumptable
	dw .zero
	dw .one
	dw BattleAnim_IncAnonJumptableIndex
	dw BattleAnim_IncAnonJumptableIndex
	dw BattleAnim_IncAnonJumptableIndex
	dw BattleAnim_IncAnonJumptableIndex
	dw BattleAnim_SetAnonJumptableIndexToOne

.zero
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_FRAMESET_ID
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	bit 7, [hl]
	jr nz, .asm_cd852
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld [hl], $10
	jr .asm_cd858

.asm_cd852
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld [hl], $30
.asm_cd858
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and $7f
	ld [hl], a
.one
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld d, [hl]
	call Sine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	bit 7, a
	jr nz, .asm_cd87e
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld a, [hl]
	inc a
	jr .asm_cd883

.asm_cd87e
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld a, [hl]
.asm_cd883
	call ReinitBattleAnimFrameset
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	inc [hl]
	ld a, [hl]
	and $1f
	ret nz
	jp BattleAnim_IncAnonJumptableIndex

BattleAnimFunction_17:
	call BattleAnim_AnonJumptable
	dw .zero
	dw .one
	dw BattleAnim_IncAnonJumptableIndex
	dw BattleAnim_IncAnonJumptableIndex
	dw BattleAnim_IncAnonJumptableIndex
	dw BattleAnim_IncAnonJumptableIndex
	dw BattleAnim_SetAnonJumptableIndexToOne

.zero
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	bit 7, [hl]
	jr nz, .asm_cd8be
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld [hl], $10
	jr .asm_cd8c4

.asm_cd8be
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld [hl], $30
.asm_cd8c4
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and $7f
	ld [hl], a
.one
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld d, [hl]
	call Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	bit 7, a
	; a = zero ? $3d : $3c
	ld a, $3d
	jr z, .asm_cd8e8
	dec a
.asm_cd8e8
	call ReinitBattleAnimFrameset
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	inc [hl]
	inc [hl]
	ld a, [hl]
	and $1f
	ret nz
	jp BattleAnim_IncAnonJumptableIndex

BattleAnimFunction_18:
	call BattleAnim_AnonJumptable
	dw .zero
	dw .one

.zero
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld [hl], $28
	inc hl
	ld [hl], 0
.one
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld d, [hl]
	push af
	push de
	call Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	and a
	jp z, DeinitBattleAnimation
	ld d, a
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld e, [hl]
	ld hl, -$80
	add hl, de
	ld e, l
	ld d, h
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld [hl], e
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld [hl], d
	ret

BattleAnimFunction_19:
	call BattleAnim_AnonJumptable
	dw .zero
	dw .one_or_three
	dw .two
	dw .one_or_three
	dw .four

.zero
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld [hl], 0
	jr .one_or_three

.two
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $88
	jr .asm_cd985

.four
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $b8
.asm_cd985
	jp nc, DeinitBattleAnimation
.asm_cd988
	call .one_or_three
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	inc [hl]
	ld a, [hl]
	and 1
	ret nz
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	dec [hl]
	ret

.one_or_three
	call .asm_cd9f4
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	push af
	push de
	call Sine
	sra a
	sra a
	sra a
	sra a
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	add [hl]
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	sub 8
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_cd9d7
	cp $c2
	jr c, .asm_cd9e2
.asm_cd9d7
	dec a
	ld [hl], a
	and 7
	ret nz
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	inc [hl]
	ret

.asm_cd9e2
	xor a
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hli], a
	ld [hl], a
	ret

.asm_cd9f4
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld e, [hl]
	ld d, 0
	ld hl, .unk_cda01
	add hl, de
	ld d, [hl]
	ret

.unk_cda01
	db 8, 6, 5, 4, 5, 6, 8, 12, 16

BattleAnimFunction_1C:
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $30
	jp c, DeinitBattleAnimation

.asm_cda17
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and $f
	ld e, a
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	sub e
	ld [hl], a
	srl e
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
.asm_cda2c
	inc [hl]
	dec e
	jr nz, .asm_cda2c
	ret

BattleAnimFunction_1F:
	call BattleAnim_AnonJumptable
	dw GenericDummyFunction
	dw .one
	dw GenericDummyFunction

.one
	ld hl, BATTLEANIMSTRUCT_FRAMESET_ID
	add hl, bc
	ld a, [hl]
	inc a
	call ReinitBattleAnimFrameset
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld [hl], 8
	ret

BattleAnimFunction_LeechSeed:
	call BattleAnim_AnonJumptable
	dw .zero
	dw .one
	dw .two
	dw GenericDummyFunction

.zero
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld [hl], $40
	ret

.one
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld a, [hl]
	cp $20
	jr nc, Functioncda8d
	ld [hl], $40
	ld a, $57
	call ReinitBattleAnimFrameset
	jp BattleAnim_IncAnonJumptableIndex

.two
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_cda84
	dec [hl]
	ret

.asm_cda84
	call BattleAnim_IncAnonJumptableIndex
	ld a, $58
	jp ReinitBattleAnimFrameset

Functioncda8d:
	dec [hl]
	ld d, $20
	call Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_YFIX
	add hl, bc
	ld a, [hl]
	add a, 2
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld e, [hl]
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld d, [hl]
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld h, [hl]
	ld a, h
	and $f
	swap a
	ld l, a
	ld a, h
	and $f0
	swap a
	ld h, a
	add hl, de
	ld e, l
	ld d, h
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld [hl], e
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld [hl], d
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld a, [hl]
	and 1
	ret nz
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	dec [hl]
	ret

BattleAnimFunction_3F:
	call BattleAnim_AnonJumptable
	dw .zero
	dw .one
	dw GenericDummyFunction

.zero
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld [hl], $40
	ret

.one
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld a, [hl]
	cp $20
	jr nc, Functioncda8d
	jp BattleAnim_IncAnonJumptableIndex

BattleAnimFunction_1A:
	call BattleAnimFunction_03
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	add $f
	ld [hl], a
	ret

BattleAnimFunction_1B:
	call BattleAnim_AnonJumptable
	dw GenericDummyFunction
	dw .one
	dw .two
	dw .three
	dw .four

.one
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	ld a, [hl]
	cp $30
	jr c, .asm_cdb24
	ld hl, BATTLEANIMSTRUCT_ANON_JT_INDEX
	add hl, bc
	ld [hl], 0
	ret

.asm_cdb24
	add a, 4
	ld [hl], a
	ret

.two
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $98
	ret nc
	inc [hl]
	inc [hl]
	ld hl, BATTLEANIMSTRUCT_FLAGS
	add hl, bc
	set 0, [hl]
	ld hl, BATTLEANIMSTRUCT_YFIX
	add hl, bc
	ld [hl], $90
	ld hl, BATTLEANIMSTRUCT_FRAME
	add hl, bc
	ld [hl], 0
	ld hl, BATTLEANIMSTRUCT_DURATION
	add hl, bc
	ld [hl], 2
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	dec [hl]
	ret

.three
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld [hl], $2c
	ld hl, BATTLEANIMSTRUCT_FRAME
	add hl, bc
	ld [hl], 0
	ld hl, BATTLEANIMSTRUCT_DURATION
	add hl, bc
	ld [hl], $80
.four
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $98
	ret nc
	inc [hl]
	inc [hl]
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	inc [hl]
	ld d, 8
	call Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ret

BattleAnimFunction_1D:
	call BattleAnim_AnonJumptable
	dw .zero
	dw .one
	dw .two
	dw .three
	dw GenericDummyFunction
	dw DeinitBattleAnimation
	dw .six
	dw .seven
	dw .eight
	dw .nine
	dw GenericDummyFunction
	dw .eleven
	dw .twelve
	dw GenericDummyFunction

.zero
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld [hl], $28
	inc hl
	ld [hl], $10
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_ANON_JT_INDEX
	add hl, bc
	ld [hl], a
	ret

.one
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $40
	jr nc, .asm_cdbcb
	inc [hl]
	jr .asm_cdbcb

.six
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $4b
	jr nc, .asm_cdbcb
	inc [hl]
.asm_cdbcb
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hli]
	ld d, [hl]
	call Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	inc [hl]
	ld a, [hl]
	and $3f
	ret nz
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld [hl], $20
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld a, [hl]
	sub 8
	ld [hl], a
	ret nz
	xor a
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld [hli], a
	ld [hl], a
	jr .increment_jumptable_index

.two
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $88
	jr nc, .increment_jumptable_index_twice
	and $f
	jr nz, .asm_cdbfa
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld [hl], $10
.increment_jumptable_index
	jp BattleAnim_IncAnonJumptableIndex

.increment_jumptable_index_twice
	call BattleAnim_IncAnonJumptableIndex
	inc [hl]
	ret

.three
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_cdbf5
	dec [hl]
	ret

.asm_cdbf5
	ld hl, BATTLEANIMSTRUCT_ANON_JT_INDEX
	add hl, bc
	dec [hl]
.asm_cdbfa
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	inc [hl]
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	ld d, [hl]
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld e, [hl]
	ld hl, -$80
	add hl, de
	ld e, l
	ld d, h
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	ld [hl], d
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld [hl], e
	ret

.seven
	ld a, $4e
	call ReinitBattleAnimFrameset
	jr .increment_jumptable_index

.eight
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	inc [hl]
	inc [hl]
	ld d, 2
	call Sine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ret

.nine
	ld a, $50
	call ReinitBattleAnimFrameset
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], 4
	jr .increment_jumptable_index

.eleven
	ld a, $4f
	call ReinitBattleAnimFrameset
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld [hl], $40
	ret

.twelve
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	ld d, $20
	call Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	cp $30
	jp c, BattleAnim_IncAnonJumptableIndex
	dec [hl]
	ret

BattleAnimFunction_21:
	call BattleAnim_AnonJumptable
	dw .zero
	dw .one

.zero
	ldh a, [hBattleTurn]
	and a
	jr z, .asm_cdcd9
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	cpl
	add a, 3
	ld [hl], a
.asm_cdcd9
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld [hl], 8
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, $59
	add [hl]
	jp ReinitBattleAnimFrameset

.one
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	and a
	jp z, DeinitBattleAnimation
	dec [hl]
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld a, [hl]
	inc [hl]
	inc [hl]
	ld d, $10
	call Sine
	ld d, a
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_cdd20
	dec a
	ret z
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], d
	ret

.asm_cdd20
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld a, d
	cpl
	inc a
	ld [hl], a
	ret

BattleAnimFunction_22:
	call BattleAnim_AnonJumptable
	dw .zero
	dw .one

.zero
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and $3f
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and $80
	rlca
	ld [hl], a
	add $5d
	jp ReinitBattleAnimFrameset

.one
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	swap a
	ld d, a
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld a, [hl]
	inc [hl]
	push af
	push de
	call Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $80
	ret nc
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld a, [hl]
	and 3
	jr nz, .asm_cdd87
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	dec [hl]
.asm_cdd87
	and 1
	ret nz
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	inc [hl]
	ret

BattleAnimFunction_23:
	call BattleAnim_AnonJumptable
	dw .zero
	dw .one

.zero
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_FRAMESET_ID
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and $80
	rlca
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	add [hl]
	call ReinitBattleAnimFrameset
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and $7f
	ld [hl], a
.one
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	ld d, $10
	push af
	push de
	call Sine
	sra a
	sra a
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	inc [hl]
	and $3f
	jr z, .asm_cddf0
	and $1f
	ret nz
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	inc a
	jr .reinit_battle_anim_frameset

.asm_cddf0
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
.reinit_battle_anim_frameset
	jp ReinitBattleAnimFrameset

BattleAnimFunction_24:
	call BattleAnim_AnonJumptable
	dw .zero
	dw GenericDummyFunction
	dw DeinitBattleAnimation

.zero
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	add $63
	call ReinitBattleAnimFrameset
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld e, [hl]
	ld d, 0
	ld hl, .unk_cde25
	add hl, de
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ret

.unk_cde25
	db $ec, $f8, $00

BattleAnimFunction_25:
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	inc [hl]
	inc [hl]
	ld d, 4
	call Sine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld d, [hl]
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld e, [hl]
	ld hl, $ffa0
	add hl, de
	ld e, l
	ld d, h
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], d
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld [hl], e
	ret

BattleAnimFunction_26:
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	dec [hl]
	dec [hl]
	ld d, $10
	call Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	inc [hl]
	ret

BattleAnimFunction_27:
	call BattleAnim_AnonJumptable
	dw .zero
	dw GenericDummyFunction

.zero
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .asm_cde83
	ld hl, BATTLEANIMSTRUCT_FLAGS
	add hl, bc
	set 6, [hl]
.asm_cde83
	add $6a
	jp ReinitBattleAnimFrameset

BattleAnimFunction_28:
	call BattleAnim_AnonJumptable
	dw .zero
	dw .one

.zero
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld [hl], 0
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld e, [hl]
	ld a, e
	and $70
	swap a
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld a, e
	and $80
	jr nz, .asm_cdeb2
	ld a, e
	and $f
	ld [hl], a
	ret

.asm_cdeb2
	ld a, e
	and $f
	cpl
	inc a
	ld [hl], a
	ld a, $6e
	jp ReinitBattleAnimFrameset

.one
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_cdec9
	dec [hl]
	ret

.asm_cdec9
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld a, [hl]
	cpl
	inc a
	ld [hl], a
	ret

BattleAnimFunction_SpiralDescent:
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	ld d, $18
	push af
	push de
	call Sine
	sra a
	sra a
	sra a
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	add [hl]
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	inc [hl]
	ld a, [hl]
	and 7
	ret nz
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld a, [hl]
	cp $28
	jp nc, DeinitBattleAnimation
	inc [hl]
	ret

BattleAnimFunction_2D:
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	ld d, $18
	push af
	push de
	call Sine
	sra a
	sra a
	sra a
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	add [hl]
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	inc [hl]
	ld a, [hl]
	and 3
	ret nz
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld a, [hl]
	cp $28
	jp nc, DeinitBattleAnimation
	inc [hl]
	ret

BattleAnimFunction_PoisonGas:
	call BattleAnim_AnonJumptable
	dw .zero
	dw BattleAnimFunction_SpiralDescent

.zero
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $84
	jp nc, BattleAnim_IncAnonJumptableIndex
	inc [hl]
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	inc [hl]
	ld d, $18
	call Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	and 1
	ret nz
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	dec [hl]
	ret

BattleAnimFunction_34:
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	ld d, $18
	push af
	push de
	call Sine
	sra a
	sra a
	sra a
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	add [hl]
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	inc [hl]
	inc [hl]
	ld a, [hl]
	and 7
	ret nz
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld a, [hl]
	cp $e8
	jp z, DeinitBattleAnimation
	dec [hl]
	ret

BattleAnimFunction_3C:
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	ld d, $18
	push af
	push de
	call Sine
	sra a
	sra a
	sra a
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	add [hl]
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	inc [hl]
	inc [hl]
	ld a, [hl]
	and 3
	ret nz
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld a, [hl]
	cp $d0
	jp z, DeinitBattleAnimation
	dec [hl]
	dec [hl]
	ret

BattleAnimFunction_35:
	call BattleAnim_AnonJumptable
	dw .zero
	dw .one
	dw DeinitBattleAnimation

.zero
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld [hl], $34
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld [hl], $10
.one
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $6c
	ret nc
	ld a, 2
	call BattleAnim_ShiftCoordsRightUpHalved
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld d, [hl]
	call Sine
	bit 7, a
	jr nz, .asm_ce046
	cpl
	inc a
.asm_ce046
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	sub 4
	ld [hl], a
	and $1f
	cp $20
	ret nz
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	srl [hl]
	ret

BattleAnimFunction_Horn:
	call BattleAnim_AnonJumptable
	dw .zero
	dw .one
	dw .two
	dw .three

.zero
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_ANON_JT_INDEX
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld [hl], a
	ret

.one
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $58
	ret nc
	ld a, 2
	jp BattleAnim_ShiftCoordsRightUpHalved

.two
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld a, [hl]
	cp $20
	jp nc, DeinitBattleAnimation

.three
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld a, [hl]
	ld d, 8
	call Sine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	sra a
	cpl
	inc a
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	add [hl]
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld a, [hl]
	add a, 8
	ld [hl], a
	ret

BattleAnimFunction_2C:
	call BattleAnim_AnonJumptable
	dw .zero
	dw .one
	dw .two

.zero
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and $f0
	swap a
	ld hl, BATTLEANIMSTRUCT_ANON_JT_INDEX
	add hl, bc
	ld [hl], a
	ret

.one
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	ld d, $10
	call Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	bit 7, a
	jr z, .asm_ce0f0
	ld [hl], a
.asm_ce0f0
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	sub 4
	ld [hl], a
.two
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $84
	jp nc, DeinitBattleAnimation
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	jp BattleAnim_ShiftCoordsRightUpHalved

BattleAnimFunction_2E:
	call BattleAnim_AnonJumptable
	dw .zero
	dw .one

.zero
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld [hl], $28
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	ld a, [hl]
	sub $28
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld [hl], a
.one
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hli]
	ld d, [hl]
	call Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	and [hl]
	jr nz, .asm_ce149
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	dec [hl]
.asm_ce149
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	inc [hl]
	ld a, [hl]
	and $3f
	ret nz
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld [hl], $20
	inc hl
	srl [hl]
	ret

BattleAnimFunction_2F:
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld d, [hl]
	push af
	push de
	call Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	inc [hl]
	ld a, [hl]
	and 1
	jr nz, .asm_ce189
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	dec [hl]
.asm_ce189
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and 3
	jr nz, .asm_ce197
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	inc [hl]
.asm_ce197
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	cp $5a
	jr nc, .asm_ce1aa
	ld a, [hl]
	and a
	jp z, DeinitBattleAnimation
	dec [hl]
	ret

.asm_ce1aa
	inc [hl]
	ret

BattleAnimFunction_42:
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	inc [hl]
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld d, [hl]
	push af
	push de
	call Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld a, [hl]
	inc [hl]
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	cp $40
	jr nc, .asm_ce1df
	inc [hl]
	ret

.asm_ce1df
	ld a, [hl]
	dec [hl]
	and a
	ret nz
	jp DeinitBattleAnimation

BattleAnimFunction_30:
	call BattleAnim_AnonJumptable
	dw .zero
	dw .one

.zero
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld [hl], a
.one
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	ld d, $30
	call Sine
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	add [hl]
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	add a, 8
	ld d, $30
	call Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	inc [hl]
	ret

BattleAnimFunction_31:
	call BattleAnim_AnonJumptable
	dw .start
	dw GenericDummyFunction

.start
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	push af
	ld d, $10
	call Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop af
	ld d, $10
	call Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld [hl], $f
	ret

BattleAnimFunction_32:
	call BattleAnim_AnonJumptable
	dw .zero
	dw .one
	dw .two
	dw .three

.zero
	call BattleAnim_IncAnonJumptableIndex
	ldh a, [hBattleTurn]
	and a
	; a = zero ? $f0 : $cc
	ld a, $f0
	jr z, .asm_ce26e
	ld a, $cc
.asm_ce26e
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld [hl], a
	ret

.two
	call .one
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $84
	ret nc
	ld a, 4
	jp BattleAnim_ShiftCoordsRightUpHalved

.three
	call .one
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $d0
	jp nc, DeinitBattleAnimation
	ld a, 4
	jp BattleAnim_ShiftCoordsRightUpHalved

.one
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld a, [hl]
	and 7
	inc [hl]
	srl a
	ld e, a
	ld d, 0
	ld hl, .unk_ce2c4
	add hl, de
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	and [hl]
	ld [wOBP0], a
	ret

.unk_ce2c4
	db $ff, $aa, $55, $aa

BattleAnimFunction_33:
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	ld d, $18
	call Sine
	sra a
	sra a
	sra a
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	add [hl]
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	inc [hl]
	ld d, $18
	call Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	dec [hl]
	dec [hl]
	ret

BattleAnimFunction_36:
	call BattleAnim_AnonJumptable
	dw .zero
	dw .one
	dw .two

.zero
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld a, [hl]
	cp $e0
	jr nz, .asm_ce319
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld [hl], 2
	ret

.asm_ce319
	ld d, a
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld e, [hl]
	ld hl, -$80
	add hl, de
	ld e, l
	ld d, h
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], d
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld [hl], e
	ret

.one
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_ce33a
	dec [hl]
	ret

.asm_ce33a
	ld [hl], 4
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	cpl
	inc a
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	add [hl]
	ld [hl], a
	ret

.two
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $84
	jp nc, DeinitBattleAnimation
	ld a, 4
	jp BattleAnim_ShiftCoordsRightUpHalved

BattleAnimFunction_37:
	call BattleAnim_AnonJumptable
	dw .zero
	dw .one

.zero
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and $7f
	add $81
	call ReinitBattleAnimFrameset
.one
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	bit 7, [hl]
	jr nz, .asm_ce383
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	inc [hl]
	ret

.asm_ce383
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	dec [hl]
	ret

BattleAnimFunction_38:
	call BattleAnim_AnonJumptable
	dw .zero
	dw .one
	dw .two

.zero
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld [hl], $c
	ret

.one
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_ce3a6
	dec [hl]
	ret

.asm_ce3a6
	call BattleAnim_IncAnonJumptableIndex
	ld a, $20
	call ReinitBattleAnimFrameset
.two
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	dec [hl]
	ret

BattleAnimFunction_39:
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	inc [hl]
	inc [hl]
	push af
	ld d, 2
	call Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop af
	ld d, 8
	call Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ret

BattleAnimFunction_3A:
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld a, [hl]
	cp $20
	jp nc, DeinitBattleAnimation
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	ld d, 8
	call Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	add a, 2
	ld [hl], a
	and 7
	ret nz
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	inc [hl]
	ret

BattleAnimFunction_3B:
	call BattleAnim_AnonJumptable
	dw .zero
	dw DeinitBattleAnimation

.zero
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	add [hl]
	ld [hl], a
	ret

BattleAnimFunction_3D:
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	ld d, $18
	push af
	push de
	call Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	sra a
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	inc [hl]
	ret

BattleAnimFunction_3E:
	call BattleAnim_AnonJumptable
	dw .zero
	dw .one
	dw .two

.zero
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld [hl], $28
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and $f
	ld hl, BATTLEANIMSTRUCT_FRAMESET_ID
	add hl, bc
	add [hl]
	call ReinitBattleAnimFrameset
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and $f0
	or 8
	ld [hl], a
.one
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_ce48b
	dec [hl]
	add a, 8
	ld d, a
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	push af
	push de
	call Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ret

.asm_ce48b
	ld [hl], $10
	call BattleAnim_IncAnonJumptableIndex
.two
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	dec [hl]
	and a
	ret nz
	jp DeinitBattleAnimation

BattleAnimFunction_40:
	call BattleAnim_AnonJumptable
	dw .zero
	dw .one

.zero
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, $24
	add [hl]
	call ReinitBattleAnimFrameset
.one
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld a, [hl]
	cp $38
	jp nc, DeinitBattleAnimation
	inc [hl]
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	inc [hl]
	ld d, $18
	call Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	ld a, [hl]
	and 1
	ret nz
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	dec [hl]
	ret

BattleAnimFunction_41:
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and a
	ret z
	ld d, a
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	inc [hl]
	call Sine
	bit 7, a
	jr nz, .asm_ce4f4
	cpl
	inc a
.asm_ce4f4
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	and $1f
	ret nz
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	srl [hl]
	ret

BattleAnimFunction_43:
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	cp $10
	jp nc, DeinitBattleAnimation
	inc [hl]
	inc [hl]
	ld d, a
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	push af
	push de
	call Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ret

BattleAnimFunction_44:
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld e, [hl]
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld d, [hl]
	ld a, e
	and $c0
	rlca
	rlca
	add [hl]
	ld [hl], a
	ld a, e
	and $3f
	push af
	push de
	call Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ret

BattleAnimFunction_45:
	call BattleAnim_AnonJumptable
	dw .zero
	dw .one
	dw .two

.zero
	ld d, $18
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	inc [hl]
	jr .asm_ce58f

.one
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld [hl], $18
.two
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	cp $80
	jp nc, DeinitBattleAnimation
	ld d, a
	add a, 8
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
.asm_ce58f
	jp BattleAnim_ApplyAngularOffset_HorizontalFlattening

BattleAnimFunction_46:
	call BattleAnim_AnonJumptable
	dw GenericDummyFunction
	dw .one

.one
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $30
	jp c, DeinitBattleAnimation
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	dec [hl]
	dec [hl]
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	inc [hl]
	inc [hl]
	ret

BattleAnimFunction_47:
	ld d, $50
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	inc [hl]
	inc [hl]
	push af
	push de
	call Sine
	sra a
	sra a
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	add [hl]
	inc [hl]
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ret

BattleAnimFunction_48:
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld a, [hl]
	cp $d0
	jp z, DeinitBattleAnimation
	rept 4
		dec [hl]
	endr
	ret

BattleAnimFunction_49:
	call BattleAnim_AnonJumptable
	dw .zero
	dw .one
	dw .two
	dw DeinitBattleAnimation

.zero
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .asm_ce61c
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], $ec
.one
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld a, [hl]
	cp $4
	jp z, DeinitBattleAnimation
	rept 4
		inc [hl]
	endr
	ret

.asm_ce61c
	call BattleAnim_IncAnonJumptableIndex
	call BattleAnim_IncAnonJumptableIndex
.two
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld a, [hl]
	cp $d8
	ret z
	rept 4
		dec [hl]
	endr
	ret

BattleAnimFunction_4A:
	call BattleAnim_AnonJumptable
	dw .zero
	dw .one
	dw .two
	dw .three

.zero
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_ANON_JT_INDEX
	add hl, bc
	ld [hl], a
	jp BattleAnim_IncAnonJumptableIndex

.one
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld a, [hl]
	add a, 4
	cp $70
	jr c, .asm_ce654
	xor a
.asm_ce654
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	inc [hl]
	inc [hl]
	ret

.two
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld a, [hl]
	add a, 4
	cp $70
	jr c, .asm_ce668
	xor a
.asm_ce668
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld a, [hl]
	add a, 8
	ld [hl], a
	ret

.three
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld a, [hl]
	add a, 4
	cp $70
	jr c, .asm_ce67e
	xor a
.asm_ce67e
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld a, [hl]
	add a, 4
	ld [hl], a
	ret

BattleAnimFunction_4B:
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld d, [hl]
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld e, [hl]
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	ld l, a
	and $f0
	ld h, a
	swap a
	or h
	ld h, a
	ld a, l
	and $f
	swap a
	ld l, a
	add hl, de
	ld e, l
	ld d, h
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld [hl], d
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld [hl], e
	ret

BattleAnimFunction_4C:
	ld d, 24
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld a, [hl]
	inc [hl]
	jp BattleAnim_ApplyAngularOffset_HorizontalFlattening

BattleAnimFunction_4D:
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	cp $20
	jp nc, DeinitBattleAnimation
	inc [hl]
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	ld d, [hl]
	call Sine
	cpl
	inc a
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ret

BattleAnimFunction_4F:
	ld d, 24
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld a, [hl]
	inc [hl]
	srl a
	ld hl, BATTLEANIMSTRUCT_PARAM
	add hl, bc
	add a, [hl]
	jp BattleAnim_ApplyAngularOffset_HorizontalFlattening
