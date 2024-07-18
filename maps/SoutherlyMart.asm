SoutherlyMart_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

SoutherlyMartNPC1:
	ctxt "I'm here to study"
	line "the odd paranormal"
	para "activity in the"
	line "ESPO FOREST."
	done

SoutherlyMartNPC2:
	ctxt "X SPECIAL boosts a"
	line "#MON's SPECIAL"
	cont "ATTACK in battle."

	para "I thought it would"
	line "increase its"
	para "SPECIAL DEFENSE"
	line "as well<...>"
	done

SoutherlyMart_MapEventHeader:
	db 0, 0

	;warps
	db 2
	warp_def $7, $6, 4, SOUTHERLY_CITY
	warp_def $7, $7, 4, SOUTHERLY_CITY

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 3
	person_event SPRITE_SCIENTIST, 2, 11, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, SoutherlyMartNPC1, -1
	person_event SPRITE_LASS, 6, 4, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, SoutherlyMartNPC2, -1
	person_event SPRITE_CLERK, 3, 6, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_MART, 0, MART_STANDARD, SOUTHERLY_STANDARD_MART, -1
