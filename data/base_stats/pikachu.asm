	db PIKACHU
	db 35, 55, 40, 90, 50, 50
	db ELECTRIC, ELECTRIC
	db 190 ;catch rate
	db 82 ;exp rate
	db NO_ITEM
	db ORAN_BERRY
	db 127 ;gender
	db 100 ;unknown
	db 10 ;egg cycles
	db 5 ;unknown
	INCLUDE "gfx/pics/pikachu/dimensions.asm"
	db ABILITY_STATIC, ABILITY_STATIC ;abilities
	db 0, 0 ;padding
	db MEDIUM_FAST ;growth rate
	dn FAIRY, FIELD ;egg groups

