	db ARMALDO
	db 75, 125, 100, 45, 70, 80
	db ROCK, BUG
	db 45 ;catch rate
	db 199 ;exp rate
	db NO_ITEM
	db SMOOTH_ROCK
	db 31 ;gender
	db 100 ;unknown
	db 31 ;egg cycles
	db 5 ;unknown
	INCLUDE "gfx/pics/armaldo/dimensions.asm"
	db ABILITY_BATTLE_ARMOR, ABILITY_BATTLE_ARMOR ;abilities
	db 0, 0 ;padding
	db ERRATIC ;growth rate
	dn INVERTEBRATE, INVERTEBRATE ;egg groups

