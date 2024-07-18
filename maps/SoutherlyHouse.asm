SoutherlyHouse_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

SoutherlyHouseNPC:
	ctxt "A kind trainer"
	line "traded me a KIRLIA"
	cont "a long time ago."

	para "Mine evolved into"
	line "a GALLADE!"

	para "Only a male KIRLIA"
	line "can evolve into"
	cont "a GALLADE."
	done

SoutherlyHouse_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $7, $2, 2, SOUTHERLY_CITY
	warp_def $7, $3, 2, SOUTHERLY_CITY

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 1
	person_event SPRITE_SAILOR, 3, 2, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_TEXTFP, 0, SoutherlyHouseNPC, -1
