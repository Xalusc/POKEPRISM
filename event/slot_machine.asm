SLOTS_NOMATCH EQU -1
SLOTS_SEVEN EQU $00
SLOTS_POKEBALL EQU $04
SLOTS_CHERRY EQU $08
SLOTS_PIKACHU EQU $0c
SLOTS_SQUIRTLE EQU $10
SLOTS_STARYU EQU $14
REEL_SIZE EQU 15

_SlotMachine:
	ld hl, wOptions
	set NO_TEXT_SCROLL, [hl]
	call .InitGFX
	jr .handleLoop
.loop
	jumptable SlotsJumptable
	call Slots_SpinReels
	xor a
	ld [wCurrSpriteOAMAddr], a
	callba DoNextFrameForFirst16Sprites
	call .PrintCoinsAndPayout
.handleLoop
	call DelayFrame
	ld a, [wJumptableIndex]
	bit 7, a
	jr z, .loop
	call WaitSFX
	ld de, SFX_QUIT_SLOTS
	call PlayWaitSFX
	call ClearBGPalettes
	ld hl, wOptions
	res NO_TEXT_SCROLL, [hl]
	ld hl, rLCDC
	res 2, [hl]
	ret

.PrintCoinsAndPayout
	hlcoord 5, 1
	ld de, wCoins
	lb bc, PRINTNUM_LEADINGZEROS | 2, 4
	call PrintNum
	hlcoord 11, 1
	ld de, wPayout
	lb bc, PRINTNUM_LEADINGZEROS | 2, 4
	jp PrintNum

.InitGFX
	call ClearBGPalettes
	call ClearTileMap
	call ClearSprites
	ld de, MUSIC_NONE
	call PlayMusic
	call DelayFrame
	call DisableLCD
	hlbgcoord 0, 0
	ld bc, vWindowMap - vBGMap
	ld a, " "
	call ByteFill
	ld b, SCGB_SLOT_MACHINE
	predef GetSGBLayout
	callba ClearSpriteAnims
	ld hl, wSlots
	ld bc, wSlotsDataEnd - wSlots
	xor a
	call ByteFill

	ld hl, Slots2LZ
	ld de, vObjTiles tile $00
	call Decompress

	ld hl, Slots3LZ
	ld de, vObjTiles tile $40
	call Decompress

	ld hl, Slots1LZ
	ld de, vBGTiles tile $00
	call Decompress

	ld hl, Slots2LZ
	ld de, vBGTiles tile $25
	call Decompress

	ld hl, SlotsTilemap
	decoord 0, 0
	ld bc, SCREEN_WIDTH * 12
	rst CopyBytes

	ld hl, rLCDC
	set 2, [hl]
	call EnableLCD
	ld hl, wSlots
	ld bc, wSlotsEnd - wSlots
	xor a
	call ByteFill
	call InitReelTiles
	call Slots_GetPals
	ld a, 7
	ld hl, wSpriteAnimDict
	ld [hli], a
	ld [hl], $40
	xor a
	ld [wJumptableIndex], a
	ld a, SLOTS_NOMATCH
	ld [wSlotBias], a
	ld de, MUSIC_GAME_CORNER
	call PlayMusic
	xor a
	ld [wd002], a
	call Random
	and %00101010
	ret nz
	ld a, 1
	ld [wd002], a
	ret

Slots_GetPals:
	ld a, %11100100
	call DmgToCgbBGPals
	lb de, %11100100, %11100100
	jp DmgToCgbObjPals

SlotsJumptable:
	dw Slots_Init
	dw Slots_BetAndStart
	dw Slots_WaitStart
	dw Slots_WaitReel1
	dw Slots_WaitStopReel1
	dw Slots_WaitReel2
	dw Slots_WaitStopReel2
	dw Slots_WaitReel3
	dw Slots_WaitStopReel3
	dw Slots_Next
	dw Slots_Next
	dw Slots_Next
	dw Slots_FlashIfWin
	dw Slots_FlashScreen
	dw Slots_GiveEarnedCoins
	dw Slots_PayoutTextAndAnim
	dw Slots_PayoutAnim
	dw Slots_RestartOrQuit
	dw Slots_Quit

Slots_Next:
	ld hl, wJumptableIndex
	inc [hl]
	ret

Slots_Init:
	call Slots_Next
	xor a
	ld [wFirstTwoReelsMatching], a
	ld [wFirstTwoReelsMatchingSevens], a
	dec a
	ld [wSlotMatched], a
	ret

Slots_BetAndStart:
	call Slots_AskBet
	jr nc, .proceed
	ld a, 18
	ld [wJumptableIndex], a
	ret

.proceed
	call Slots_Next
	call Slots_IlluminateBetLights
	call Slots_InitBias
	ld a, 32
	ld [wcf64], a
	ld a, 4
	ld [wReel1ReelAction], a
	ld [wReel2ReelAction], a
	ld [wReel3ReelAction], a
	ld [wReel1Slot09], a
	ld [wReel2Slot09], a
	ld [wReel3Slot09], a
	call WaitSFX
	ld a, SFX_SLOT_MACHINE_START
	jp Slots_PlaySFX

Slots_WaitStart:
	ld hl, wcf64
	ld a, [hl]
	and a
	jr z, .proceed
	dec [hl]
	ret

.proceed
	call Slots_Next
	xor a
	ldh [hJoypadSum], a
	ret

Slots_WaitReel1:
	ld hl, hJoypadSum
	ld a, [hl]
	and A_BUTTON
	ret z
	call Slots_Next
	call Slots_StopReel1
	ld [wReel1ReelAction], a
Slots_WaitStopReel1:
	ld a, [wReel1ReelAction]
	and a
	ret nz
	ld a, SFX_STOP_SLOT
	call Slots_PlaySFX
	ld bc, wReel1
	ld de, wReel1Stopped
	call Slots_WaitStopNextReel
Slots_WaitReel2:
	ld hl, hJoypadSum
	ld a, [hl]
	and A_BUTTON
	ret z
	call Slots_Next
	call Slots_StopReel2
	ld [wReel2ReelAction], a
Slots_WaitStopReel2:
	ld a, [wReel2ReelAction]
	and a
	ret nz
	ld a, SFX_STOP_SLOT
	call Slots_PlaySFX
	ld bc, wReel2
	ld de, wReel2Stopped
	call Slots_WaitStopNextReel
Slots_WaitReel3:
	ld hl, hJoypadSum
	ld a, [hl]
	and A_BUTTON
	ret z
	call Slots_Next
	call Slots_StopReel3
	ld [wReel3ReelAction], a
Slots_WaitStopReel3:
	ld a, [wReel3ReelAction]
	and a
	ret nz
	ld a, SFX_STOP_SLOT
	call Slots_PlaySFX
	ld bc, wReel3
	ld de, wReel3Stopped
Slots_WaitStopNextReel:
	call Slots_LoadReelState
	call Slots_Next
	xor a
	ldh [hJoypadSum], a
	ret

Slots_FlashIfWin:
	ld a, [wSlotMatched]
	inc a
	jr nz, .GotIt
	call Slots_Next
	jp Slots_Next

.GotIt
	call Slots_Next
	ld a, 16
	ld [wcf64], a
Slots_FlashScreen:
	ld hl, wcf64
	ld a, [hl]
	and a
	jr z, .done
	dec [hl]
	srl a
	ret z

	ldh a, [rOBP0]
	cpl
	ld e, a
	ld d, a
	jp DmgToCgbObjPals

.done
	call Slots_GetPals
	jp Slots_Next

Slots_GiveEarnedCoins:
	xor a
	ld [wFirstTwoReelsMatching], a
	ld [wFirstTwoReelsMatchingSevens], a
	ld a, %11100100
	call DmgToCgbBGPals
	call SlotGetPayout
	xor a
	ld [wcf64], a
	jp Slots_Next

Slots_PayoutTextAndAnim:
	call SlotPayoutText
	call Slots_Next
Slots_PayoutAnim:
	ld hl, wcf64
	ld a, [hl]
	inc [hl]
	rra
	ret nc
	ld hl, wPayout
	ld a, [hli]
	ld d, a
	or [hl]
	jp z, Slots_Next
	ld e, [hl]
	dec de
	ld [hl], e
	dec hl
	ld [hl], d
	ld hl, wCoins
	ld d, [hl]
	inc hl
	ld e, [hl]
	call Slot_CheckCoinCaseFull
	jr c, .okay
	inc de
.okay
	ld [hl], e
	dec hl
	ld [hl], d
	ld a, [wcf64]
	and 7
	ret nz
	ld de, SFX_GET_COIN_FROM_SLOTS
	jp PlaySFX

Slots_RestartOrQuit:
	call Slots_DeilluminateBetLights
	call WaitPressAorB_BlinkCursor
	call Slots_AskPlayAgain
	jr c, .exit_slots
	xor a
	ld [wJumptableIndex], a
	ret

.exit_slots
	ld a, 18
	ld [wJumptableIndex], a
	ret

Slots_Quit:
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

Slots_LoadReelState:
	push de
	call Slots_GetCurrentReelState
	pop de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	ret

Slot_CheckCoinCaseFull:
	ld a, d
	cp HIGH(9999)
	jr c, .not_full
	ld a, e
	cp LOW(9999)
	ccf
	ret

.not_full
	and a
	ret

Slots_GetCurrentReelState:
	ld hl, wReel1Position - wReel1
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .okay
	ld a, $f
.okay
	dec a
	and $f
	ld e, a
	ld d, 0
	ld hl, wReel1TilemapAddr - wReel1
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	add hl, de
	ret

Slots_StopReel1:
	ld a, 7
	ret

Slots_StopReel2:
	ld a, [wSlotBet]
	cp 2
	jr c, .dont_jump
	ld a, [wSlotBias]
	and a
	jr z, .skip
	assert SLOTS_NOMATCH == -1
	inc a
	jr nz, .dont_jump
.skip
	call .CheckReel1ForASeven
	jr nz, .dont_jump
	call Random
	cp 80 ; 32%
	jr nc, .dont_jump
	ld a, 10
	ret

.dont_jump
	ld a, 8
	ret

.CheckReel1ForASeven:
	ld a, [wReel1Stopped]
	and a
	ret z
	ld a, [wReel1Stopped + 1]
	and a
	ret z
	ld a, [wReel1Stopped + 2]
	and a
	ret

Slots_StopReel3:
	ld a, [wFirstTwoReelsMatching]
	and a
	jr z, .stop
	ld a, [wFirstTwoReelsMatchingSevens]
	and a
	jr z, .stop
	ld a, [wSlotBias]
	and a
	jr nz, .biased
	call Random
	cp 180
	jr nc, .stop
	cp 120
	jr nc, .slow_advance
	cp 60
	jr nc, .golem
	ld a, 21
	ret

.biased
	call Random
	cp 160
	jr nc, .stop
	cp 80
	jr nc, .slow_advance
.golem
	ld a, 18
	ret

.slow_advance
	ld a, 16
	ret

.stop
	ld a, 9
	ret

InitReelTiles:
	ld bc, wReel1
	ld hl, wReel1OAMAddr - wReel1
	add hl, bc
	ld de, wSprites + 16 * 4
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, wReel1TilemapAddr - wReel1
	add hl, bc
	ld de, Reel1Tilemap
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, wReel1XCoord - wReel1
	add hl, bc
	ld [hl], 6 * 8
	call .OAM

	ld bc, wReel2
	ld hl, wReel1OAMAddr - wReel1
	add hl, bc
	ld de, wSprites + 24 * 4
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, wReel1TilemapAddr - wReel1
	add hl, bc
	ld de, Reel2Tilemap
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, wReel1XCoord - wReel1
	add hl, bc
	ld [hl], 10 * 8
	call .OAM

	ld bc, wReel3
	ld hl, wReel1OAMAddr - wReel1
	add hl, bc
	ld de, wSprites + 32 * 4
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, wReel1TilemapAddr - wReel1
	add hl, bc
	ld de, Reel3Tilemap
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, wReel1XCoord - wReel1
	add hl, bc
	ld [hl], 14 * 8
.OAM:
	ld hl, wReel1ReelAction - wReel1
	add hl, bc
	ld [hl], 0
	ld hl, wReel1Position - wReel1
	add hl, bc
	ld [hl], REEL_SIZE - 1
	ld hl, wReel1SpinDistance - wReel1
	add hl, bc
	ld [hl], 0
	jp UpdateReelPositionAndOAM

Slots_SpinReels:
	ld bc, wReel1
	call .SpinReel
	ld bc, wReel2
	call .SpinReel
	ld bc, wReel3
.SpinReel
	ld hl, wReel1SpinDistance - wReel1
	add hl, bc
	ld a, [hl]
	and $f
	call z, DoReelAction
	ld hl, wReel1SpinRate - wReel1
	add hl, bc
	ld a, [hl]
	and a
	ret z
	ld d, a
	ld hl, wReel1SpinDistance - wReel1
	add hl, bc
	add [hl]
	ld [hl], a
	and $f
	jr z, UpdateReelPositionAndOAM
	ld hl, wReel1OAMAddr - wReel1
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld e, 8
.loop
	ld a, [hl]
	add d
	ld [hli], a
	inc hl
	inc hl
	inc hl
	dec e
	jr nz, .loop
	ret

UpdateReelPositionAndOAM:
	ld hl, wReel1XCoord - wReel1
	add hl, bc
	ld a, [hl]
	ld hl, wCurrReelXCoord
	ld [hli], a
	ld [hl], 10 * 8
	ld hl, wReel1Position - wReel1
	add hl, bc
	ld e, [hl]
	ld d, 0
	ld hl, wReel1TilemapAddr - wReel1
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	add hl, de
	ld e, l
	ld d, h
	call .LoadOAM
	ld hl, wReel1Position - wReel1
	add hl, bc
	ld a, [hl]
	inc a
	and $f
	cp REEL_SIZE
	jr nz, .load
	xor a
.load
	ld [hl], a
	ret

.LoadOAM:
	ld hl, wReel1OAMAddr - wReel1
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
.loop
	ld a, [wCurrReelYCoord]
	ld [hli], a
	ld a, [wCurrReelXCoord]
	ld [hli], a
	ld a, [de]
	ld [hli], a
	srl a
	srl a
	set 7, a
	ld [hli], a

	ld a, [wCurrReelYCoord]
	ld [hli], a
	ld a, [wCurrReelXCoord]
	add 1 * 8
	ld [hli], a
	ld a, [de]
	add a, 2
	ld [hli], a
	srl a
	srl a
	set 7, a
	ld [hli], a
	inc de
	ld a, [wCurrReelYCoord]
	sub 2 * 8
	ld [wCurrReelYCoord], a
	cp 2 * 8
	jr nz, .loop
	ret

DoReelAction:
	ld hl, wReel1ReelAction - wReel1
	add hl, bc
	ld a, [hl]
	jumptable

.Jumptable
	dw GenericDummyFunction
	dw Slots_StopReelIgnoreJoypad
	dw ReelAction_QuadrupleRate
	dw ReelAction_DoubleRate
	dw ReelAction_NormalRate
	dw ReelAction_HalfRate
	dw ReelAction_QuarterRate
	dw ReelAction_StopReel1
	dw ReelAction_StopReel2
	dw ReelAction_StopReel3
	dw ReelAction_SetUpReel2SkipTo7
	dw ReelAction_WaitReel2SkipTo7
	dw ReelAction_FastSpinReel2UntilLinedUp7s
	dw ReelAction_BoringReelDrops
	dw ReelAction_CheckDropReel
	dw ReelAction_WaitDropReel
	dw ReelAction_StartSlowAdvanceReel3
	dw ReelAction_WaitSlowAdvanceReel3
	dw ReelAction_InitGolem
	dw ReelAction_WaitGolem
	dw ReelAction_EndGolem
	dw Slots_InitChansey
	dw ReelAction_WaitChansey
	dw ReelAction_WaitEgg
	dw ReelAction_DropReel

ReelAction_QuadrupleRate:
	ld a, $10
	jr ReelAction_ChangeRate

ReelAction_DoubleRate:
	ld a, 8
	jr ReelAction_ChangeRate

ReelAction_NormalRate:
	ld a, 4
	jr ReelAction_ChangeRate

ReelAction_HalfRate:
	ld a, 2
	jr ReelAction_ChangeRate

ReelAction_QuarterRate:
	ld a, 1
ReelAction_ChangeRate:
	ld hl, wReel1SpinRate - wReel1
	add hl, bc
	ld [hl], a
	ret

Slots_StopReel:
	xor a
	call ReelAction_ChangeRate
	ld hl, wReel1ReelAction - wReel1
	add hl, bc
	ld [hl], 1
	ld hl, wReel1Slot0f - wReel1
	add hl, bc
	ld [hl], 3
Slots_StopReelIgnoreJoypad:
	ld hl, wReel1Slot0f - wReel1
	add hl, bc
	ld a, [hl]
	and a
	jr z, .EndReel
	dec [hl]
	ret

.EndReel
	ld hl, wReel1ReelAction - wReel1
	add hl, bc
	ld [hl], a ;a is 0
	ret

ReelAction_StopReel1:
	ld a, [wSlotBias]
	cp SLOTS_NOMATCH
	jr z, .NoBias
	ld hl, wReel1Slot09 - wReel1
	add hl, bc
	ld a, [hl]
	and a
	jr z, .NoBias
	dec [hl]
	call .CheckForBias
	ret nz
.NoBias
	jr Slots_StopReel

.CheckForBias
	call Slots_GetCurrentReelState
	ld a, [wSlotBias]
	ld e, a
	ld a, [hli]
	cp e
	ret z
	ld a, [hli]
	cp e
	ret z
	ld a, [hl]
	cp e
	ret

ReelAction_StopReel2:
	call Slots_CheckMatchedFirstTwoReels
	jr nc, .nope
	ld a, [wSlotBuildingMatch]
	ld hl, wSlotBias
	cp [hl]
	jr z, Slots_StopReel
.nope
	ld a, [wSlotBias]
	assert SLOTS_NOMATCH == -1
	inc a
	jr z, Slots_StopReel
	ld hl, wReel1Slot09 - wReel1
	add hl, bc
	ld a, [hl]
	and a
	jr z, Slots_StopReel
	dec [hl]
	ret

ReelAction_StopReel3:
	call Slots_CheckMatchedAllThreeReels
	jr nc, .NoMatch
	ld hl, wSlotBias
	cp [hl]
	jr z, Slots_StopReel
	ld hl, wReel1Slot09 - wReel1
	add hl, bc
	ld a, [hl]
	and a
	ret z
	dec [hl]
	ret

.NoMatch
	ld a, [wSlotBias]
	assert SLOTS_NOMATCH == -1
	inc a
.stop_reel
	jr z, Slots_StopReel
	ld hl, wReel1Slot09 - wReel1
	add hl, bc
	ld a, [hl]
	and a
	jr z, .stop_reel
	dec [hl]
	ret

ReelAction_SetUpReel2SkipTo7:
	call Slots_CheckMatchedFirstTwoReels
	jr nc, .no_match
	ld a, [wFirstTwoReelsMatchingSevens]
	and a
	jp nz, Slots_StopReel

.no_match
	ld a, SFX_STOP_SLOT
	call Slots_PlaySFX
	ld hl, wReel1ReelAction - wReel1
	add hl, bc
	inc [hl]
	ld hl, wReel1Slot0a - wReel1
	add hl, bc
	ld [hl], $20
	ld hl, wReel1SpinRate - wReel1
	add hl, bc
	ld [hl], 0
	ret

ReelAction_WaitReel2SkipTo7:
	ld hl, wReel1Slot0a - wReel1
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_92d02
	dec [hl]
	ret

.asm_92d02
	ld a, SFX_THROW_BALL
	call Slots_PlaySFX
	ld hl, wReel1ReelAction - wReel1
	add hl, bc
	inc [hl]
	ld hl, wReel1SpinRate - wReel1
	add hl, bc
	ld [hl], 8
	ret

ReelAction_FastSpinReel2UntilLinedUp7s:
	call Slots_CheckMatchedFirstTwoReels
	ret nc
	ld a, [wFirstTwoReelsMatchingSevens]
	and a
	ret z
	jp Slots_StopReel

ReelAction_InitGolem:
	call Slots_CheckMatchedAllThreeReels
	ret c
	ld a, SFX_STOP_SLOT
	call Slots_PlaySFX
	call Slots_WaitSFX
	ld hl, wReel1ReelAction - wReel1
	add hl, bc
	inc [hl]
	ld hl, wReel1SpinRate - wReel1
	add hl, bc
	ld [hl], 0
	call Function92fc0
	push bc
	push af
	depixel 12, 13
	ld a, SPRITE_ANIM_INDEX_SLOT_GOLEM
	call _InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_0E
	add hl, bc
	pop af
	ld [hl], a
	pop bc
	xor a
	ld [wcf64], a
ReelAction_WaitGolem:
	ld a, [wcf64]
	dec a
	jr z, .one
	dec a
	ret nz
; two
	call Slots_CheckMatchedAllThreeReels
	jp Slots_StopReel

.one
	ld hl, wReel1ReelAction - wReel1
	add hl, bc
	inc [hl]
	ld hl, wReel1SpinRate - wReel1
	add hl, bc
	ld [hl], 8
	ret

ReelAction_EndGolem:
	xor a
	ld [wcf64], a
	ld hl, wReel1ReelAction - wReel1
	add hl, bc
	dec [hl]
	ld hl, wReel1SpinRate - wReel1
	add hl, bc
	ld [hl], 0
	ret

Slots_InitChansey:
	call Slots_CheckMatchedAllThreeReels
	ret c
	ld a, SFX_STOP_SLOT
	call Slots_PlaySFX
	call Slots_WaitSFX
	ld hl, wReel1ReelAction - wReel1
	add hl, bc
	inc [hl]
	ld hl, wReel1SpinRate - wReel1
	add hl, bc
	ld [hl], 0
	push bc
	depixel 12, 0
	ld a, SPRITE_ANIM_INDEX_SLOTS_CHANSEY
	call _InitSpriteAnimStruct
	pop bc
	xor a
	ld [wcf64], a
	ret

ReelAction_WaitChansey:
	ld a, [wcf64]
	and a
	ret z
	ld hl, wReel1ReelAction - wReel1
	add hl, bc
	inc [hl]
	ld a, 2
	ld [wcf64], a
ReelAction_WaitEgg:
	ld a, [wcf64]
	cp 4
	ret c
	ld hl, wReel1ReelAction - wReel1
	add hl, bc
	inc [hl]
	ld hl, wReel1SpinRate - wReel1
	add hl, bc
	ld [hl], $10
	ld hl, wReel1Slot0a - wReel1
	add hl, bc
	ld [hl], $11
ReelAction_DropReel:
	ld hl, wReel1Slot0a - wReel1
	add hl, bc
	ld a, [hl]
	and a
	jr z, .check_match
	dec [hl]
	ret

.check_match
	call Slots_CheckMatchedAllThreeReels
	jr nc, .EggAgain
	and a
	jr nz, .EggAgain
	ld a, 5
	ld [wcf64], a
	jp Slots_StopReel

.EggAgain
	ld hl, wReel1SpinRate - wReel1
	add hl, bc
	ld [hl], 0
	ld hl, wReel1ReelAction - wReel1
	add hl, bc
	dec [hl]
	dec [hl]
	ld a, 1
	ld [wcf64], a
	ret

ReelAction_BoringReelDrops:
	call Slots_CheckMatchedAllThreeReels
	ret c
	ld a, SFX_STOP_SLOT
	call Slots_PlaySFX
	call Slots_WaitSFX
	ld hl, wReel1ReelAction - wReel1
	add hl, bc
	inc [hl]
	call Function92fc0
	ld hl, wReel1Slot0a - wReel1
	add hl, bc
	ld [hl], a
ReelAction_CheckDropReel:
	ld hl, wReel1Slot0a - wReel1
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .spin
	call Slots_CheckMatchedAllThreeReels
	jp Slots_StopReel

.spin
	dec [hl]
	ld hl, wReel1ReelAction - wReel1
	add hl, bc
	inc [hl]
	ld hl, wReel1Slot0b - wReel1
	add hl, bc
	ld [hl], $20
	ld hl, wReel1SpinRate - wReel1
	add hl, bc
	ld [hl], 0
ReelAction_WaitDropReel:
	ld hl, wReel1Slot0b - wReel1
	add hl, bc
	ld a, [hl]
	and a
	jr z, .DropReel
	dec [hl]
	ret

.DropReel
	ld hl, wReel1ReelAction - wReel1
	add hl, bc
	dec [hl]
	ld hl, wReel1SpinRate - wReel1
	add hl, bc
	ld [hl], 8 ; 2x
	ret

ReelAction_StartSlowAdvanceReel3:
	call Slots_CheckMatchedAllThreeReels
	ret c
	ld a, SFX_STOP_SLOT
	call Slots_PlaySFX
	call Slots_WaitSFX
	ld hl, wReel1SpinRate - wReel1
	add hl, bc
	ld [hl], 1
	ld hl, wReel1ReelAction - wReel1
	add hl, bc
	inc [hl]
	ld hl, wReel1Slot0a - wReel1
	add hl, bc
	ld [hl], $10
ReelAction_WaitSlowAdvanceReel3:
	ld hl, wReel1Slot0a - wReel1
	add hl, bc
	ld a, [hl]
	and a
	jr z, .check1
	dec [hl]
.play_sfx
	ld a, SFX_GOT_SAFARI_BALLS
	jp Slots_PlaySFX

.check1
	ld a, [wSlotBias]
	and a
	jr nz, .check2
	call Slots_CheckMatchedAllThreeReels
	jr nc, .play_sfx
	and a
	jr nz, .play_sfx
	call Slots_StopReel
	jp WaitSFX

.check2
	call Slots_CheckMatchedAllThreeReels
	jr c, .play_sfx
	call Slots_StopReel
	jp WaitSFX

Slots_CheckMatchedFirstTwoReels:
	xor a
	ld [wFirstTwoReelsMatching], a
	ld [wFirstTwoReelsMatchingSevens], a
	call Slots_GetCurrentReelState
	call Slots_CopyReelState
	ld a, [wSlotBet]
	and 3
	jr z, .return
	jumptable .Jumptable
.return
	ld a, [wFirstTwoReelsMatching]
	and a
	ret z
	scf
	ret

.Jumptable
	dw GenericDummyFunction
	dw .one
	dw .two
	dw .three

.three
	call .CheckUpwardsDiag
	call .CheckDownwardsDiag
.two
	call .CheckBottomRow
	call .CheckTopRow
.one
	jr .CheckMiddleRow

.CheckBottomRow
	ld hl, wCurrReelStopped
	ld a, [wReel1Stopped]
	cp [hl]
	jr z, .StoreResult

.CheckUpwardsDiag
	ld hl, wCurrReelStopped + 1
	ld a, [wReel1Stopped]
	cp [hl]
	jr z, .StoreResult

.CheckMiddleRow
	ld hl, wCurrReelStopped + 1
	ld a, [wReel1Stopped + 1]
	cp [hl]
	jr z, .StoreResult
	ret

.CheckDownwardsDiag
	ld hl, wCurrReelStopped + 1
	ld a, [wReel1Stopped + 2]
	cp [hl]
	jr z, .StoreResult
	ret

.CheckTopRow
	ld hl, wCurrReelStopped + 2
	ld a, [wReel1Stopped + 2]
	cp [hl]
	ret nz

.StoreResult
	ld [wSlotBuildingMatch], a
	and a
	ld a, 1
	jr nz, .matching_sevens
	ld [wFirstTwoReelsMatchingSevens], a

.matching_sevens
	ld [wFirstTwoReelsMatching], a
	ret

Slots_CheckMatchedAllThreeReels:
	ld a, $ff
	ld [wSlotMatched], a
	call Slots_GetCurrentReelState
	call Slots_CopyReelState
	ld a, [wSlotBet]
	and 3
	jumptable .Jumptable
	ld a, [wSlotMatched]
	cp $ff ;sets carry if !=$ff
	ret

.Jumptable
	dw GenericDummyFunction
	dw .one
	dw .two
	dw .three

.three
	call .CheckUpwardsDiag
	call .CheckDownwardsDiag
.two
	call .CheckBottomRow
	call .CheckTopRow
.one
	jr .CheckMiddleRow

.CheckBottomRow
	ld hl, wCurrReelStopped
	ld a, [wReel1Stopped]
	cp [hl]
	ret nz
	ld hl, wReel2Stopped
	cp [hl]
	jr z, .StoreResult

.CheckUpwardsDiag
	ld hl, wCurrReelStopped + 2
	ld a, [wReel1Stopped]
	cp [hl]
	ret nz
	ld hl, wReel2Stopped + 1
	cp [hl]
	jr z, .StoreResult
	ret

.CheckMiddleRow
	ld hl, wCurrReelStopped + 1
	ld a, [wReel1Stopped + 1]
	cp [hl]
	ret nz
	ld hl, wReel2Stopped + 1
	cp [hl]
	jr z, .StoreResult
	ret

.CheckDownwardsDiag
	ld hl, wCurrReelStopped
	ld a, [wReel1Stopped + 2]
	cp [hl]
	ret nz
	ld hl, wReel2Stopped + 1
	cp [hl]
	jr z, .StoreResult
	ret

.CheckTopRow
	ld hl, wCurrReelStopped + 2
	ld a, [wReel1Stopped + 2]
	cp [hl]
	ret nz
	ld hl, wReel2Stopped + 2
	cp [hl]
	ret nz

.StoreResult
	ld [wSlotMatched], a
	ret

Slots_CopyReelState:
	ld de, wCurrReelStopped
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	ret

Function92fc0:
	ld hl, wReel1Position - wReel1
	add hl, bc
	ld a, [hl]
	push af
	push hl
	call .Check7Bias
	pop hl
	pop af
	ld [hl], a
	ld a, e
	ret

.Check7Bias
	ld a, [wSlotBias]
	and a
	jr nz, .not_biased_to_seven
	ld e, a ; 0
.loop1
	ld hl, wReel1Position - wReel1
	add hl, bc
	inc [hl]
	inc e
	push de
	call Slots_CheckMatchedAllThreeReels
	pop de
	jr nc, .loop1
	and a
	jr nz, .loop1
	ret

.not_biased_to_seven
	call Random
	and 3
	add a, 4
	ld e, a
.loop2
	ld a, e
	inc e
	ld hl, wReel1Position - wReel1
	add hl, bc
	add [hl]
	ld [hl], a
	push de
	call Slots_CheckMatchedAllThreeReels
	pop de
	jr c, .loop2
	ret

Slots_InitBias:
	ld a, [wSlotBias]
	and a
	ret z
	ld hl, .Normal
	ldh a, [hScriptVar]
	and a
	jr z, .okay
	ld hl, .Lucky
.okay
	call Random
	ld c, a
.loop
	ld a, [hli]
	cp c
	jr nc, .done
	inc hl
	jr .loop

.done
	ld a, [hl]
	ld [wSlotBias], a
	ret

.Normal:
	db $01, SLOTS_SEVEN    ; 1/256
	db $03, SLOTS_POKEBALL ; 1/128
	db $0a, SLOTS_STARYU   ; 7/256
	db $14, SLOTS_SQUIRTLE ; 5/128
	db $28, SLOTS_PIKACHU  ; 5/64
	db $30, SLOTS_CHERRY   ; 1/32
	db $ff, SLOTS_NOMATCH  ; everything else

.Lucky:
	db $02, SLOTS_SEVEN    ;  1/128
	db $03, SLOTS_POKEBALL ;  1/256
	db $08, SLOTS_STARYU   ;  5/256
	db $10, SLOTS_SQUIRTLE ;  1/32
	db $1e, SLOTS_PIKACHU  ;  7/128
	db $50, SLOTS_CHERRY   ; 25/128
	db $ff, SLOTS_NOMATCH  ; everything else

Slots_IlluminateBetLights:
	ld b, $14 ; turned on
	ld a, [wSlotBet]
	dec a
	jr z, Slots_Lights1OnOff
	dec a
	jr z, Slots_Lights2OnOff
	jr Slots_Lights3OnOff

Slots_DeilluminateBetLights:
	ld b, $23 ; turned off
Slots_Lights3OnOff:
	hlcoord 3, 2
	call Slots_TurnLightsOnOrOff
	hlcoord 3, 10
	call Slots_TurnLightsOnOrOff
Slots_Lights2OnOff:
	hlcoord 3, 4
	call Slots_TurnLightsOnOrOff
	hlcoord 3, 8
	call Slots_TurnLightsOnOrOff
Slots_Lights1OnOff:
	hlcoord 3, 6
Slots_TurnLightsOnOrOff:
	ld a, b
	ld [hl], a
	ld de, SCREEN_WIDTH / 2 + 3
	add hl, de
	ld [hl], a
	ld de, SCREEN_WIDTH / 2 - 3
	add hl, de
	inc a
	ld [hl], a
	ld de, SCREEN_WIDTH / 2 + 3
	add hl, de
	ld [hl], a
	ret

Slots_AskBet:
.loop
	ld hl, .Text_BetHowManyCoins
	call PrintText
	ld hl, .MenuHeader
	call LoadMenuHeader
	call VerticalMenu
	call CloseWindow
	ret c
	ld a, [wMenuCursorY]
	cpl
	add a, 5 ; converts (1, 2, 3) to (3, 2, 1)
	ld [wSlotBet], a
	ld hl, wCoins
	ld c, a
	ld a, [hli]
	and a
	jr nz, .Start
	ld a, [hl]
	cp c
	jr nc, .Start
	ld hl, .Text_NotEnoughCoins
	call PrintText
	jr .loop

.Start
	ld hl, wCoins + 1
	ld a, [hl]
	sub c
	ld [hld], a
	jr nc, .ok
	dec [hl]
.ok
	call WaitSFX
	ld de, SFX_PAY_DAY
	call PlaySFX
	ld hl, .Text_Start
	call PrintText
	and a
	ret

.Text_BetHowManyCoins
	; Bet how many coins?
	text_jump FarText_BetHowManyCoins

.Text_Start
	; Start!
	text_jump SlotMachine_StartText

.Text_NotEnoughCoins
	; Not enough coins.
	text_jump SlotMachine_NoCoins

.MenuHeader
	db $40 ; flags
	db 10, 14 ; start coords
	db 17, 19 ; end coords
	dw .MenuData2
	db 1 ; default option

.MenuData2
	db $80 ; flags
	db 3 ; items
	db " 3@"
	db " 2@"
	db " 1@"

Slots_AskPlayAgain:
	ld hl, wCoins
	ld a, [hli]
	or [hl]
	jr nz, .you_have_coins
	ld hl, .Text_OutOfCoins
	call PrintText
	ld c, 60
	call DelayFrames
	jr .exit_slots

.you_have_coins
	ld hl, .Text_PlayAgain
	call PrintText
	call LoadMenuTextBox
	lb bc, 14, 12
	call PlaceYesNoBox
	ld a, [wMenuCursorY]
	dec a
	call CloseWindow
	and a
	ret z
.exit_slots
	scf
	ret

.Text_OutOfCoins:
	text_jump SlotMachine_OutOfCoins

.Text_PlayAgain:
	text_jump SlotMachine_PlayAgain

SlotGetPayout:
	ld a, [wSlotMatched]
	cp -1
	jr z, .no_win
	srl a
	ld e, a
	ld d, 0
	ld hl, .PayoutTable
	add hl, de
	ld a, [hli]
	ld [wPayout + 1], a
	ld e, a
	ld a, [hl]
	ld [wPayout], a
	ld d, a
	ret

.PayoutTable
	dw 300
	dw  50
	dw   6
	dw   8
	dw  10
	dw  15

.no_win
	ld hl, wPayout
	xor a
	ld [hli], a
	ld [hl], a
	ret

SlotPayoutText:
	ld a, [wSlotMatched]
	cp -1
	jr nz, .MatchedSomething
	ld hl, .Text_Darn
	jp PrintText

.MatchedSomething
	srl a
	ld e, a
	ld d, 0
	ld hl, .PayoutStrings
	add hl, de
	add hl, de
	add hl, de
	ld de, wStringBuffer2
	ld bc, 4
	rst CopyBytes
	call CallLocalPointer
	ld hl, .Text_PrintPayout
	jp PrintText

.PayoutStrings
	dbw "300@", .LinedUpSevens
	dbw "50@@", .LinedUpPokeballs
	dbw "6@@@", .LinedUpMonOrCherry
	dbw "8@@@", .LinedUpMonOrCherry
	dbw "10@@", .LinedUpMonOrCherry
	dbw "15@@", .LinedUpMonOrCherry

.Text_PrintPayout
	start_asm
	ld a, [wSlotMatched]
	add $25
	ldcoord_a 2, 13
	inc a
	ldcoord_a 2, 14
	inc a
	ldcoord_a 3, 13
	inc a
	ldcoord_a 3, 14
	hlcoord 18, 17
	ld [hl], "▼"
	ld hl, .Text_LinedUpWonCoins
rept 4
	inc bc
endr
	ret

.Text_LinedUpWonCoins
	; lined up! Won @  coins!
	text_jump SlotMachine_LinedUp

.Text_Darn
	; Darn!
	text_jump SlotMachine_Darn

.LinedUpSevens
	ld a, SFX_2ND_PLACE
	call Slots_PlaySFX
	call WaitSFX
	ld a, [wd002]
	and a
	jr nz, .asm_931ff
	call Random
	and $14
	ret z
	ld a, $ff
	ld [wSlotBias], a
	ret

.asm_931ff
	call Random
	and $1c
	ret z
	ld a, $ff
	ld [wSlotBias], a
	ret

.LinedUpPokeballs
	ld a, SFX_3RD_PLACE
	call Slots_PlaySFX
	jp WaitSFX

.LinedUpMonOrCherry
	ld a, SFX_PRESENT
	call Slots_PlaySFX
	jp WaitSFX

SlotMachine_AnimateGolem:
	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	ld a, [hl]
	jumptable

.Jumptable
	dw .init
	dw .fall
	dw .roll

.init
	ld hl, SPRITEANIMSTRUCT_0E
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .retain
	ld a, 2
	ld [wcf64], a
	ld hl, SPRITEANIMSTRUCT_INDEX
	add hl, bc
	ld [hl], 0
	ret

.retain
	dec [hl]
	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	inc [hl]
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld [hl], $30
	ld hl, SPRITEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], 0

.fall
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	cp $20
	jr c, .play_sound
	dec [hl]
	ld d, 14 * 8
	call Sine
	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ret

.play_sound
	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	inc [hl]
	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld [hl], 2
	ld a, 1
	ld [wcf64], a
	ld a, SFX_PLACE_PUZZLE_PIECE_DOWN
	jp Slots_PlaySFX

.roll
	ld hl, SPRITEANIMSTRUCT_XOFFSET
	add hl, bc
	ld a, [hl]
	inc [hl]
	inc [hl]
	cp 9 * 8
	jr nc, .restart
	and 3
	ret nz
	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld a, [hl]
	cpl
	inc a
	ld [hl], a
	ldh [hSCY], a
	ret

.restart
	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	xor a
	ld [hl], a
	ldh [hSCY], a
	ret

Slots_AnimateChansey:
	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	ld a, [hl]
	jumptable

.Jumptable
	dw .walk
	dw .one
	dw .two

.walk
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	inc [hl]
	cp 13 * 8
	jr z, .limit
	and $f
	ret nz
	ld de, SFX_JUMP_OVER_LEDGE
	jp PlaySFX

.limit
	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	inc [hl]
	ld a, 1
	ld [wcf64], a

.one
	ld a, [wcf64]
	cp 2
	jr z, .retain
	cp 5
	ret nz
	ld hl, SPRITEANIMSTRUCT_INDEX
	add hl, bc
	ld [hl], 0
	ret

.retain
	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	inc [hl]
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld [hl], 8
.two
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	and a
	jr z, .spawn_egg
	dec [hl]
	ret

.spawn_egg
	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	dec [hl]
	push bc
	depixel 12, 13, 0, 4
	ld a, SPRITE_ANIM_INDEX_SLOTS_EGG
	call _InitSpriteAnimStruct
	pop bc
	ret

Slots_WaitSFX:
	push bc
	ld c, 16
	call DelayFrames
	pop bc
	ret

Slots_PlaySFX:
	push de
	ld e, a
	ld d, 0
	call PlaySFX
	pop de
	ret

; The first three positions are repeated to
; avoid needing to check indices when copying.
Reel1Tilemap:
	db SLOTS_SEVEN    ;  0
	db SLOTS_CHERRY   ;  1
	db SLOTS_STARYU   ;  2
	db SLOTS_PIKACHU  ;  3
	db SLOTS_SQUIRTLE ;  4
	db SLOTS_SEVEN    ;  5
	db SLOTS_CHERRY   ;  6
	db SLOTS_STARYU   ;  7
	db SLOTS_PIKACHU  ;  8
	db SLOTS_SQUIRTLE ;  9
	db SLOTS_POKEBALL ; 10
	db SLOTS_CHERRY   ; 11
	db SLOTS_STARYU   ; 12
	db SLOTS_PIKACHU  ; 13
	db SLOTS_SQUIRTLE ; 14
	db SLOTS_SEVEN    ;  0
	db SLOTS_CHERRY   ;  1
	db SLOTS_STARYU   ;  2

Reel2Tilemap:
	db SLOTS_SEVEN    ;  0
	db SLOTS_PIKACHU  ;  1
	db SLOTS_CHERRY   ;  2
	db SLOTS_SQUIRTLE ;  3
	db SLOTS_STARYU   ;  4
	db SLOTS_POKEBALL ;  5
	db SLOTS_PIKACHU  ;  6
	db SLOTS_CHERRY   ;  7
	db SLOTS_SQUIRTLE ;  8
	db SLOTS_STARYU   ;  9
	db SLOTS_POKEBALL ; 10
	db SLOTS_PIKACHU  ; 11
	db SLOTS_CHERRY   ; 12
	db SLOTS_SQUIRTLE ; 13
	db SLOTS_STARYU   ; 14
	db SLOTS_SEVEN    ;  0
	db SLOTS_PIKACHU  ;  1
	db SLOTS_CHERRY   ;  2

Reel3Tilemap:
	db SLOTS_SEVEN    ;  0
	db SLOTS_PIKACHU  ;  1
	db SLOTS_CHERRY   ;  2
	db SLOTS_SQUIRTLE ;  3
	db SLOTS_STARYU   ;  4
	db SLOTS_PIKACHU  ;  5
	db SLOTS_CHERRY   ;  6
	db SLOTS_SQUIRTLE ;  7
	db SLOTS_STARYU   ;  8
	db SLOTS_PIKACHU  ;  9
	db SLOTS_POKEBALL ; 10
	db SLOTS_CHERRY   ; 11
	db SLOTS_SQUIRTLE ; 12
	db SLOTS_STARYU   ; 13
	db SLOTS_PIKACHU  ; 14
	db SLOTS_SEVEN    ;  0
	db SLOTS_PIKACHU  ;  1
	db SLOTS_CHERRY   ;  2

SlotsTilemap: INCBIN "gfx/slots/slots.tilemap"
Slots1LZ: INCBIN "gfx/slots/slots_1.2bpp.lz"
Slots2LZ: INCBIN "gfx/slots/slots_2.2bpp.lz"
Slots3LZ: INCBIN "gfx/slots/slots_3.2bpp.lz"
