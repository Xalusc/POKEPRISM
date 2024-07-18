MagikarpCavernsRapids_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

MagikarpCavernsRapids_MapEventHeader:: db 0, 0

.Warps
	db 15
	warp_def $14, $1b, 1, MAGIKARP_CAVERNS_END
	warp_def $8, $3, 3, MAGIKARP_CAVERNS_RAPIDS
	warp_def $6, $3, 2, MAGIKARP_CAVERNS_RAPIDS
	warp_def $2, $2, 5, MAGIKARP_CAVERNS_RAPIDS
	warp_def $a, $1f, 4, MAGIKARP_CAVERNS_RAPIDS
	warp_def $d, $20, 7, MAGIKARP_CAVERNS_RAPIDS
	warp_def $2, $29, 6, MAGIKARP_CAVERNS_RAPIDS
	warp_def $7, $1d, 9, MAGIKARP_CAVERNS_RAPIDS
	warp_def $7, $23, 8, MAGIKARP_CAVERNS_RAPIDS
	warp_def $d, $22, 11, MAGIKARP_CAVERNS_RAPIDS
	warp_def $13, $18, 10, MAGIKARP_CAVERNS_RAPIDS
	warp_def $8, $18, 13, MAGIKARP_CAVERNS_RAPIDS
	warp_def $d, $1a, 12, MAGIKARP_CAVERNS_RAPIDS
	warp_def $13, $24, 15, MAGIKARP_CAVERNS_RAPIDS
	warp_def $12, $1b, 14, MAGIKARP_CAVERNS_RAPIDS

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 2
	person_event SPRITE_POKE_BALL, 6, 7, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 4, WATER_STONE, EVENT_MAGIKARP_CAVERNS_RAPIDS_ITEM_WATER_STONES
	person_event SPRITE_POKE_BALL, 6, 34, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, MYSTIC_WATER, EVENT_MAGIKARP_CAVERNS_RAPIDS_ITEM_MYSTIC_WATER
