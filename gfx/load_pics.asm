GetFrontpic:
	ld a, [wCurPartySpecies]
	ld [wCurSpecies], a
	call IsAPokemon
	ret c

; fallthrough
_GetFrontpic:
	push de
	call GetBaseData
	ld a, [wBasePicSize]
	and $f
	ld b, a

	push bc
	ld a, [wCurPartySpecies]
	ld hl, PicPointers
	dec a
	ld bc, 6
	rst AddNTimes
	ld a, BANK(PicPointers)
	call GetFarByteHalfword
	call FarDecompressWRA6
	swap e
	swap d
	ld a, d
	and $f0
	or e
	ld [wMonPicTileCount], a
	pop bc

	sbk BANK(sScratch)
	call PadFrontpic
	pop hl
	push hl
	ld de, sScratch
	ld c, 7 * 7
	ldh a, [hROMBank]
	ld b, a
	call Get2bpp
	pop hl
	jp CloseSRAM

GetAnimatedFrontpic:
	ld a, [wCurPartySpecies]
	ld [wCurSpecies], a
	call IsAPokemon
	ret c
	xor a
	ldh [hBGMapMode], a
	call _GetFrontpic
	ld d, h
	ld e, l
	call RunFunctionInWRA6
	; end of function

	ld h, d
	ld l, e
	vbk BANK(vWalkingFrameTiles)
	push hl
	sbk BANK(sScratch)
	ld de, sScratch
	ld c, 7 * 7
	ldh a, [hROMBank]
	ld b, a
	call Get2bpp
	scls
	ld a, BANK(wBasePicSize)
	ld hl, wBasePicSize
	call GetFarWRAMByte
	and $f
	pop hl
	ld de, 7 * 7 tiles
	add hl, de
	ld de, wDecompressScratch + (5 * 5) tiles
	ld c, 5 * 5
	cp 5
	jr z, .got_dims
	ld de, wDecompressScratch + (6 * 6) tiles
	ld c, 6 * 6
	cp 6
	jr z, .got_dims
	ld de, wDecompressScratch + (7 * 7) tiles
	ld c, 7 * 7
.got_dims
	push hl
	ld hl, wDecompressScratch
	ld a, [wMonPicTileCount]
	sub c
	ld c, a
	ld [wMonPicTileCount], a
	call LoadOrientedFrontpicTiles
	pop hl
	ld de, wDecompressScratch
	ldh a, [hROMBank]
	ld b, a
	ld a, [wMonPicTileCount]
	ld c, a
	sub (128 - 7 * 7)
	jr c, .copyAndFinish
	inc a
	ld [wMonPicTileCount], a
	ld c, (127 - 7 * 7)
	call Get2bpp

	ld de, wDecompressScratch + (127 - 7 * 7) tiles
	ld hl, vWalkingFrameTiles
	ldh a, [hROMBank]
	ld b, a
	ld a, [wMonPicTileCount]
	ld c, a
.copyAndFinish
	call Get2bpp

	vbk BANK(vFontTiles)
	ret

LoadOrientedFrontpicTiles:
; multiply c by $10 and store in bc
	push bc
	swap c
	ld a, c
	and $f
	ld b, a
	ld a, c
	and $f0
	ld c, a
; load the first odd bytes to round down bc to a multiple of $100
	push bc
	call LoadOrientedFrontpic
	pop bc
	ld a, c
	and a
	jr z, .handleLoop
	inc b
	jr .handleLoop
.loop
; load the remaining bytes in batches of $100
	push bc
	ld c, $0
	call LoadOrientedFrontpic
	pop bc
.handleLoop
	dec b
	jr nz, .loop
	pop bc
	ret

GetBackpic:
	ld a, [wCurPartySpecies]
	call IsAPokemon
	ret c

	ld a, [wCurPartySpecies]
	dec a
	ld b, a

	call RunFunctionInWRA6
	; end of function

	push de
	ld a, b
	ld hl, PicPointers + 3
	ld bc, 6
	rst AddNTimes
	ld a, BANK(PicPointers)
	call GetFarByteHalfword
	call FarDecompressWRA6
	ld hl, wDecompressScratch
	ld c, 6 * 6
	call FixBackpicAlignment
	pop hl
	ld de, wDecompressScratch
	ldh a, [hROMBank]
	ld b, a
	jp Get2bpp

GetTrainerPic:
	ld a, [wTrainerClass]
	and a
	ret z
	cp NUM_TRAINER_CLASSES
	ret nc
	call ApplyTilemapInVBlank
GetTrainerPic_NoWaitBGMap:
	xor a
	ldh [hBGMapMode], a
	ld hl, TrainerPicPointers
	ld a, [wTrainerClass]
	dec a
	ld bc, 3
	rst AddNTimes
	ld a, BANK(TrainerPicPointers)
	call GetFarByteHalfword
	ld b, a
	ld c, 7 * 7
	ld a, [wTrainerClass]
	cp PATROLLER
	jr nz, .compressed
	push hl
	ld h, d
	ld l, e
	pop de
	call Request2bpp
	jr .waitBGMap
.compressed
	call DecompressRequest2bpp
.waitBGMap
	vbk BANK(vBGMap)
	jp ApplyTilemapInVBlank

FixBackpicAlignment:
	push de
	push bc
	ld a, [wBoxAlignment]
	and a
	jr z, .keep_dims
	ld de, 6 * 6 tiles
.got_dims
	ld a, [hl]

	; reverses the bits of a
	ld b, a
	rlca
	rlca
	xor b
	and $aa
	xor b
	ld b, a
	swap b
	xor b
	and $33
	xor b
	rrca

	ld [hli], a
	dec de
	ld a, e
	or d
	jr nz, .got_dims

.keep_dims
	pop bc
	pop de
	ret

PadFrontpic:
; pads frontpic to fill 7x7 box
	call RunFunctionInWRA6
	; end of function

	ld hl, sScratch
	ld de, wDecompressScratch
	ld a, b
	sub 5
	jr z, .five
	dec a
	jr z, .six

.seven_loop
	ld c, 7 tiles
	call LoadOrientedFrontpic
	dec b
	jr nz, .seven_loop
	ret

.six
	ld c, 7 tiles
	xor a
	call .Fill
.six_loop
	ld c, 1 tiles
	xor a
	call .Fill
	ld c, 6 tiles
	call LoadOrientedFrontpic
	dec b
	jr nz, .six_loop
	ret

.five
	ld c, 7 tiles
	xor a
	call .Fill
.five_loop
	ld c, 2 tiles
	xor a
	call .Fill
	ld c, 5 tiles
	call LoadOrientedFrontpic
	dec b
	jr nz, .five_loop
	ld c, 7 tiles
	xor a
.Fill
	ld [hli], a
	dec c
	jr nz, .Fill
	ret

LoadOrientedFrontpic:
; load fronpic from de to hl
; x flipped if [wBoxAlignment] is nonzero
	ld a, [wBoxAlignment]
	and a
	jr nz, .x_flip
.left_loop
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .left_loop
	ret

.x_flip
	push bc
.right_loop
	ld a, [de]
	inc de

; https://github.com/pret/pokecrystal/wiki/Optimizing-assembly-code#reverse-the-bits-of-a
	ld b, a
	rlca
	rlca
	xor b
	and $aa
	xor b
	ld b, a
	swap b
	xor b
	and $33
	xor b
	rrca

	ld [hli], a
	dec c
	jr nz, .right_loop
	pop bc
	ret
