LoadMapGroupRoof::
	ld a, [wMapGroup]
	ld e, a
	ld d, 0
	ld hl, MapGroupRoofs
	add hl, de
	ld a, [hl]
	cp $ff
	ret z
	ld hl, Roofs
	ld bc, 9 tiles
	ld de, vBGTiles tile $0a
	jp CopyNthStruct

MapGroupRoofs:
	db -1 ; group 1
	db  3 ; group 2
	db  2 ; group 3
	db -1 ; group 4
	db  1 ; group 5
	db  2 ; group 6
	db -1 ; group 7
	db -1 ; group 8
	db  2 ; group 9
	db  2 ; group 10
	db  1 ; group 11
	db  4 ; group 12
	db -1 ; group 13
	db -1 ; group 14
	db -1 ; group 15
	db -1 ; group 16
	db -1 ; group 17
	db -1 ; group 18
	db -1 ; group 19
	db  0 ; group 20
	db -1 ; group 21
	db -1 ; group 22
	db  3 ; group 23
	db -1 ; group 24
	db  0 ; group 25
	db -1 ; group 26
	db -1 ; group 27
	db -1 ; group 28


Roofs:
INCBIN "gfx/tilesets/roofs/0.2bpp"
INCBIN "gfx/tilesets/roofs/1.2bpp"
INCBIN "gfx/tilesets/roofs/2.2bpp"
INCBIN "gfx/tilesets/roofs/3.2bpp"
INCBIN "gfx/tilesets/roofs/4.2bpp"
