	db RAYQUAZA
	db 105, 150, 90, 95, 150, 90
	db DRAGON, FLYING
	db 5 ;catch rate
	db 220 ;exp rate
	db NO_ITEM
	db NO_ITEM
	db 255 ;gender
	db 100 ;unknown
	db 121 ;egg cycles
	db 5 ;unknown
	INCLUDE "gfx/pics/rayquaza/dimensions.asm"
	db ABILITY_AIR_LOCK, ABILITY_AIR_LOCK ;abilities
	db 0, 0 ;padding
	db SLOW ;growth rate
	dn NO_EGGS, NO_EGGS ;egg groups

