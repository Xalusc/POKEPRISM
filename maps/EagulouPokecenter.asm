EagulouPokecenter_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

EagulouPokecenter_MapEventHeader:: db 0, 0

.Warps
	db 3
	warp_def $7, $4, 3, EAGULOU_CITY
	warp_def $7, $5, 3, EAGULOU_CITY
	warp_def $0, $7, 1, POKECENTER_BACKROOM

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 1
	person_event SPRITE_NURSE, 1, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_JUMPSTD, 0, pokecenternurse, -1
