	db RHYHORN
	db 80, 85, 95, 25, 30, 30
	db GROUND, ROCK
	db 120 ;catch rate
	db 135 ;exp rate
	db NO_ITEM
	db HARD_STONE
	db 127 ;gender
	db 100 ;unknown
	db 20 ;egg cycles
	db 5 ;unknown
	INCLUDE "gfx/pics/rhyhorn/dimensions.asm"
	db ABILITY_LIGHTNINGROD, ABILITY_ROCK_HEAD ;abilities
	db 0, 0 ;padding
	db SLOW ;growth rate
	dn FIELD, MONSTER ;egg groups

