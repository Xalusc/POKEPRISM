GoldenrodPokecenter_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

GoldenrodPokecenterNPC1:
	ctxt "I helped rebuild"
	line "GOLDENROD after"
	para "that huge"
	line "earthquake a"
	para "couple of years"
	line "ago."

	para "We're not done"
	line "yet; we still"
	para "have to rebuild"
	line "the RADIO TOWER."
	done

GoldenrodPokecenterNPC2:
	ctxt "If you had a radio"
	line "before GOLDENROD"
	para "was shook up, you"
	line "could listen to"
	para "music broadcasted"
	line "by the RADIO"
	cont "TOWER."
	done

GoldenrodPokecenterNPC3:
	ctxt "The number of"
	line "different kinds"
	para "of #MON in the"
	line "world keeps"
	para "growing, because"
	line "there's always"
	para "new #MON to"
	line "discover."
	done

GoldenrodPokecenter_MapEventHeader:: db 0, 0

.Warps
	db 3
	warp_def $7, $4, 3, GOLDENROD_CITY
	warp_def $7, $5, 3, GOLDENROD_CITY
	warp_def $0, $7, 1, POKECENTER_BACKROOM

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 4
	person_event SPRITE_BLACK_BELT, 3, 5, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, GoldenrodPokecenterNPC1, -1
	person_event SPRITE_COOLTRAINER_F, 6, 9, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, PERSONTYPE_TEXTFP, 0, GoldenrodPokecenterNPC2, -1
	person_event SPRITE_FISHER, 4, 0, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, GoldenrodPokecenterNPC3, -1
	person_event SPRITE_NURSE, 1, 4, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_JUMPSTD, 0, pokecenternurse, -1
