	db GARDEVOIR
	db 68, 65, 65, 80, 125, 115
	db PSYCHIC, FAIRY_T
	db 45 ;catch rate
	db 208 ;exp rate
	db NO_ITEM
	db NO_ITEM
	db 127 ;gender
	db 100 ;unknown
	db 21 ;egg cycles
	db 5 ;unknown
	INCLUDE "gfx/pics/gardevoir/dimensions.asm"
	db ABILITY_SYNCHRONIZE, ABILITY_TRACE ;abilities
	db 0, 0 ;padding
	db SLOW ;growth rate
	dn AMORPHOUS, HUMANSHAPE ;egg groups
