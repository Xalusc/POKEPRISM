	db BAGON
	db 45, 75, 60, 50, 40, 30
	db DRAGON, DRAGON
	db 45 ;catch rate
	db 89 ;exp rate
	db NO_ITEM
	db DRAGON_FANG
	db 127 ;gender
	db 100 ;unknown
	db 41 ;egg cycles
	db 5 ;unknown
	INCLUDE "gfx/pics/bagon/dimensions.asm"
	db ABILITY_ROCK_HEAD, ABILITY_ROCK_HEAD ;abilities
	db 0, 0 ;padding
	db SLOW ;growth rate
	dn REPTILE, REPTILE ;egg groups
