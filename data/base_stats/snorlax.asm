	db SNORLAX
	db 160, 110, 65, 30, 65, 110
	db NORMAL, NORMAL
	db 25 ;catch rate
	db 154 ;exp rate
	db LEFTOVERS
	db LEFTOVERS
	db 31 ;gender
	db 100 ;unknown
	db 40 ;egg cycles
	db 5 ;unknown
	INCLUDE "gfx/pics/snorlax/dimensions.asm"
	db ABILITY_IMMUNITY, ABILITY_THICK_FAT ;abilities
	db 0, 0 ;padding
	db SLOW ;growth rate
	dn MONSTER, MONSTER ;egg groups

