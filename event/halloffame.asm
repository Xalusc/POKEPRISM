HallOfFame::
	xor a
	ld [wMusicFadeIDLo], a
	ld [wMusicFadeIDHi], a
	ld a, 10
	ld [wMusicFade], a
	callba FadeOutPalettes
	xor a
	ld [wVramState], a
	ldh [hMapAnims], a
	callba HallOfFame_SaveTheGame
	ld c, 30
	call DelayFrames

	ld a, [wStatusFlags]
	push af
	ld a, 1
	ld [wGameLogicPause], a
	call DisableSpriteUpdates
	ld a, SPAWN_LANCE
	ld [wSpawnAfterChampion], a

	ld hl, wStatusFlags
	set 6, [hl] ; hall of fame

	callba HallOfFame_InitSaveIfNeeded

	ld hl, wHallOfFameCount
	inc [hl]
	jr nz, .ok
	inc hl
	inc [hl]
	jr nz, .ok
	ld a, $ff
	ld [hld], a
	ld [hl], a
.ok
	callba SaveGameData
	call GetHallOfFameParty
	callba AddHallOfFameEntry

	xor a
	ld [wGameLogicPause], a
	call AnimateHallOfFame
	pop af
	ld b, a
	jpba Credits

AnimateHallOfFame:
	xor a
	ld [wJumptableIndex], a
	call LoadHOFTeam
	jr c, .done
	ld de, MUSIC_NONE
	call PlayMusic
	ld de, MUSIC_HALL_OF_FAME
	call PlayMusic
	xor a
	ld [wcf64], a
.loop
	ld a, [wcf64]
	cp PARTY_LENGTH
	jr nc, .done
	ld hl, wHallOfFameTempMon1
	ld bc, wHallOfFameTempMon1End - wHallOfFameTempMon1
	rst AddNTimes
	ld a, [hl]
	inc a
	jr z, .done
	push hl
	call AnimateHOFMonEntrance
	pop hl
	call .DisplayNewHallOfFamer
	jr c, .done
	ld hl, wcf64
	inc [hl]
	jr .loop

.done
	call HOF_AnimatePlayerPic
	ld a, 4
	ld [wMusicFade], a
	ld c, 1
	call FadeToLightestColor
	ld c, 8
	jp DelayFrames

.DisplayNewHallOfFamer
	call DisplayHOFMon
	ld de, .String_NewHallOfFamer
	hlcoord 1, 2
	call PlaceText
	call ApplyTilemapInVBlank
	decoord 6, 5
	ld c, 6
	predef HOF_AnimateFrontpic
	ld c, 60
	call DelayFrames
	and a
	ret

.String_NewHallOfFamer
	ctxt "New Hall of Famer!"
	done

GetHallOfFameParty:
	ld hl, wOverworldMap
	ld bc, HOF_LENGTH
	xor a
	call ByteFill
	ld a, [wHallOfFameCount + 1]
	and a
	jr nz, .overflow
	ld a, [wHallOfFameCount]
	cp 201
	jr c, .count_ok
.overflow
	ld a, 201
.count_ok
	ld de, wOverworldMap
	ld [de], a
	inc de
	ld hl, wPartySpecies
	ld c, 0
.next
	ld a, [hli]
	cp -1
	jr z, .done
	cp EGG
	jr nz, .mon
	inc c
	jr .next

.mon
	push hl
	push de
	push bc

	ld a, c
	ld hl, wPartyMons
	ld bc, PARTYMON_STRUCT_LENGTH
	rst AddNTimes
	ld c, l
	ld b, h

	ld hl, MON_SPECIES
	add hl, bc
	ld a, [hl]
	ld [de], a
	inc de

	ld hl, MON_ID
	add hl, bc
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	inc de

	ld hl, MON_DVS
	add hl, bc
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	inc de

	ld hl, MON_LEVEL
	add hl, bc
	ld a, [hl]
	ld [de], a
	inc de

	pop bc
	push bc
	ld a, c
	ld hl, wPartyMonNicknames
	ld bc, PKMN_NAME_LENGTH
	rst AddNTimes
	ld bc, PKMN_NAME_LENGTH - 1
	rst CopyBytes

	pop bc
	inc c
	pop de
	ld hl, HOF_MON_LENGTH
	add hl, de
	ld e, l
	ld d, h
	pop hl
	jr .next

.done
	ld a, $ff
	ld [de], a
	ret

AnimateHOFMonEntrance:
	push hl
	call ClearBGPalettes
	callba HallOfFame_WipeBGMap
	pop hl
	ld a, [hli]
	ld [wTempMonSpecies], a
	ld [wCurPartySpecies], a
	inc hl
	inc hl
	ld a, [hli]
	ld [wTempMonDVs], a
	ld a, [hli]
	ld [wTempMonDVs + 1], a
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	ld a, " "
	call ByteFill
	ld de, vBGTiles tile $31
	predef GetBackpic
	ld a, $31
	ldh [hGraphicStartTile], a
	hlcoord 6, 6
	lb bc, 6, 6
	predef PlaceGraphic
	ld a, $d0
	ldh [hSCY], a
	ld a, $90
	ldh [hSCX], a
	call ApplyTilemapInVBlank
	xor a
	ldh [hBGMapMode], a
	ld b, SCGB_PLAYER_OR_MON_FRONTPIC_PALS
	predef GetSGBLayout
	call SetPalettes
	call HOF_SlideBackpic
	xor a
	ld [wBoxAlignment], a
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	ld a, " "
	call ByteFill
	hlcoord 6, 5
	call _PrepMonFrontpic
	call ApplyTilemapInVBlank
	xor a
	ldh [hBGMapMode], a
	ldh [hSCY], a
	jp HOF_SlideFrontpic

HOF_SlideBackpic:
.backpicloop
	ldh a, [hSCX]
	cp $70
	ret z
	add 4
	ldh [hSCX], a
	call DelayFrame
	jr .backpicloop

HOF_SlideFrontpic:
.frontpicloop
	ldh a, [hSCX]
	and a
	ret z
	dec a
	dec a
	ldh [hSCX], a
	call DelayFrame
	jr .frontpicloop

_HallOfFamePC:
	call LoadFontsBattleExtra
	xor a
	ld [wJumptableIndex], a
.MasterLoop
	call LoadHOFTeam
	ret c
	call .DisplayTeam
	ret c
	ld hl, wJumptableIndex
	inc [hl]
	jr .MasterLoop

.DisplayTeam
	xor a
	ld [wcf64], a
.next
	call .DisplayMonAndStrings
	jr c, .start_button
.loop
	call JoyTextDelay
	ld hl, hJoyLast
	ld a, [hl]
	and B_BUTTON
	jr nz, .b_button
	ld a, [hl]
	and A_BUTTON
	jr nz, .a_button
	ld a, [hl]
	and START
	jr nz, .start_button
	call DelayFrame
	jr .loop

.a_button
	ld hl, wcf64
	inc [hl]
	jr .next

.b_button
	scf
	ret

.start_button
	and a
	ret

.DisplayMonAndStrings
; Print the number of times the player has entered the Hall of Fame.
; If that number is above 200, print "HOF Master!" instead.
	ld a, [wcf64]
	cp PARTY_LENGTH
	jr nc, .fail
	ld hl, wHallOfFameTempMon1
	ld bc, wHallOfFameTempMon1End - wHallOfFameTempMon1
	rst AddNTimes
	ld a, [hl]
	cp -1
	jr nz, .okay

.fail
	scf
	ret

.okay
	push hl
	call ClearBGPalettes
	pop hl
	call DisplayHOFMon
	ld a, [wHallOfFameTempWinCount]
	cp 200 + 1
	jr c, .print_num_hof
	ld de, .HOFMaster
	hlcoord 1, 2
	call PlaceText
	jr .finish

.print_num_hof
	ld de, .TimeFamer
	hlcoord 1, 2
	call PlaceText
	hlcoord 2, 2
	ld de, wHallOfFameTempWinCount
	lb bc, 1, 3
	call PrintNum

.finish
	call ApplyTilemapInVBlank
	ld b, SCGB_PLAYER_OR_MON_FRONTPIC_PALS
	predef GetSGBLayout
	call SetPalettes
	decoord 6, 5
	ld c, 6
	predef HOF_AnimateFrontpic
	and a
	ret

.HOFMaster
	ctxt "    HOF Master!"
	done

.TimeFamer
	ctxt "    -Time Famer"
	done

LoadHOFTeam:
	ld a, [wJumptableIndex]
	cp NUM_HOF_TEAMS
	jr nc, .invalid
	ld hl, sHallOfFame
	ld bc, HOF_LENGTH
	rst AddNTimes
	sbk BANK(sHallOfFame)
	ld a, [hl]
	and a
	jr z, .absent
	ld de, wHallOfFameTemp
	ld bc, HOF_LENGTH
	rst CopyBytes
	scls
	and a
	ret

.absent
	scls
.invalid
	scf
	ret

DisplayHOFMon:
	xor a
	ldh [hBGMapMode], a
	ld a, [hli]
	ld [wTempMonSpecies], a
	ld a, [hli]
	ld [wTempMonID], a
	ld a, [hli]
	ld [wTempMonID + 1], a
	ld a, [hli]
	ld [wTempMonDVs], a
	ld a, [hli]
	ld [wTempMonDVs + 1], a
	ld a, [hli]
	ld [wTempMonLevel], a
	ld de, wStringBuffer2
	ld bc, PKMN_NAME_LENGTH - 1
	rst CopyBytes
	ld a, "@"
	ld [wStringBuffer2 + 10], a
	hlcoord 0, 0
	push hl
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	ld a, " "
	call ByteFill
	pop hl
	lb bc, 3, SCREEN_WIDTH - 2
	call TextBox
	hlcoord 0, 12
	lb bc, 4, SCREEN_WIDTH - 2
	call TextBox
	ld a, [wTempMonSpecies]
	ld [wCurPartySpecies], a
	ld [wd265], a
	xor a
	ld [wBoxAlignment], a
	hlcoord 6, 5
	call _PrepMonFrontpic
	ld a, [wCurPartySpecies]
	cp EGG
	jr z, .print_id_no
	push af
	hlcoord 1, 13
	ld a, "№"
	ld [hli], a
	ld [hl], "."
	callba Pokedex_GetNaljoNum
	ld [wd265], a
	hlcoord 3, 13
	ld de, wd265
	lb bc, PRINTNUM_LEADINGZEROS | 1, 3
	call PrintNum
	pop af
	ld [wd265], a
	call GetBasePokemonName
	hlcoord 7, 13
	call PlaceString
	ld a, BREEDMON
	ld [wMonType], a
	callba GetGender
	ld a, " "
	jr c, .got_gender
	ld a, "♂"
	jr nz, .got_gender
	ld a, "♀"

.got_gender
	hlcoord 18, 13
	ld [hli], a
	hlcoord 8, 14
	ld a, "/"
	ld [hli], a
	ld de, wStringBuffer2
	call PlaceString
	hlcoord 1, 16
	call PrintLevel

.print_id_no
	hlcoord 7, 16
	ld a, "<ID>"
	ld [hli], a
	ld a, "№"
	ld [hli], a
	ld [hl], "/"
	hlcoord 10, 16
	ld de, wTempMonID
	lb bc, PRINTNUM_LEADINGZEROS | 2, 5
	jp PrintNum

HOF_AnimatePlayerPic:
	call ClearBGPalettes
	ld hl, vBGTiles tile $63
	ld de, Font + (":" - $80) * 8
	lb bc, BANK(Font), 1
	call Request1bpp
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	ld a, " "
	call ByteFill
	callba GetPlayerBackpic
	ld a, $31
	ldh [hGraphicStartTile], a
	hlcoord 6, 6
	lb bc, 6, 6
	predef PlaceGraphic
	ld a, $d0
	ldh [hSCY], a
	ld a, $90
	ldh [hSCX], a
	call ApplyTilemapInVBlank
	xor a
	ldh [hBGMapMode], a
	ld [wCurPartySpecies], a
	ld b, SCGB_PLAYER_OR_MON_FRONTPIC_PALS
	predef GetSGBLayout
	call SetPalettes
	call HOF_SlideBackpic
	xor a
	ld [wBoxAlignment], a
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	ld a, " "
	call ByteFill
	callba HOF_LoadTrainerFrontpic
	xor a
	ldh [hGraphicStartTile], a
	hlcoord 12, 5
	lb bc, 7, 7
	predef PlaceGraphic
	ld a, $c0
	ldh [hSCX], a
	call ApplyTilemapInVBlank
	xor a
	ldh [hBGMapMode], a
	ldh [hSCY], a
	call HOF_SlideFrontpic
	xor a
	ldh [hBGMapMode], a
	hlcoord 0, 2
	lb bc, 8, 10
	call TextBox
	hlcoord 0, 12
	lb bc, 4, 18
	call TextBox
	hlcoord 2, 4
	ld de, wPlayerName
	call PlaceString
	hlcoord 1, 6
	ld a, "<ID>"
	ld [hli], a
	ld a, "№"
	ld [hli], a
	ld [hl], "/"
	hlcoord 4, 6
	ld de, wPlayerID
	lb bc, PRINTNUM_LEADINGZEROS | 2, 5
	call PrintNum
	hlcoord 1, 8
	ld de, .PlayTime
	call PlaceText
	hlcoord 1, 9
	ld de, wGameTimeHours
	lb bc, 2, 4
	call PrintNum
	ld [hl], 99
	inc hl
	ld de, wGameTimeMinutes
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	call PrintNum
	ld [hl], 99
	inc hl
	ld de, wGameTimeSeconds
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	call PrintNum
	call ApplyTilemapInVBlank
	jr Rate

.PlayTime
	ctxt "PLAY TIME"
	done

Rate:
	ld hl, wPokedexSeen
	ld b, wEndPokedexSeen - wPokedexSeen
	call CountSetBits
	ld [wd002], a
	ld hl, wPokedexCaught
	ld b, wEndPokedexCaught - wPokedexCaught
	call CountSetBits
	ld [wd003], a
	call .UpdateBuffers
	ld hl, RateText
	call PrintText
	jp JoyWaitAorB

.UpdateBuffers
	ld hl, wStringBuffer3
	ld de, wd002
	call .UpdateBuffer
	ld hl, wStringBuffer4
	ld de, wd003
	; fallthrough

.UpdateBuffer
	push hl
	ld a, "@"
	ld bc, ITEM_NAME_LENGTH
	call ByteFill
	pop hl
	lb bc, PRINTNUM_LEFTALIGN | 1, 3
	jp PrintNum

RateText:
	text_jump _RateText
