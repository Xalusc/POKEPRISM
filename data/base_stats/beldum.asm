	db BELDUM
	db 40, 55, 80, 30, 35, 60
	db STEEL, PSYCHIC
	db 3 ;catch rate
	db 103 ;exp rate
	db NO_ITEM
	db METAL_COAT
	db 255 ;gender
	db 100 ;unknown
	db 41 ;egg cycles
	db 5 ;unknown
	INCLUDE "gfx/pics/beldum/dimensions.asm"
	db ABILITY_CLEAR_BODY, ABILITY_CLEAR_BODY ;abilities
	db 0, 0 ;padding
	db SLOW ;growth rate
	dn INANIMATE, INANIMATE ;egg groups

