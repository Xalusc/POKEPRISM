	db FLYGON
	db 80, 100, 80, 100, 80, 80
	db GROUND, DRAGON
	db 45 ;catch rate
	db 197 ;exp rate
	db NO_ITEM
	db DRAGON_FANG
	db 127 ;gender
	db 100 ;unknown
	db 21 ;egg cycles
	db 5 ;unknown
	INCLUDE "gfx/pics/flygon/dimensions.asm"
	db ABILITY_LEVITATE, ABILITY_LEVITATE ;abilities
	db 0, 0 ;padding
	db MEDIUM_SLOW ;growth rate
	dn INSECT, REPTILE ;egg groups

