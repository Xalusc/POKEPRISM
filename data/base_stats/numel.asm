	db NUMEL
	db 60, 60, 40, 35, 65, 45
	db FIRE, GROUND
	db 255 ;catch rate
	db 88 ;exp rate
	db ASPEAR_BERRY
	db ASPEAR_BERRY
	db 127 ;gender
	db 100 ;unknown
	db 21 ;egg cycles
	db 5 ;unknown
	INCLUDE "gfx/pics/numel/dimensions.asm"
	db ABILITY_OBLIVIOUS, ABILITY_SIMPLE ;abilities
	db 0, 0 ;padding
	db MEDIUM_FAST ;growth rate
	dn FIELD, FIELD ;egg groups

