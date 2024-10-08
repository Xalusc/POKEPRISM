MagnetTrainAnimation:
	ld a, [wScriptBuffer]
	and a
	jr nz, .backwards
	ld a, 1 ; forwards
	lb bc, $40, $60
	lb de, (11 * 8) - (11 * 8 + 4), -$60
	jr .continue

.backwards
	ld a, -1 ; backwards
	lb bc, -$40, -$60
	lb de, (11 * 8) + (11 * 8 + 4), $60

.continue
	ld h, a
	ldh a, [rSVBK]
	push af
	wbk BANK(wLYOverrides)

	ld a, h
	ld [wMagnetTrainDirection], a
	ld a, c
	ld [wMagnetTrainInitPosition], a
	ld a, b
	ld [wMagnetTrainHoldPosition], a
	ld a, e
	ld [wMagnetTrainFinalPosition], a
	ld a, d
	ld [wMagnetTrainPlayerSpriteInitX], a

	ld hl, rIE
	set LCD_STAT, [hl]

	ldh a, [hSCX]
	push af
	ldh a, [hSCY]
	push af
	call MagntTrain_LoadGFX_PlayMusic
	ldh a, [hVBlank]
	push af
	ld a, 3
	ldh [hVBlank], a
	jr .handleLoop
.initialize
	call MagnetTrain_Jumptable_FirstRunThrough
	jr .handleLoop
.loop
	callba PlaySpriteAnimations
	call MagnetTrain_Jumptable
	call MagnetTrain_UpdateLYOverrides
	call RequestLYOverrides
	call DelayFrame
.handleLoop
	ld a, [wJumptableIndex]
	and a
	jr z, .initialize
	bit 7, a
	jr z, .loop
	pop af
	ldh [hVBlank], a
	call ClearBGPalettes
	xor a
	ld [wLCDCPointer], a
	ldh [hLYOverridesStart], a
	ldh [hLYOverridesEnd], a
	ldh [hSCX], a
	ldh [hRequestedVTileSource], a
	ldh [hRequestedVTileSource + 1], a
	ldh [hRequestedVTileDest], a
	ldh [hRequestedVTileDest + 1], a
	ldh [hRequested2bpp], a
	call ClearTileMap

	pop af
	ldh [hSCY], a
	pop af
	ldh [hSCX], a
	ld hl, rIE
	res LCD_STAT, [hl]
	xor a
	ldh [hBGMapMode], a
	pop af
	ldh [rSVBK], a
	ret

MagnetTrain_UpdateLYOverrides:
	ld hl, wLYOverridesBackup
	ld c, $2f
	ld a, [wcf64]
	add a
	ldh [hSCX], a
	call .loadloop
	ld c, $30
	ld a, [wcf65]
	call .loadloop
	ld c, $31
	ld a, [wcf64]
	add a
	call .loadloop
	ld a, [wMagnetTrainDirection]
	ld d, a
	ld hl, wcf64
	ld a, [hl]
	add d
	add d
	ld [hl], a
	ret

.loadloop
	ld [hli], a
	dec c
	jr nz, .loadloop
	ret

MagntTrain_LoadGFX_PlayMusic:
	call ClearBGPalettes
	call ClearSprites
	call DisableLCD
	callba ClearSpriteAnims
	call SetMagnetTrainPals
	call DrawMagnetTrain
	ld a, $90
	ldh [hWY], a
	call EnableLCD
	xor a
	ldh [hBGMapMode], a
	ldh [hSCX], a
	ldh [hSCY], a
	ldh a, [rSVBK]
	push af
	wbk BANK(wPlayerGender)
	call GetPlayerIcon
	pop af
	ldh [rSVBK], a
	ld hl, vObjTiles
	ld de, wDecompressScratch
	ld c, 4
	call Request2bppInWRA6
	ld de, wDecompressScratch + 12 tiles
	ld hl, vObjTiles tile $04
	ld c, 4
	call Request2bppInWRA6
	call MagnetTrain_InitLYOverrides
	ld hl, wJumptableIndex
	xor a
	ld [hli], a
	ld a, [wMagnetTrainInitPosition]
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ret

DrawMagnetTrain:
	hlbgcoord 0, 0
	xor a
.loop
	call GetMagnetTrainBGTiles
	ld b, 32 / 2
	call .FillAlt
	inc a
	cp $12
	jr c, .loop
	hlbgcoord 0, 6
	ld de, MagnetTrainTilemap1
	ld c, 20
	call .FillLine
	hlbgcoord 0, 7
	ld de, MagnetTrainTilemap2
	ld c, 20
	call .FillLine
	hlbgcoord 0, 8
	ld de, MagnetTrainTilemap3
	ld c, 20
	call .FillLine
	hlbgcoord 0, 9
	ld de, MagnetTrainTilemap4
	ld c, 20

.FillLine
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .FillLine
	ret

.FillAlt
	ld [hl], e
	inc hl
	ld [hl], d
	inc hl
	dec b
	jr nz, .FillAlt
	ret

GetMagnetTrainBGTiles:
	push hl
	ld e, a
	ld d, 0
	ld hl, MagnetTrainBGTiles
	add hl, de
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	pop hl
	ret

MagnetTrainBGTiles:
; Alternating tiles for each line
; of the Magnet Train tilemap.
	db $4c, $4d ; bush
	db $5c, $5d ; bush
	db $4c, $4d ; bush
	db $5c, $5d ; bush
	db $08, $08 ; fence
	db $18, $18 ; fence
	db $1f, $1f ; track
	db $31, $31 ; track
	db $11, $11 ; track
	db $11, $11 ; track
	db $0d, $0d ; track
	db $31, $31 ; track
	db $04, $04 ; fence
	db $18, $18 ; fence
	db $4c, $4d ; bush
	db $5c, $5d ; bush
	db $4c, $4d ; bush
	db $5c, $5d ; bush

MagnetTrain_InitLYOverrides:
	ld hl, wLYOverrides
	ld bc, wLYOverridesEnd - wLYOverrides
	ld a, [wMagnetTrainInitPosition]
	call ByteFill
	ld hl, wLYOverridesBackup
	ld bc, wLYOverridesBackupEnd - wLYOverridesBackup
	ld a, [wMagnetTrainInitPosition]
	call ByteFill
	ld a, rSCX & $ff
	ld [wLCDCPointer], a
	ret

SetMagnetTrainPals:
	vbk BANK(vBGAttrs)

	; bushes
	hlbgcoord 0, 0, vBGAttrs
	ld bc, 4 bgrows
	ld a, 2
	call ByteFill

	; train
	hlbgcoord 0, 4, vBGAttrs
	ld bc, 10 bgrows
	xor a
	call ByteFill

	; more bushes
	hlbgcoord 0, 14, vBGAttrs
	ld bc, 4 bgrows
	ld a, 2
	call ByteFill

	; train window
	hlbgcoord 7, 8, vBGAttrs
	ld bc, 6
	ld a, 4
	call ByteFill

	vbk BANK(vBGMap)
	ret

MagnetTrain_Jumptable:
	call RunAnonymousJumptable

.Jumptable:
	dw .InitPlayerSpriteAnim
	dw .WaitScene
	dw .MoveTrain1
	dw .WaitScene
	dw .MoveTrain2
	dw .WaitScene
	dw .TrainArrived

.InitPlayerSpriteAnim
	ld d, 10 * 8 + 5
	ld a, [wMagnetTrainPlayerSpriteInitX]
	ld e, a
	ld a, SPRITE_ANIM_INDEX_MAGNET_TRAIN_RED
	call _InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_TILE_ID
	add hl, bc
	ld [hl], 0
.PrepareToHoldTrain
	ld a, $80
	ld [wcf66], a
.Next
	ld hl, wJumptableIndex
	inc [hl]
	ret

.MoveTrain1
	ld hl, wMagnetTrainHoldPosition
	ld a, [wcf65]
	cp [hl]
	jr z, .PrepareToHoldTrain
	ld e, a
	ld a, [wMagnetTrainDirection]
	cpl
	inc a
	add e
	ld [wcf65], a
	ld hl, wGlobalAnimXOffset
	ld a, [wMagnetTrainDirection]
	add [hl]
	ld [hl], a
	ret

.WaitScene
	ld hl, wcf66
	ld a, [hl]
	and a
	jr z, .Next
	dec [hl]
	ret

.MoveTrain2
	ld hl, wMagnetTrainFinalPosition
	ld a, [wcf65]
	cp [hl]
	jr z, .Next
	ld e, a
	ld a, [wMagnetTrainDirection]
	cpl
	inc a
	ld d, a
	ld a, e
	add d
	add d
	ld [wcf65], a
	ld hl, wGlobalAnimXOffset
	ld a, [wMagnetTrainDirection]
	ld d, a
	ld a, [hl]
	add d
	add d
	ld [hl], a
	ret

.TrainArrived
	ld a, $80
	ld [wJumptableIndex], a
	ld de, SFX_TRAIN_ARRIVED
	jp PlaySFX

MagnetTrain_Jumptable_FirstRunThrough:
	callba PlaySpriteAnimations
	call MagnetTrain_Jumptable
	call MagnetTrain_UpdateLYOverrides
	call RequestLYOverrides
	call DelayFrame
	ldh a, [rSVBK]
	push af
	wbk BANK(wTimeOfDayPal)
	ld a, [wTimeOfDayPal]
	push af
	ld a, [wPermission]
	push af
	ld a, [wTimeOfDay]
	and 3
	ld [wTimeOfDayPal], a
	ld a, 1
	ld [wPermission], a
	ld b, SCGB_MAPPALS
	predef GetSGBLayout
	call UpdateTimePals
	ldh a, [rBGP]
	ld [wBGP], a
	ldh a, [rOBP0]
	ld [wOBP0], a
	ldh a, [rOBP1]
	ld [wOBP1], a
	pop af
	ld [wPermission], a
	pop af
	ld [wTimeOfDayPal], a
	pop af
	ldh [rSVBK], a
	ret

MagnetTrainTilemap1:
	db $1f, $05, $06, $0a, $0a
	db $0a, $09, $0a, $0a, $0a
	db $0a, $0a, $0a, $09, $0a
	db $0a, $0a, $0b, $0c, $1f
MagnetTrainTilemap2:
	db $14, $15, $16, $1a, $1a
	db $1a, $19, $1a, $1a, $1a
	db $1a, $1a, $1a, $19, $1a
	db $1a, $1a, $1b, $1c, $1d
MagnetTrainTilemap3:
	db $24, $25, $26, $27, $07
	db $2f, $29, $28, $28, $28
	db $28, $28, $28, $29, $07
	db $2f, $2a, $2b, $2c, $2d
MagnetTrainTilemap4:
	db $20, $1f, $2e, $1f, $17
	db $00, $2e, $1f, $1f, $1f
	db $1f, $1f, $1f, $2e, $17
	db $00, $1f, $2e, $1f, $0f
