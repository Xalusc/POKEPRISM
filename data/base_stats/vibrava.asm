	db VIBRAVA
	db 50, 70, 50, 70, 50, 50
	db GROUND, DRAGON
	db 120 ;catch rate
	db 126 ;exp rate
	db NO_ITEM
	db DRAGON_FANG
	db 127 ;gender
	db 100 ;unknown
	db 21 ;egg cycles
	db 5 ;unknown
	INCLUDE "gfx/pics/vibrava/dimensions.asm"
	db ABILITY_LEVITATE, ABILITY_LEVITATE ;abilities
	db 0, 0 ;padding
	db MEDIUM_SLOW ;growth rate
	dn INSECT, REPTILE ;egg groups