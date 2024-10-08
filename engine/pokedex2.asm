AnimateDexSearchSlowpoke:
	ld hl, .FrameIDs
	ld b, 25
.loop
	ld a, [hli]

	; Wrap around
	cp $fe
	jr nz, .ok
	ld hl, .FrameIDs
	ld a, [hli]
.ok

	ld [wDexSearchSlowpokeFrame], a
	ld a, [hli]
	ld c, a
	push bc
	push hl
	call DoDexSearchSlowpokeFrame
	pop hl
	pop bc
	call DelayFrames
	dec b
	jr nz, .loop
	xor a
	ld [wDexSearchSlowpokeFrame], a
	call DoDexSearchSlowpokeFrame
	ld c, 32
	jp DelayFrames

.FrameIDs
	; frame ID, duration
	db 0, 7
	db 1, 7
	db 2, 7
	db 3, 7
	db 4, 7
	db -2

DoDexSearchSlowpokeFrame:
	ld a, [wDexSearchSlowpokeFrame]
	ld hl, .SpriteData
	ld de, wSprites
.loop
	ld a, [hli]
	cp -1
	ret z
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [wDexSearchSlowpokeFrame]
	ld b, a
	add a
	add b
	add [hl]
	inc hl
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	jr .loop

.SpriteData
	dsprite 11, 0,  9, 0, $00, $00
	dsprite 11, 0, 10, 0, $01, $00
	dsprite 11, 0, 11, 0, $02, $00
	dsprite 12, 0,  9, 0, $10, $00
	dsprite 12, 0, 10, 0, $11, $00
	dsprite 12, 0, 11, 0, $12, $00
	dsprite 13, 0,  9, 0, $20, $00
	dsprite 13, 0, 10, 0, $21, $00
	dsprite 13, 0, 11, 0, $22, $00
	db -1

DisplayDexEntry:
	call GetPokemonName
	hlcoord 9, 3
	call PlaceString ; mon species
	ld a, [wd265]
	ld b, a
	call GetDexEntryPointer
	ld a, b
	push af
	hlcoord 9, 5
	call FarPlaceText ; dex species
	push hl
; Print dex number
	hlcoord 2, 8
	ld a, $5c ; No
	ld [hli], a
	ld a, $5d ; .
	ld [hli], a
	push hl
	callba Pokedex_GetNaljoNum
	pop hl
	ld de, wDexSearchMonType2
	lb bc, PRINTNUM_LEADINGZEROS | 1, 3
	call PrintNum
; Check to see if we caught it.  Get out of here if we haven't.
	ld a, [wd265]
	dec a
	call CheckCaughtMon
	pop hl
	pop bc
	ret z
; Get the height of the Pokemon.
	ld a, [wCurPartySpecies]
	ld [wCurSpecies], a
	ld a, b
	push af
	push hl
	call GetFarHalfword
	ld d, h
	ld e, l
	ld a, d
	or e
	call nz, PrintDexHeight
	pop hl
	inc hl
	inc hl
	pop af
	push af
	inc hl
	push hl
	dec hl
	call GetFarHalfword
	ld d, h
	ld e, l
	ld a, e
	or d
	call nz, PrintDexWeight
	lb bc, 5, SCREEN_WIDTH - 2
	hlcoord 2, 11
	call ClearBox
	hlcoord 1, 10
	ld bc, SCREEN_WIDTH - 1
	ld a, $61 ; horizontal divider
	call ByteFill
	hlcoord 1, 9
	ld [hl], $55
	inc hl
	ld [hl], $55
	hlcoord 1, 10
	ld [hl], $56 ; P.
	inc hl
	ld a, [wPokedexStatus]
	and a
	pop de
	pop bc
	inc de
	ld a, b
	jr nz, .page_2

.page_1
	; page number
	ld [hl], $57 ; 1
	inc de
	jr .print_dex_entry

.page_2
	; page number
	ld [hl], $58 ; 2
	push af
	ld h, d
	ld l, e
	call GetFarByte
	inc a
	ld e, a
	ld d, 0
	add hl, de
	ld d, h
	ld e, l
	pop af

.print_dex_entry
	hlcoord 2, 11
	jp FarPlaceText

PrintDexHeight:
	ld a, [wOptions2]
	and 1 << 2
	hlcoord 12, 7
	jr z, PrintWithTenths
	callba ConvertDecimetersToFeetAndInches
	ret c
	push de
	push hl
	ld hl, sp + 3
	ld d, h
	ld e, l
	lb bc, 1, 3
	pop hl
	push hl
	call PrintNum
	pop hl
	pop de
	ld a, e
	ld bc, 5
	add hl, bc
	ld d, " "
	add a, "0" ; assume "0" = $f6
	jr nc, .one_digit_inches
	sub 10
	ld d, "1"
.one_digit_inches
	ld [hld], a
	ld [hl], d
	ret

PrintDexWeight:
	ld a, [wOptions2]
	and 1 << 2
	jr z, .metric
	callba ConvertKilogramsToPounds
	ret c
.metric
	hlcoord 12, 9
PrintWithTenths:
	ld a, d
	ldh [hDividend], a
	ld a, e
	ldh [hDividend + 1], a
	ld a, 10
	ldh [hDivisor], a
	ld b, 2
	predef Divide
	ldh a, [hQuotient + 1]
	ld e, a
	ldh a, [hQuotient + 2]
	ld d, a
	push de
	ldh a, [hRemainder]
	push af
	push hl
	ld hl, sp + 4
	ld d, h
	ld e, l
	pop hl
	push hl
	lb bc, 2, 4
	call PrintNum
	pop hl
	pop af
	pop de
	ld bc, 5
	add hl, bc
	add a, "0"
	ld [hld], a
	ld [hl], "."
	ret

GetDexEntryPointer:
; return dex entry pointer b:de
	push hl
	ld hl, PokedexDataPointerTable
	ld a, b
	dec a
	ld d, 0
	ld e, a
	add hl, de
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	rlca
	rlca
	and $3
	ld hl, PokedexEntryBanks
	ld d, 0
	ld e, a
	add hl, de
	ld b, [hl]
	pop de
	pop hl
	ret

GetDexEntryPagePointer:
	call GetDexEntryPointer ; b:de
	push hl
	push bc
	ld h, d
	ld l, e
; skip species name
	ld a, b
	ld hl, $fea0 ; nothing is mapped to this address, so this is a dummy write
	call FarPlaceText
; skip height and weight
	ld bc, 4
	add hl, bc
	pop bc
	ld a, b
	call GetFarByteAndIncrement
; if c != 1: skip entry
	dec c
	jr z, .done
; skip entry
	add a, l
	ld l, a
	adc h
	sub l
	ld h, a
.done
	ld d, h
	ld e, l
	pop hl
	ret

INCLUDE "data/pokedex/entry_pointers.asm"
