SabrinaGroup:
	; 1
	db "SABRINA@"

	db TRAINERTYPE_ITEM | TRAINERTYPE_MOVES

	db 83, SLOWKING, LEFTOVERS
		db PSYCHIC_M
		db FIRE_BLAST
		db HYDRO_PUMP
		db REST

	db 84, GALLADE, SITRUS_BERRY ; Sharpness
		db PSYCHO_CUT
		db SWORDS_DANCE
		db SUBSTITUTE
		db DRAIN_PUNCH

	db 86, VENOMOTH, TWISTEDSPOON ; Tinted Lens
		db PSYCHIC_M
		db SLEEP_POWDER
		db BUG_BUZZ
		db STEEL_EATER

	db 88, ESPEON, LUM_BERRY
		db PSYCHIC_M
		db CALM_MIND
		db SHADOW_BALL
		db SAND_ATTACK

	db 90, ALAKAZAM, SPELL_TAG
		db PSYCHIC_M
		db CALM_MIND
		db SHADOW_BALL
		db SUBSTITUTE

	db -1