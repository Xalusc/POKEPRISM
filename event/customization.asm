SKIN_TONE_TILE EQU $cb
SLIDER_TILE_1 EQU $cc

PlayerCustomization:
	call RunProtectedPlayerCustFunction
	; end of function

	call InitCrystalData
	ld c, 16
	call DelayFrames
.restart
	call PlayerCust_InitRAM
	call PlayerCust_InitialRunthrough
	call ConfirmPlayerCustomization
	jr c, .restart
	ret

RunProtectedPlayerCustFunction:
	pop de

	ld hl, wOptions
	ld a, [hl]
	push af
	set NO_TEXT_SCROLL, [hl]
	ld a, [wVramState]
	push af
	xor a
	ld [wVramState], a
	ldh a, [hInMenu]
	push af
	xor a
	ldh [hMapAnims], a
	callba ClearSpriteAnims
	call _de_
	call ClearSprites
	pop af
	ldh [hInMenu], a
	pop af
	ld [wVramState], a
	pop af
	ld [wOptions], a
	ret

OxalisSalonCustomization::
	call RunProtectedPlayerCustFunction
	; end of function

	xor a
	ldh [hBGMapMode], a
	inc a
	ld [wcf64], a
	call LoadStandardMenuHeader
	ldh a, [rSVBK]
	push af
	wbk BANK(wOriginalBGPals)
	ld hl, wOriginalBGPals
	ld a, $ff
	call ByteFill
	pop af
	ldh [rSVBK], a
	call SetPalettes
	call DelayFrame
	call ClearTileMapAndWipeAttrMap
	call CopyTilemapAtOnce

	call HideSprites

	call InitOxalisSalonGFX

	ld hl, wTempPlayerCustSelection
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a

	ld hl, wPlayerCharacteristics
	ld de, wSavedPlayerCharacteristics
	ld bc, wPlayerCharacteristicsEnd - wPlayerCharacteristics
	rst CopyBytes

	call PlayerCust_InitOxalisSalonRAM
.loop
	call PlayerCust_CategoryMenu
	jr c, .cancel
	call ConfirmPlayerCustomization
	jr c, .cancel
	ld hl, wSavedPlayerCharacteristics
	ld de, wPlayerCharacteristics
	ld c, wPlayerCharacteristicsEnd - wPlayerCharacteristics
	call StringCmp
	ld a, 1
	jr nz, .close_window
	ld a, 2
	jr .close_window

.cancel
	ld hl, .cancel_text
	call PrintText
	call YesNoBox
	jr c, .loop
	ld hl, wSavedPlayerCharacteristics
	ld de, wPlayerCharacteristics
	ld bc, wPlayerCharacteristicsEnd - wPlayerCharacteristics
	rst CopyBytes
	xor a
.close_window
	ldh [hScriptVar], a
	xor a
	call DmgToCgbBGPals
	call DelayFrame
	call CloseWindow
	call DisableLCD
	callba LoadGraphicsNoHeader
	ld b, SCGB_MAPPALS
	predef GetSGBLayout
	call SetPalettes
	call EnableLCD
	jp DelayFrame

.cancel_text
	ctxt "Are you sure you"
	line "want to cancel?"
	done

ConfirmPlayerCustomization:
	xor a
	ldh [hGraphicStartTile], a
	ldh [hBGMapMode], a
	call ClearSprites
	call ClearTileMapAndWipeAttrMap
	coord hl, 6, 4
	lb bc, 7, 7
	predef PlaceGraphic
	ld b, 0
	call SafeCopyTilemapAtOnce

	ld hl, .text
	call PrintText
	call YesNoBox
	ret nc
	; bring up the menu
	callba MovePlayerPicRight
	call PlayerCust_CategoryMenu
	ret c
	call PlayClickSFX
	jr ConfirmPlayerCustomization

.text
	ctxt "Is this the look"
	line "you want?"
	prompt

PlayerCust_InitRAM:
	call ClearBGPalettes
	call ClearSprites
	call ClearTileMap
	xor a
	ld [wJumptableIndex], a
	ld [wcf64], a
	ld [wMenuSelection], a
	ld hl, wPlayerCharacteristics
	ld [hli], a
	; compressed red palette (15 bits)
	call PlayerCust_InitBluePal
	ldh a, [rSVBK]
	push af
	wbk BANK(wOriginalBGPals)
	ld hl, wOriginalBGPals + 4
	call PlayerCust_InitBluePal
	ld hl, wOriginalOBJPals + 4
	call PlayerCust_InitBluePal
	pop af
	ldh [rSVBK], a

	ld hl, wTempPlayerCustSelection
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a

	ld [wPlayerClothesScrollPosition], a
	inc a
	ld [wPlayerCustMenuCursorBuffer], a
PlayerCust_InitOxalisSalonRAM:
	call PlayerCust_LoadPlayerSprite
	call LoadColourCustomizationNames
	ld b, SCGB_PLAYER_OR_MON_FRONTPIC_PALS
	predef GetSGBLayout
	call SetPalettes
	jp DelayFrame

LoadColourCustomizationNames:
	ld de, CustomizationColourNames
	vbk BANK(vBGTiles2)
	ld hl, vBGTiles2
	xor a
.loadColourNamesLoop
	push af
	push hl
	ld hl, wMisc
	call CopyName2
	pop hl
	push hl
	push de
	ld de, wMisc
	lb bc, 0, 9
	predef PlaceVWFString
	pop de
	pop hl
	pop af
	cp 13
	jr nz, .noTileSwitch
	ld hl, vWalkingFrameTiles
	jr .finishLoopIteration
.noTileSwitch
	ld bc, 9 tiles
	add hl, bc
.finishLoopIteration
	inc a
	cp 17
	jr nz, .loadColourNamesLoop
	ld de, TextBoxSpaceGFX
	ld hl, vBGTiles2 tile $7f
	lb bc, BANK(TextBoxSpaceGFX), 1
	call Request2bpp
	vbk BANK(vBGTiles)
	ret

PlayerCust_InitBluePal:
	xor a
	ld [hli], a
	ld [hl], $7c
	ret

PlayerCust_InitialRunthrough:
	call PlayerCust_Model_InitialRunthrough
.goBackToSkinTone
	call PlayerCust_Skintone
	jr c, PlayerCust_InitialRunthrough
	call PlayerCust_Outfit
	jr z, .goBackToSkinTone
	ret

PlayerCust_InitModelSelection:
	call DoPlayerCustFunctionInSafeMode ; stack manip function
	; end of function

	ld a, 1
	ldh [hInMenu], a

	ld hl, .MenuHeader
	call CopyMenuHeader
	call SetUpCustomizationMenu
	ld a, 2
	ld [w2DMenuNumCols], a ; for BOY/GIRL selection
	ld a, %1001100
	ld [w2DMenuFlags1], a ; set bit 7 of w2DMenuFlags2 if we do a useless movement
	ld a, D_LEFT | D_RIGHT | D_DOWN | D_UP | A_BUTTON | B_BUTTON
	ld [wMenuJoypadFilter], a
	; boy girl menu
	coord hl, 0, 15
	lb bc, 1, 9
	call TextBox
	ld de, .BoyGirlString
	coord hl, 2, 16
	call PlaceText
	call Print2by6BoxInLowerRightCorner
	ld de, .CharModelString
	coord hl, 13, 15
	call PlaceText

	ld a, [wPlayerCharacteristics]
	and $f
	ld [wTempPlayerCustSelection], a
	ld b, a
	srl a
	inc a
	cp 7
	jr nz, .ok
	dec a

.ok
	ld [wMenuCursorY], a
	ld a, b
	and 1
	inc a
	ld [wMenuCursorX], a
	ld a, b
	jpba GetPlayerFrontpic

.MenuHeader
	db $40 ; flags
	db 00, 00 ; start coords
	db 14, 10 ; end coords
	dw .MenuData2
	db 1 ; default option

.MenuData2
	db %10000000 ; flags
	db 6 ; items
	db "MODEL 1@"
	db "MODEL 2@"
	db "MODEL 3@"
	db "MODEL 4@"
	db "MODEL 5@"
	db "MODEL 6@"

.BoyGirlString:
	ctxt "A   B"
	done

.CharModelString:
	ctxt "Char."
	nl   "Model"
	done

PlayerCust_SelectModel:
	; move gender cursor
	coord hl, 1, 16
	coord de, 5, 16
	ld a, " "
	ld [hl], a
	ld [de], a

	ld a, [wMenuCursorX]
	dec a ; boy
	jr z, .gotAddress
	ld h, d
	ld l, e
.gotAddress
	ld [hl], "▶"
	call DoMenuJoypadLoop
	ld b, a ; save for later

	bit A_BUTTON_F, b ; did we select a model?
	jr nz, .done ; if so, return
	bit B_BUTTON_F, b
	jr nz, .goBack

	ld a, [w2DMenuFlags2]
	bit 7, a ; did we do a useless scroll?
	jr nz, PlayerCust_SelectModel
	ld a, b
	and D_UP | D_DOWN | D_LEFT | D_RIGHT
	jr z, PlayerCust_SelectModel
; change model
	ld a, [wMenuCursorY]
	dec a
	add a ; sla a
	ld c, a
	ld a, [wMenuCursorX]
	dec a
	or c
	ld [wTempPlayerCustSelection], a
	call PlayerCustomization_LoadAnyPlayerSprite
	ld a, [wTempPlayerCustSelection]
	callba GetPlayerFrontpic
	jr PlayerCust_SelectModel
.done
	ld a, [wTempPlayerCustSelection]
	ld b, a
	ld a, [wPlayerCharacteristics]
	and $f0
	or b
	ld [wPlayerCharacteristics], a
	call PlayClickSFX
	xor a
	ret
.goBack
	call PlayClickSFX
	xor a
	scf
	ret

PlayerCust_InitSkinToneSelection:
	call DoPlayerCustFunctionInSafeMode
	; end of function

	ld a, 1
	ldh [hInMenu], a

	ld de, SkinToneBox
	ld hl, vFontTiles tile (SKIN_TONE_TILE - $80)
	lb bc, BANK(SkinToneBox), 1
	call Request2bpp

	ld hl, .MenuHeader
	call CopyMenuHeader
	call SetUpCustomizationMenu
	ld a, %1001100
	ld [w2DMenuFlags1], a ; set bit 7 of w2DMenuFlags2 if we do a useless movement
	ld a, D_DOWN | D_UP | A_BUTTON | B_BUTTON
	ld [wMenuJoypadFilter], a
; set attributes
	coord hl, 9, 2, wAttrMap
	ld bc, SCREEN_WIDTH * 2
	ld a, 1
	ld d, 7
.writeBGPalLoop
	ld [hl], a
	add hl, bc
	inc a
	dec d
	jr nz, .writeBGPalLoop
; set palettes
	ld hl, wOriginalBGPals + 8
	ld de, SkinTonePalettes
	ld c, 7
	call PlayerCust_SetPalettes

	call Print2by6BoxInLowerRightCorner
	ld de, .SkinToneString
	coord hl, 14, 15
	call PlaceText
	ld a, [wPlayerCharacteristics]
	swap a
	and 7
	ld [wTempPlayerCustSelection], a
	inc a
	ld [wMenuCursorY], a
	ret

.MenuHeader
	db $40 ; flags
	db 00, 00 ; start coords
	db 16, 10 ; end coords
	dw .MenuData2
	db 1 ; default option

.MenuData2
	db %10000000 ; flags
	db 7 ; items
	db "TONE 1 ", SKIN_TONE_TILE, "@"
	db "TONE 2 ", SKIN_TONE_TILE, "@"
	db "TONE 3 ", SKIN_TONE_TILE, "@"
	db "TONE 4 ", SKIN_TONE_TILE, "@"
	db "TONE 5 ", SKIN_TONE_TILE, "@"
	db "TONE 6 ", SKIN_TONE_TILE, "@"
	db "TONE 7 ", SKIN_TONE_TILE, "@"

.SkinToneString
	text "Skin"
	nl   "Tone"
	done

SkinTonePalettes:
	RGB 31, 21, 09
	RGB 31, 27, 17
	RGB 30, 24, 15
	RGB 28, 21, 13
	RGB 24, 16, 08
	RGB 17, 10, 04
	RGB 10, 06, 03

SkinToneBox: INCBIN "gfx/customization/skin_tone_box.2bpp"

PlayerCust_SetPalettes:
	ldh a, [rSVBK]
	push af
	wbk BANK(wOriginalBGPals)
.writePalsLoop
	ld a, $ff
	ld [hli], a
	ld a, $7f
	ld [hli], a
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	dec c
	jr nz, .writePalsLoop
	pop af
	ldh [rSVBK], a
	ret

PlayerCust_SelectSkinTone:
	call DoMenuJoypadLoop
	ld b, a
	bit A_BUTTON_F, a
	jr nz, .gotSkinTone
	bit B_BUTTON_F, a
	jr nz, .previousSection
	ld a, [w2DMenuFlags2] ; check for a useless scroll
	bit 7, a
	jr nz, PlayerCust_SelectSkinTone
	ld a, b
	and D_DOWN | D_UP
	jr z, PlayerCust_SelectSkinTone
	ld a, [wMenuCursorY]
	dec a
	ld [wTempPlayerCustSelection], a
	call PlayerCust_SetSkintone
	jr PlayerCust_SelectSkinTone
.gotSkinTone
	ld a, [wTempPlayerCustSelection]
	and 7
	swap a
	ld b, a
	ld a, [wPlayerCharacteristics]
	and $f
	or b
	ld [wPlayerCharacteristics], a
	call PlayClickSFX
	xor a
	ret
.previousSection
	call PlayClickSFX
	xor a
	scf
	ret

PlayerCust_InitClothesSelection:
	call DoPlayerCustFunctionInSafeMode
	; end of function

	ld de, SliderBarAndSliderTile
	ld hl, vFontTiles tile (SLIDER_TILE_1 - $80)
	lb bc, BANK(SliderBarAndSliderTile), 2
	call Request2bpp

	ld hl, .MenuHeader
	call CopyMenuHeader
	call InitScrollingMenu
	call CopyMenuData2
	ld a, [wPlayerClothesScrollPosition]
	ld [wMenuScrollPosition], a
	ld b, a
	ld a, [wPlayerCustMenuCursorBuffer]
	ld [wMenuCursorBuffer], a
	add b
	push af

	coord hl, 2, 2, wAttrMap
	ld de, (SCREEN_WIDTH * 2) - 9
	ld c, 4
	ld a, 1 << 3 | 7 ; vram bank 1, pal 7
.writeColourNameAttrsOuterLoop
	ld b, 9
.writeColourNameAttrsInnerLoop
	ld [hli], a
	dec b
	jr nz, .writeColourNameAttrsInnerLoop
	add hl, de
	dec c
	jr nz, .writeColourNameAttrsOuterLoop

	callba _InitScrollingMenuNoBGMapUpdate
	pop af
	ld [wMenuSelection], a
	ld hl, wMenuDataFlags
	set 5, [hl]
	coord hl, 12, 11
	lb bc, 2, 6
	call TextBox
	call Print2by6BoxInLowerRightCorner
	coord hl, 0, 11
	lb bc, 5, 10
	call TextBox
	ld de, .OutfitColorString
	coord hl, 13, 15
	call PlaceText
	coord hl, 3, 12
	ld bc, (SCREEN_WIDTH * 2) - 8
	ld d, 3
	ld a, SLIDER_TILE_1
.outerLoop
	ld e, 8
.innerLoop
	ld [hli], a
	dec e
	jr nz, .innerLoop
	add hl, bc
	dec d
	jr nz, .outerLoop

	coord hl, 3, 12, wAttrMap
	ld d, 3
	ld a, 1
.outerLoopAttr
	ld e, 8
.innerLoopAttr
	ld [hli], a
	dec e
	jr nz, .innerLoopAttr
	add hl, bc
	inc a
	dec d
	jr nz, .outerLoopAttr

	ld hl, wOriginalBGPals + 8
	ld de, SliderBarPalettes
	ld c, 3
	call PlayerCust_SetPalettes

	ld a, SPRITE_ANIM_INDEX_SLIDER_CURSOR
	depixel 14, 3, 0, 5
	call _InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	ld [hl], 0

	ld a, SPRITE_ANIM_INDEX_SLIDER_CURSOR
	depixel 16, 3, 0, 5
	call _InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	ld [hl], 1

	ld a, SPRITE_ANIM_INDEX_SLIDER_CURSOR
	depixel 18, 3, 0, 5
	call _InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	ld [hl], 2

	call UpdateOutfitColourMenus_NoSetPals
	ld hl, w2DMenuFlags1
	set 6, [hl]
	ld hl, wCustomizationExpandedPal
	xor a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ret

.MenuHeader:
	db $40 ; flags
	db 01, 01 ; start coords
	db 09, 10 ; end coords
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $91 ; flags
	db 4, 0 ; rows, columns
	db 1 ; horizontal spacing
	dba CustomizationColors
	dba PlaceCurCustColor
	dba NULL
	dba UpdateOutfitColourMenus

.OutfitColorString:
	text "Outfit"
	nl   "Color"
	done

SliderBarAndSliderTile: INCBIN "gfx/customization/slider.2bpp"

SliderBarPalettes:
	RGB 31, 00, 00
	RGB 00, 31, 00
	RGB 00, 00, 31

CustomizationColourNames:
	db "BLUE@"
	db "CORAL@"
	db "DODGERBLUE@"
	db "SPRINGGREEN@"
	db "YELLOWGREEN@"
	db "GREEN@"
	db "ORANGERED@"
	db "RED@"
	db "GOLDENROD@"
	db "HOTPINK@"
	db "CADETBLUE@"
	db "SEAGREEN@"
	db "CHOCOLATE@"
	db "BLUEVIOLET@"
	db "FIREBRICK@"
	db "CUSTOM@"
	db "CANCEL@"

CustomizationColors:
	db 16
	db 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
	db $ff

PlaceCurCustColor:
	ld h, d
	ld l, e
	ld a, [wMenuSelection]
	cp $ff
	jr nz, .notCancel
	ld a, 17
.notCancel
	dec a
	ld b, a
	add a ; multiply by 9
	add a
	add a
	add b
	cp $7e
	jr c, .gotStart
	add 2
.gotStart
	ld c, 9
.writeNameLoop
	ld [hli], a
	inc a
	dec c
	jr nz, .writeNameLoop
	ret

UpdateOutfitColourMenus_NoSetPals:
	call PrintOutfitColourMenus

; fallthrough
UpdatePlayerPicColourInBC_NoSetPals:
	ldh a, [rSVBK]
	push af
	wbk BANK(wOriginalBGPals)
	ld hl, wOriginalBGPals + 4
	ld a, c
	ld [hli], a
	ld [hl], b
	ld hl, wOriginalOBJPals + 4
	ld [hli], a
	ld [hl], b
	pop af
	ldh [rSVBK], a
	ret

UpdateOutfitColourMenus:
	call PrintOutfitColourMenus

; fallthrough
UpdatePlayerPicColour:
	call CompressPalette
UpdatePlayerPicColourInBC:
	call UpdatePlayerPicColourInBC_NoSetPals
	call SetPalettes
	jp DelayFrame

PrintOutfitColourMenus:
	ld a, [wMenuSelection]
	cp 16
	jr nc, .customColour
	dec a
	add a
	ld e, a
	ld d, 0
	ld hl, PlayerPicColors
	add hl, de
	ld a, [hli]
	ld b, [hl]
	ld c, a
	call DecompressPalette
.customColour
	call PrintRGBComponents
	jp Print24bitRGBPalette

PlayerPicColors:
	RGB 0, 0, 31
	RGB 31, 15, 10
	RGB 3, 18, 31
	RGB 0, 31, 15
	RGB 19, 25, 6
	RGB 0, 16, 0
	RGB 31, 8, 0
	RGB 31, 0, 0
	RGB 27, 20, 4
	RGB 31, 13, 22
	RGB 11, 19, 20
	RGB 5, 17, 10
	RGB 26, 13, 3
	RGB 17, 5, 28
	RGB 22, 4, 4

CompressPalette:
	ld hl, wTempPlayerClothesPalette + 2
	ld a, [hld]
	add a
	add a
	ld b, a
	ld a, [hld]
	add a
	swap a
	ld c, a ; lower 3 bits
	and %11 ; upper 2 bits
	or b
	ld b, a
	ld a, c
	and %11100000 ; mask other bits
	or [hl]
	ld c, a
	ret

DecompressPalette:
	ld hl, wTempPlayerClothesPalette + 2
	ld a, b
	srl a
	srl a
	ld [hld], a
	ld a, b
	and %11
	ld b, a
	ld a, c
	and %11100000
	or b
	swap a
	srl a
	ld [hld], a
	ld a, c
	and %11111
	ld [hl], a
	ret

PrintRGBComponents:
	coord hl, 1, 12
	ld de, wTempPlayerClothesPalette
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	call PrintNum
	coord hl, 1, 14
	inc de
	call PrintNum
	coord hl, 1, 16
	inc de
	jp PrintNum

Print24bitRGBPalette:
	ld de, wTempPlayerClothesPalette
	ld hl, wCustomizationExpandedPal
	ld c, 3
.loop
	ld a, [de]
	inc de
	add a
	add a
	add a ; multiply by 8
	ld b, a ; save scaled portion
	swap a
	srl a
	and $f ; divide by 32
	add b
	ld [hli], a
	dec c
	jr nz, .loop
Print24BitRGBPalette_NoCalculation:
	ld de, wCustomizationExpandedPal
	coord hl, 13, 12
	ld c, 3
	jp PrintBCDNumber

PlayerCust_QuitJumptableAndGoBack:
	ld a, $80
	ld [wJumptableIndex], a
	ld a, 1
	ld [wMenuSelection], a
	ret

PlayerCust_QuitJumptableAndAdvance:
	ld a, $81
	ld [wJumptableIndex], a
	ret

PlayerCust_NextSection:
	ld hl, wJumptableIndex
	inc [hl]
	xor a
	ld [wTempPlayerCustSelection], a
	ret

PlayerCust_ResetSection:
	xor a
	ld [wJumptableIndex], a
	ld [wTempPlayerCustSelection], a
	ret

PlayerCust_PrevSection:
	ld hl, wJumptableIndex
	dec [hl]
	xor a
	ld [wTempPlayerCustSelection], a
	ret

PlayerCust_SelectClothes:
	callba _ScrollingMenu
	ld a, [wMenuJoypad]
	cp B_BUTTON
	jr z, PlayerCust_DeInitAllSpritesAndGoBack
	cp A_BUTTON
	ret nz

	ld a, [wMenuSelection]
	cp 16
	jr nz, PlayerCust_GotColour
	ld a, 1
	ldh [hBGMapMode], a
	ldh [hInMenu], a
	call DelayFrame
	jp PlayerCust_NextSection
PlayerCust_GotColour:
	ld a, [wMenuScrollPosition]
	ld [wPlayerClothesScrollPosition], a
	ld a, [wMenuCursorY]
	ld [wPlayerCustMenuCursorBuffer], a
	call CompressPalette
	ld a, c
	ld [wPlayerClothesPalette], a
	ld a, b
	ld [wPlayerClothesPalette + 1], a
	call PlayerCust_DeinitSliders
	call ClearSprites
	jp PlayerCust_QuitJumptableAndAdvance

PlayerCust_DeInitAllSpritesAndGoBack:
	call PlayerCust_DeinitSliders
	ld hl, wSprites + 4 * 4
	ld b, 3
	call HideBSpritesFromHL
	jp PlayerCust_QuitJumptableAndGoBack

PlayerCust_DeinitSliders:
	ld hl, wSpriteAnim2
	ld bc, wSpriteAnim2 - wSpriteAnim1
	ld d, 3
	xor a
.loop
	ld [hl], a
	add hl, bc
	dec d
	jr nz, .loop
	ret

PlayerCust_SelectClothesSliders:
	ld a, 2
	ld [wGenericDelay], a
	call JoyTextDelay
	call _SelectClothesSliders
	call c, UpdateOutfitColourMenus
	jpba PlaySpriteAnimationsAndDelayFrame

_SelectClothesSliders:
	call ClearClothesSliderTileCursors

	ld a, [wTempPlayerCustSelection]
	coord hl, 0, 12
	ld bc, SCREEN_WIDTH * 2
	rst AddNTimes
	ld [hl], "▶"

	ldh a, [hJoyLast]
	bit A_BUTTON_F, a
	jr nz, .gotColour
	bit B_BUTTON_F, a
	jr nz, .prevSection
	bit D_DOWN_F, a
	jr nz, .scrollCursorDown
	bit D_UP_F, a
	jr nz, .scrollCursorUp
	bit D_LEFT_F, a
	jr nz, .scrollCursorLeft
	bit D_RIGHT_F, a
	jr nz, .scrollCursorRight
	bit SELECT_F, a
	jr z, .doNotUpdateOutfit
	call PlayerCust_NextSection
	jr .clearCursorReminantsAndReturn
.prevSection
	call PlayerCust_ResetSection
	call EraseHollowCursorOnCustom
.clearCursorReminantsAndReturn
	call ClearClothesSliderTileCursors
.doNotUpdateOutfit
	and a
	ret

.gotColour
	call PlayerCust_GotColour
	and a
	ret

.scrollCursorLeft
	call .GetCurrentColourComponent
	and a
	jr z, .noCursorMovement
	dec a
	jr .writeNewCursorX

.scrollCursorRight
	call .GetCurrentColourComponent
	cp 31
	jr z, .noCursorMovement
	inc a
.writeNewCursorX
	ld [hl], a
.noCursorMovement
	scf
	ret

.scrollCursorDown
	ld a, [wTempPlayerCustSelection]
	cp 2
	ret nc
	inc a
	ld [wTempPlayerCustSelection], a
	ret

.scrollCursorUp
	ld a, [wTempPlayerCustSelection]
	and a
	ret z
	dec a
	ld [wTempPlayerCustSelection], a
	ret

.GetCurrentColourComponent:
	ld a, [wTempPlayerCustSelection]
	add LOW(wTempPlayerClothesPalette)
	ld l, a
	adc HIGH(wTempPlayerClothesPalette)
	sub l
	ld h, a
	ld a, [hl]
	ret

ClearClothesSliderTileCursors:
	ld a, "│"
	ldcoord_a 0, 12
	ldcoord_a 0, 14
	ldcoord_a 0, 16
	ret

EraseHollowCursorOnCustom:
	ld hl, wCursorCurrentTile
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld [hl], " "
	ret

PlayerCust_SelectClothesHexCode:
	ld a, 2
	ld [wGenericDelay], a
	call JoyTextDelay
	call _SelectClothesHexCode
	call c, UpdateOutfitColourMenus_HexCode
	jpba PlaySpriteAnimationsAndDelayFrame

_SelectClothesHexCode:
	call EraseHexCodeSelectorCursors
	ld a, [wTempPlayerCustSelection]
	coord hl, 13, 13
	add l
	ld l, a
	adc h
	sub l
	ld h, a
	ld [hl], "▲"

	ldh a, [hJoyLast]
	bit A_BUTTON_F, a
	jr nz, .gotColour
	bit B_BUTTON_F, a
	jr nz, .resetSection
	bit D_LEFT_F, a
	jr nz, .moveCursorLeft
	bit D_RIGHT_F, a
	jr nz, .moveCursorRight
	bit D_UP_F, a
	jr nz, .incrementNybble
	bit D_DOWN_F, a
	jr nz, .decrementNybble
	bit SELECT_F, a
	jr z, .doNotUpdateOutfit
	call PlayerCust_PrevSection
.eraseHexCodeCursorReminantsAndReturn
	call EraseHexCodeSelectorCursors
.doNotUpdateOutfit
	and a
	ret

.resetSection
	call PlayerCust_ResetSection
	call EraseHollowCursorOnCustom
	jr .eraseHexCodeCursorReminantsAndReturn

.gotColour
	call PlayerCust_GotColour
	and a
	ret

.moveCursorLeft
	ld a, [wTempPlayerCustSelection]
	and a
	jr nz, .notLeftmostPos
	ld a, 6
.notLeftmostPos
	dec a
	ld [wTempPlayerCustSelection], a
	ret

.moveCursorRight
	ld a, [wTempPlayerCustSelection]
	cp 5
	jr c, .notRightmostPos
	ld a, -1
.notRightmostPos
	inc a
	ld [wTempPlayerCustSelection], a
	ret

.incrementNybble
	call GetHexCodeNybbleAddress
	jr c, .lowerNybble
	add $10
	jr .writeNewNybble
.lowerNybble
	swap a
	add $10
	swap a
.writeNewNybble
	ld [hl], a
	jr .convert24bitTo16bit

.decrementNybble
	call GetHexCodeNybbleAddress
	jr c, .lowerNybble2
	sub $10
	jr .writeNewNybble2
.lowerNybble2
	swap a
	sub $10
	swap a
.writeNewNybble2
	ld [hl], a
.convert24bitTo16bit
	ld hl, wCustomizationExpandedPal
	ld de, wTempPlayerClothesPalette
	ld c, 3
.convertLoop
	ld a, [hli]
	rrca
	rrca
	rrca
	and %00011111
	ld [de], a
	inc de
	dec c
	jr nz, .convertLoop
	scf
	ret

GetHexCodeNybbleAddress:
	ld hl, wCustomizationExpandedPal
	ld a, [wTempPlayerCustSelection]
	srl a
	push af
	ld e, a
	ld d, 0
	add hl, de
	ld d, [hl]
	pop af
	ld a, d
	ret

EraseHexCodeSelectorCursors:
	coord hl, 13, 13
	ld bc, 6
	ld a, " "
	jp ByteFill

UpdateOutfitColourMenus_HexCode:
	call PrintRGBComponents
	call Print24BitRGBPalette_NoCalculation
	jp UpdatePlayerPicColour

PLAYERCUST_MODEL    EQU 0
PLAYERCUST_SKINTONE EQU 1
PLAYERCUST_OUTFIT   EQU 2
PLAYERCUST_RESTART  EQU 3
PLAYERCUST_DONE     EQU 4
PLAYERCUST_CANCEL   EQU 5


_PlayerCust_CategoryMenu_loop:
	ld a, [wcf64]
	ld [wWhichIndexSet], a

	ld hl, WhatAspectDoYouWantToChangeText
	call PrintText
	ld hl, PlayerCust_MenuHeader
	call CopyMenuHeader
	ld hl, w2DMenuFlags1
	set 6, [hl]
	call DrawVariableLengthMenuBox
	ld a, [wcf64]
	and a
	jr nz, .skipFlagOverwrite
	ld a, %10100001
	ld [wMenuDataFlags], a
.skipFlagOverwrite
	call MenuWriteText
	call InitVerticalMenuCursor
	call GetStaticMenuJoypad
	call PlayClickSFX
	ld a, [wcf64]
	and a
	ld a, [wMenuSelection]
	jr z, .doJumptable
	cp $ff
	jr z, PlayerCust_CategoryMenu.cancel
	cp PLAYERCUST_CANCEL
	jr z, PlayerCust_CategoryMenu.cancel
.doJumptable
	jumptable PlayerCust_Categories
	bit 7, a
	ret nz
	call ClearSprites
	ld a, 1
	ldh [hOAMUpdate], a
	call ClearTileMapAndWipeAttrMap
PlayerCust_CategoryMenu:
	xor a
	ldh [hGraphicStartTile], a
	coord hl, 13, 4
	lb bc, 7, 7
	predef PlaceGraphic
	call PlayerCust_ReloadModel
	ld b, 1 << 2 | 2
	call SafeCopyTilemapAtOnce
	jr _PlayerCust_CategoryMenu_loop
.cancel
	scf
	ret

PlayerCust_Categories:
	dw PlayerCust_Model
	dw PlayerCust_Skintone
	dw PlayerCust_Outfit
	dw .restart
	dw .quit

.restart
	ld a, $80
	scf
	ret

.quit
	ld a, $80
	and a
	ret

WhatAspectDoYouWantToChangeText:
	ctxt "What aspect do you"
	line "want to change?"
	done

PlayerCust_MenuHeader:
	db $40 ; flags
	db 00, 00 ; start coords
	db 11, 10 ; end coords
	dw .MenuData2
	db 1 ; default option

.MenuData2
	db %10100000 ; flags
	db 0 ; items
	dw PlayerCust_CategoryMenuItems
	dw PlaceMenuStrings
	dw .Strings

.Strings
	db "MODEL@"
	db "SKINTONE@"
	db "OUTFIT@"
	db "RESTART@"
	db "DONE@"
	db "CANCEL@"

PlayerCust_CategoryMenuItems:
.InitialMenu
	db 5
	db PLAYERCUST_MODEL
	db PLAYERCUST_SKINTONE
	db PLAYERCUST_OUTFIT
	db PLAYERCUST_RESTART
	db PLAYERCUST_DONE
	db -1
.SalonMenu
	db 5
	db PLAYERCUST_MODEL
	db PLAYERCUST_SKINTONE
	db PLAYERCUST_OUTFIT
	db PLAYERCUST_DONE
	db PLAYERCUST_CANCEL
	db -1

PlayerCust_Model_InitialRunthrough:
	call PlayerCust_InitModelSelection
	ld a, D_LEFT | D_RIGHT | D_DOWN | D_UP | A_BUTTON
	ld [wMenuJoypadFilter], a
	jp PlayerCust_SelectModel

PlayerCust_Model:
	call PlayerCust_InitModelSelection
	jp PlayerCust_SelectModel

PlayerCust_Skintone:
	call PlayerCust_InitSkinToneSelection
	jp PlayerCust_SelectSkinTone

PlayerCust_Outfit:
	call PlayerCust_InitClothesSelection
	xor a
	ld [wJumptableIndex], a
	jr .handleLoop
.loop
	call ConsumeGenericDelay
.handleLoop
	call .RunJumptable
	ld a, [wJumptableIndex]
	bit 7, a
	jr z, .loop
	and $7f
	ret

.RunJumptable
	call RunAnonymousJumptable
; Jumptable
	dw PlayerCust_SelectClothes         ; 0
	dw PlayerCust_SelectClothesSliders  ; 1
	dw PlayerCust_SelectClothesHexCode  ; 2

PlayerCust_ReloadModel:
	ld a, [wPlayerCharacteristics]
	and $f
	push af
	call PlayerCustomization_LoadAnyPlayerSprite
	pop af
	callba GetPlayerFrontpic
	ld a, [wPlayerCharacteristics]
	swap a
	and 7
	call PlayerCust_SetSkintone_NoSetPals
	ld a, [wPlayerClothesPalette]
	ld c, a
	ld a, [wPlayerClothesPalette + 1]
	ld b, a
	push bc
	call DecompressPalette
	pop bc
	jp UpdatePlayerPicColourInBC_NoSetPals

PlayerCust_SetSkintone:
	call PlayerCust_SetSkintone_NoSetPals
	call SetPalettes
	jp DelayFrame

PlayerCust_SetSkintone_NoSetPals:
	ld hl, SkinTonePalettes
	ld bc, 2
	rst AddNTimes
	ldh a, [rSVBK]
	push af
	wbk BANK(wOriginalBGPals)
	ld de, wOriginalBGPals + 2
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hld]
	ld [de], a
	ld de, wOriginalOBJPals + 2
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	pop af
	ldh [rSVBK], a
	ret

InitCrystalData:
	xor a
	ld [wd002], a
	ld [wd003], a
	ld hl, wPlayerCharacteristics
	ld bc, wPlayerCharacteristicsEnd - wPlayerCharacteristics
	jp ByteFill

InitOxalisSalonGFX:
	call DoPlayerCustFunctionInSafeMode_InitVars
	jr FinishOxalisSalonGFXInit

DoPlayerCustFunctionInSafeMode:
	call DoPlayerCustFunctionInSafeMode_InitVars
	xor a
	ldh [hGraphicStartTile], a
	coord hl, 12, 1
	lb bc, 7, 7
	predef PlaceGraphic
	pop hl
	call _hl_
FinishOxalisSalonGFXInit:
	ld a, 1
	ldh [hOAMUpdate], a
	callba PlaySpriteAnimations
	call PlayerCust_ReloadModel
	ld b, 1 << 2 | 2
	call SafeCopyTilemapAtOnce
	ld a, 1
	ldh [hBGMapMode], a
	ret

DoPlayerCustFunctionInSafeMode_InitVars:
	xor a
	ldh [hBGMapMode], a
	ld [wTempPlayerCustSelection], a
	jp ClearTileMapAndWipeAttrMap

Print2by6BoxInLowerRightCorner:
	coord hl, 12, 14
	lb bc, 2, 6
	jp TextBox

SetUpCustomizationMenu:
	call MenuBox
	call PlaceVerticalMenuItems
	call CopyMenuData2
	jp InitVerticalMenuCursor

PlayerCust_LoadPlayerSprite:
	ld a, [wPlayerCharacteristics]
	and $f
	call PlayerCustomization_LoadAnyPlayerSprite

	ld a, SPRITE_ANIM_INDEX_PLAYER_CUSTOMIZATION
	depixel 12, 16
	jp _InitSpriteAnimStruct

PlayerCustomization_LoadAnyPlayerSprite:
	call GetPlayerSpriteHeader
	ld h, d
	ld l, e
	ld de, vObjTiles
	ld c, 16
	jp DecompressRequest2bpp
