Draw2DMenu:
	xor a
	ldh [hBGMapMode], a
	call MenuBox
	jp Place2DMenuItemStrings

_2DMenu_::
	ld hl, CopyMenuData2
	ld a, [wMenuData_2DMenuItemStringsBank]
	call FarCall_hl

	call Draw2DMenu
	call UpdateSprites
	call ApplyTilemap

Get2DMenuSelection:
	call Init2DMenuCursorPosition
	call DoMenuJoypadLoop
	call MenuClickSound
	ld a, [wMenuDataFlags]
	bit 1, a
	jr z, .skip
	call GetMenuJoypad
	bit SELECT_F, a
	jr nz, .quit

.skip
	ld a, [wMenuDataFlags]
	rra
	jr c, .skip2
	call GetMenuJoypad
	bit B_BUTTON_F, a
	jr nz, .quit

.skip2
	ld a, [w2DMenuNumCols]
	ld c, a

	ld hl, wMenuCursorY
	ld a, [hli]
	dec a

	ld l, [hl] ; wMenuCursorX

	rst AddNTimes
	ld a, l
	ld [wMenuCursorBuffer], a

	and a
	ret

.quit
	scf
	ret

Get2DMenuNumberOfColumns:
	ld a, [wMenuData_2DMenuDimensions]
	and $f
	ret

Get2DMenuNumberOfRows:
	ld a, [wMenuData_2DMenuDimensions]
	swap a
	and $f
	ret

Place2DMenuItemStrings:
	ld hl, wMenuData_2DMenuItemStringsAddr
	ld e, [hl]
	inc hl
	ld d, [hl]
	call GetMenuTextStartCoord
	call Coord2Tile
	call Get2DMenuNumberOfRows
	ld b, a
.row
	push bc
	push hl
	call Get2DMenuNumberOfColumns
	ld c, a
.col
	push bc
	ld a, [wMenuData_2DMenuItemStringsBank]
	call PlaceFarString
	inc de
	ld a, [wMenuData_2DMenuSpacing]
	ld c, a
	ld b, 0
	add hl, bc
	pop bc
	dec c
	jr nz, .col
	pop hl
	ld bc, 2 * SCREEN_WIDTH
	add hl, bc
	pop bc
	dec b
	jr nz, .row
	ld hl, wMenuData_2DMenuFunctionAddr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	or h
	ret z
	ld a, [wMenuData_2DMenuFunctionBank]
	jp FarCall_hl

Init2DMenuCursorPosition:
	call GetMenuTextStartCoord
	ld a, b
	ld [w2DMenuCursorInitY], a
	dec c
	ld a, c
	ld [w2DMenuCursorInitX], a
	call Get2DMenuNumberOfRows
	ld [w2DMenuNumRows], a
	call Get2DMenuNumberOfColumns
	ld [w2DMenuNumCols], a
	call .InitFlags_a
	call .InitFlags_b
	call .InitFlags_c
	ld a, [w2DMenuNumCols]
	ld e, a
	ld a, [wMenuCursorBuffer]
	ld b, a
	xor a
	ld d, 0
.loop
	inc d
	add e
	cp b
	jr c, .loop
	sub e
	ld c, a
	ld a, b
	sub c
	and a
	jr z, .reset1
	cp e
	jr z, .okay1
	jr c, .okay1
.reset1
	ld a, 1
.okay1
	ld [wMenuCursorX], a
	ld a, [w2DMenuNumRows]
	ld e, a
	ld a, d
	and a
	jr z, .reset2
	cp e
	jr z, .okay2
	jr c, .okay2
.reset2
	ld a, 1
.okay2
	ld [wMenuCursorY], a
	xor a
	ld [wCursorOffCharacter], a
	ld [wCursorCurrentTile], a
	ld [wCursorCurrentTile + 1], a
	ret

.InitFlags_a
	xor a
	ld hl, w2DMenuFlags1
	ld [hli], a
	ld [hld], a
	ld a, [wMenuDataFlags]
	bit 5, a
	ret z
	set 5, [hl]
	set 4, [hl]
	ret

.InitFlags_b
	ld a, [wMenuData_2DMenuSpacing]
	or $20
	ld [w2DMenuCursorOffsets], a
	ret

.InitFlags_c
	ld hl, wMenuDataFlags
	ld a, A_BUTTON
	bit 0, [hl]
	jr nz, .skip
	or B_BUTTON
.skip
	bit 1, [hl]
	jr z, .skip2
	or SELECT
.skip2
	ld [wMenuJoypadFilter], a
	ret

_DoMenuJoypadLoop::
	ld hl, w2DMenuFlags2
	res 7, [hl]
	ldh a, [hBGMapMode]
	push af
	call MenuJoypadLoop
	pop af
	ldh [hBGMapMode], a
	ret

MenuJoypadLoop:
	call Move2DMenuCursor
	call UpdateMenuBGMap_OAM
	call Do2DMenuRTCJoypad
	jr nc, .done
	call _2DMenuInterpretJoypad.dispatch
	jr c, .done
	ld a, [w2DMenuFlags1]
	bit 7, a
	jr nz, .done
	call GetMenuJoypad
	ld b, a
	ld a, [wMenuJoypadFilter]
	and b
	jr z, MenuJoypadLoop
.done
	jp Move2DMenuCursor

UpdateMenuBGMap_OAM:
	ldh a, [hOAMUpdate]
	push af
	ld a, 1
	ldh [hOAMUpdate], a
	ldh [hBGMapMode], a
	ld a, [w2DMenuFlags1]
	bit 6, a
	call z, DelayFrame
	call DelayFrame
.done
	pop af
	ldh [hOAMUpdate], a
	xor a
	ldh [hBGMapMode], a
	ret

_Do2DMenuRTCJoypad_loopRTC:
	call DelayFrame
Do2DMenuRTCJoypad:
	call RTC
	call Menu_WasButtonPressed
	ret c
	ld a, [w2DMenuFlags1]
	bit 7, a
	jr z, _Do2DMenuRTCJoypad_loopRTC
	and a
	ret

Menu_WasButtonPressed:
	ld a, [w2DMenuFlags1]
	bit 6, a
	jr z, .skip_to_joypad
	ld a, 1
	ldh [hBGMapMode], a
	callba PlaySpriteAnimationsAndDelayFrame
	xor a
	ldh [hBGMapMode], a
.skip_to_joypad
	call JoyTextDelay
	call GetMenuJoypad
	and a
	ret z
	scf
	ret

_2DMenuInterpretJoypad:

.d_down
	ld hl, wMenuCursorY
	ld a, [w2DMenuNumRows]
	cp [hl]
	jr z, .check_wrap_around_down
	inc [hl]
	xor a
	ret

.check_wrap_around_down
	ld a, [w2DMenuFlags1]
	bit 5, a
	jr nz, .wrap_around_down
	bit 3, a
	jr nz, .set_bit_7
	xor a
	ret

.wrap_around_down
	ld [hl], 1
	xor a
	ret

.d_up
	ld hl, wMenuCursorY
	ld a, [hl]
	dec a
	jr z, .check_wrap_around_up
	ld [hl], a
	xor a
	ret

.check_wrap_around_up
	ld a, [w2DMenuFlags1]
	bit 5, a
	jr nz, .wrap_around_up
	bit 2, a
	jr nz, .set_bit_7
	xor a
	ret

.wrap_around_up
	ld a, [w2DMenuNumRows]
	ld [hl], a
	xor a
	ret

.dispatch:
	call GetMenuJoypad
	bit A_BUTTON_F, a
	jr nz, .a_b_start_select
	bit B_BUTTON_F, a
	jr nz, .a_b_start_select
	bit SELECT_F, a
	jr nz, .a_b_start_select
	bit START_F, a
	jr nz, .a_b_start_select
	bit D_RIGHT_F, a
	jr nz, .d_right
	bit D_LEFT_F, a
	jr nz, .d_left
	bit D_UP_F, a
	jr nz, .d_up
	bit D_DOWN_F, a
	jr nz, .d_down
	and a
	ret

.set_bit_7
	ld hl, w2DMenuFlags2
	set 7, [hl]
	scf
	ret

.d_left
	ld hl, wMenuCursorX
	ld a, [hl]
	dec a
	jr z, .check_wrap_around_left
	ld [hl], a
	xor a
	ret

.check_wrap_around_left
	ld a, [w2DMenuFlags1]
	bit 4, a
	jr nz, .wrap_around_left
	bit 1, a
	jr nz, .set_bit_7
	xor a
	ret

.wrap_around_left
	ld a, [w2DMenuNumCols]
	ld [hl], a
	xor a
	ret

.d_right
	ld hl, wMenuCursorX
	ld a, [w2DMenuNumCols]
	cp [hl]
	jr z, .check_wrap_around_right
	inc [hl]
	xor a
	ret

.check_wrap_around_right
	ld a, [w2DMenuFlags1]
	bit 4, a
	jr nz, .wrap_around_right
	bit 0, a
	jr nz, .set_bit_7
	xor a
	ret

.wrap_around_right
	ld [hl], 1
	xor a
	ret

.a_b_start_select
	xor a
	ret

Move2DMenuCursor:
	ld hl, wCursorCurrentTile
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hl]
	cp "▶"
	jr nz, Place2DMenuCursor
	ld a, [wCursorOffCharacter]
	ld [hl], a
Place2DMenuCursor:
	ld a, [w2DMenuCursorInitY]
	ld b, a
	ld a, [w2DMenuCursorInitX]
	ld c, a
	call Coord2Tile
	ld a, [w2DMenuCursorOffsets]
	swap a
	and $f
	jr z, .got_row
	ld c, a
	ld a, [wMenuCursorY]
	ld b, a
	xor a
	jr .handleLoop
.row_loop
	add c
.handleLoop
	dec b
	jr nz, .row_loop
.got_row
	ld c, SCREEN_WIDTH
	rst AddNTimes
	ld a, [w2DMenuCursorOffsets]
	and $f
	jr z, .got_col
	ld c, a
	ld a, [wMenuCursorX]
	ld b, a
	xor a
	dec b
	jr z, .got_col
.col_loop
	add c
	dec b
	jr nz, .col_loop
.got_col
	ld c, a
	add hl, bc
	ld a, [hl]
	cp "▶"
	jr z, .cursor_on
	ld [wCursorOffCharacter], a
	ld [hl], "▶"

.cursor_on
	ld a, l
	ld [wCursorCurrentTile], a
	ld a, h
	ld [wCursorCurrentTile + 1], a
	ret

_PushWindow::
	ldh a, [rSVBK]
	push af
	wbk BANK(wWindowStackBottom)

	ld hl, wWindowStackPointer
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de

	ld b, $10
	ld hl, wMenuFlags
.loop
	ld a, [hli]
	ld [de], a
	dec de
	dec b
	jr nz, .loop

; If bit 6 or 7 of the menu flags is set, set bit 0 of the address
; at 7:[wWindowStackPointer], and draw the menu using the coordinates from the header.
; Otherwise, reset bit 0 of 7:[wWindowStackPointer].
	ld a, [wMenuFlags]
	bit 6, a
	jr z, .not_bit_6

	ld hl, wWindowStackPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	set 0, [hl]
	call PushWindow_MenuBoxCoordToTile
	call .copy
	call PushWindow_MenuBoxCoordToAttr
	call .copy
	jr .done

.not_bit_6
	pop hl ; last-pushed register was de
	push hl
	ld a, [hld]
	ld l, [hl]
	ld h, a
	res 0, [hl]

.done
	pop hl
	ld a, h
	ld [de], a
	dec de
	ld a, l
	ld [de], a
	dec de
	ld hl, wWindowStackPointer
	ld [hl], e
	inc hl
	ld [hl], d

	pop af
	ldh [rSVBK], a
	ld hl, wWindowStackSize
	inc [hl]
	ret

.copy
	call GetTileBackupMenuBoxDims

.row
	push bc
	push hl

.col
	ld a, [hli]
	ld [de], a
	dec de
	dec c
	jr nz, .col

	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc
	pop bc
	dec b
	jr nz, .row

	ret

_ExitMenu::
	xor a
	ldh [hBGMapMode], a

	ldh a, [rSVBK]
	push af
	wbk BANK(wWindowStackBottom)

	call GetWindowStackTop
	ld a, l
	or h
	jr z, .cantExitMenu

	ld a, l
	ld [wWindowStackPointer], a
	ld a, h
	ld [wWindowStackPointer + 1], a
	call PopWindow

	ld a, [wMenuFlags]
	bit 0, a
	jr z, .pop_stack
	ld d, h
	ld e, l
	call RestoreTileBackup

.pop_stack
	call GetWindowStackTop
	ld a, h
	or l
	call nz, PopWindow

	pop af
	ldh [rSVBK], a
	ld hl, wWindowStackSize
	dec [hl]
	ret

.cantExitMenu
	ldh [hCrashSavedA], a
	ld a, 13
	jp Crash

_InitVerticalMenuCursor::
	ld a, [wMenuDataFlags]
	ld b, a
	ld hl, w2DMenuCursorInitY
	ld a, [wMenuBorderTopCoord]
	inc a
	bit 6, b
	jr nz, .skip_offset
	inc a
.skip_offset
	ld [hli], a
; w2DMenuCursorInitX
	ld a, [wMenuBorderLeftCoord]
	inc a
	ld [hli], a
; w2DMenuNumRows
	ld a, [wMenuDataItems]
	ld [hli], a
; w2DMenuNumCols
	ld a, 1
	ld [hli], a
; w2DMenuFlags1
	ld [hl], 0
	bit 5, b
	jr z, .skip_bit_5
	set 5, [hl]
.skip_bit_5
	ld a, [wMenuFlags]
	bit 4, a
	jr z, .skip_bit_6
	set 6, [hl]
.skip_bit_6
	inc hl
; w2DMenuFlags2
	xor a
	ld [hli], a
; w2DMenuCursorOffsets
	ln a, 2, 0
	ld [hli], a
; wMenuJoypadFilter
	ld a, A_BUTTON
	bit 0, b
	jr nz, .skip_bit_1
	add B_BUTTON
.skip_bit_1
	ld [hli], a
; wMenuCursorY
	ld a, [wMenuCursorBuffer]
	and a
	jr z, .load_at_the_top
	ld c, a
	ld a, [wMenuDataItems]
	cp c
	jr nc, .load_position
.load_at_the_top
	ld c, 1
.load_position
	ld [hl], c
	inc hl
; wMenuCursorX
	ld a, 1
	ld [hli], a
; wCursorOffCharacter, wCursorCurrentTile
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ret
