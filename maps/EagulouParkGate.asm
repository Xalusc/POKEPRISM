EagulouParkGate_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

EagulouParkGateAttendant:
	ctxt "Welcome to"
	line "EAGULOU PARK!"

	para "The rules have"
	line "changed recently."

	para "Everyone is"
	line "allowed to enter,"
	cont "free of charge,"
	para "but you must use"
	line "PARK BALLS to"
	para "catch #MON; you"
	line "can buy some in"
	cont "the local MART."

	para "You're also not"
	line "allowed to hurt"
	para "the #MON, even"
	line "if they decide to"
	para "attack you; so be"
	line "careful!"
	done

EagulouParkGate_MapEventHeader:: db 0, 0

.Warps
	db 4
	warp_def $0, $3, 1, EAGULOU_PARK_3
	warp_def $0, $4, 2, EAGULOU_PARK_3
	warp_def $5, $3, 4, EAGULOU_CITY
	warp_def $5, $4, 4, EAGULOU_CITY

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 1
	person_event SPRITE_OFFICER, 2, 1, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_TEXTFP, 0, EagulouParkGateAttendant, -1
