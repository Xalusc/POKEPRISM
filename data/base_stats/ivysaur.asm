	db IVYSAUR
	db 60, 62, 63, 60, 80, 80
	db GRASS, POISON
	db 45 ;catch rate
	db 141 ;exp rate
	db NO_ITEM
	db MIRACLE_SEED
	db 31 ;gender
	db 100 ;unknown
	db 20 ;egg cycles
	db 5 ;unknown
	INCLUDE "gfx/pics/ivysaur/dimensions.asm"
	db ABILITY_OVERGROW, ABILITY_OVERGROW ;abilities
	db 0, 0 ;padding
	db MEDIUM_SLOW ;growth rate
	dn PLANT, MONSTER ;egg groups

