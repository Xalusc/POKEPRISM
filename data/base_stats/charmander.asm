	db CHARMANDER
	db 39, 52, 43, 65, 60, 50
	db FIRE, FIRE
	db 45 ;catch rate
	db 65 ;exp rate
	db NO_ITEM
	db CHARCOAL
	db 31 ;gender
	db 100 ;unknown
	db 20 ;egg cycles
	db 5 ;unknown
	INCLUDE "gfx/pics/charmander/dimensions.asm"
	db ABILITY_BLAZE, ABILITY_BLAZE ;abilities
	db 0, 0 ;padding
	db MEDIUM_SLOW ;growth rate
	dn REPTILE, MONSTER ;egg groups

