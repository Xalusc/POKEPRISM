SoraGroup:
	; 1
	db "SORA@"

	db TRAINERTYPE_MOVES

	db 59, GYARADOS
		db DRAGON_DANCE
		db WATERFALL
		db EARTHQUAKE
		db CRUNCH

	db 57, PIDGEOT
		db BRAVE_BIRD
		db MIRROR_MOVE
		db AGILITY
		db WHIRLWIND

	db 58, DRIFBLIM
		db CURSE
		db SHADOW_BALL
		db THUNDERBOLT
		db WILL_O_WISP

	db 58, GLISCOR
		db SWORDS_DANCE
		db EARTHQUAKE
		db TOXIC
		db METAL_CLAW

	db 63, ALTARIA
		db STEEL_WING
		db SKY_ATTACK
		db DRAGON_CLAW
		db DRAGON_DANCE

	db -1

	; 2
	db "SORA@"

	db TRAINERTYPE_ITEM | TRAINERTYPE_MOVES

	db 88, GYARADOS, WATER_RING
		db DRAGON_DANCE
		db WATERFALL
		db EARTHQUAKE
		db CRUNCH

	db 85, PIDGEOT, SITRUS_BERRY
		db BRAVE_BIRD
		db MIRROR_MOVE
		db AGILITY
		db WHIRLWIND

	db 86, DRIFBLIM, FOCUS_BAND
		db CURSE
		db SHADOW_BALL
		db THUNDERBOLT
		db WILL_O_WISP

	db 87, GLISCOR, LEFTOVERS
		db SWORDS_DANCE
		db EARTHQUAKE
		db TOXIC
		db METAL_CLAW

	db 91, ALTARIA, POWER_HERB
		db STEEL_WING
		db SKY_ATTACK
		db DRAGON_CLAW
		db DRAGON_DANCE

	db -1