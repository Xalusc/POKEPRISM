	db GIBLE
	db 58, 70, 45, 42, 40, 45
	db DRAGON, GROUND
	db 45 ;catch rate
	db 67 ;exp rate
	db NO_ITEM
	db DAMP_ROCK
	db 127 ;gender
	db 100 ;unknown
	db 41 ;egg cycles
	db 5 ;unknown
	INCLUDE "gfx/pics/gible/dimensions.asm"
	db ABILITY_SAND_VEIL, ABILITY_SAND_VEIL ;abilities
	db 0, 0 ;padding
	db SLOW ;growth rate
	dn REPTILE, MONSTER ;egg groups

