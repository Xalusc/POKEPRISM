JugglerGroup:
	; 1
	db "JAMES@"

	db TRAINERTYPE_NORMAL

	db 10, PINECO
	db 11, BRONZOR
	db 10, KOFFING
	db 11, CHINGLING
	db -1

	; 2
	db "CESAR@"

	db TRAINERTYPE_NORMAL

	db 61, KADABRA
	db 61, ALAKAZAM
	db 62, MACHOKE
	db 63, MACHAMP
	db -1

	; 3
	db "DAXTON@"

	db TRAINERTYPE_NORMAL

	db 41, MAGMAR
	db 41, MACHOKE
	db 41, ELECTABUZZ
	db -1

	; 4
	db "ABNER@"

	db TRAINERTYPE_MOVES

	db 50, GARDEVOIR
		db METRONOME
		db 0
		db 0
		db 0

	db 50, LUCARIO
		db METRONOME
		db 0
		db 0
		db 0

	db 50, MAGMORTAR
		db METRONOME
		db 0
		db 0
		db 0

	db 50, ELECTIVIRE
		db METRONOME
		db 0
		db 0
		db 0
	db -1
