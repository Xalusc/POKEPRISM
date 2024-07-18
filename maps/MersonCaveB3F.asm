MersonCaveB3F_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

MersonCaveB3F_MapEventHeader:: db 0, 0

.Warps
	db 1
	warp_def $32, $c, 1, MERSON_CAVE_B2F

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 4
	person_event SPRITE_POKE_BALL, 12, 11, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TMHMBALL, TM_FINAL_CHANCE, 0, EVENT_MERSON_CAVE_B3F_TM_FINAL_CHANCE
	person_event SPRITE_POKE_BALL, 28, 11, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_ITEMBALL, 1, CAGE_KEY, EVENT_MERSON_CAVE_B3F_ITEM_CAGE_KEY_1
	person_event SPRITE_POKE_BALL, 50, 32, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, CAGE_KEY, EVENT_MERSON_CAVE_B3F_ITEM_CAGE_KEY_2
	person_event SPRITE_POKE_BALL, 15, 16, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, SHINY_STONE, EVENT_MERSON_CAVE_B3F_ITEM_SHINY_STONE
