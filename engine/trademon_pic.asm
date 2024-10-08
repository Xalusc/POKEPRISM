GetTrademonFrontpic:
	ld a, [wOTTrademonSpecies]
	ld de, vBGTiles
	push de
	ld [wCurPartySpecies], a
	ld [wCurSpecies], a
	call GetBaseData
	pop de
	predef_jump GetAnimatedFrontpic

AnimateTrademonFrontpic:
	ld a, [wOTTrademonSpecies]
	call IsAPokemon
	ret c
	callba ShowOTTrademonDetails
	ld a, [wOTTrademonSpecies]
	ld [wCurPartySpecies], a
	ld a, [wOTTrademonDVs]
	ld [wTempMonDVs], a
	ld a, [wOTTrademonDVs + 1]
	ld [wTempMonDVs + 1], a
	ld b, SCGB_PLAYER_OR_MON_FRONTPIC_PALS
	predef GetSGBLayout
	ld a, %11100100 ; 3,2,1,0
	call DmgToCgbBGPals
	callba TradeAnim_ShowGetmonFrontpic
	ld a, [wOTTrademonSpecies]
	ld [wCurPartySpecies], a
	hlcoord 7, 2
	lb de, 0, ANIM_MON_TRADE
	predef_jump AnimateFrontpic
