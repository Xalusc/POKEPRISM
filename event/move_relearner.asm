MoveRelearner:
	ld a, HEART_SCALE
	ld [wCurItem], a
	ld hl, wNumItems
	call CheckItem
	jp nc, .exit
	ld hl, .IntroText
	call PrintText
	call YesNoBox
	jr c, .exit
	ld hl, .WhichMonText
	call PrintText
	call JoyWaitAorB

	ld b, 6
	callba SelectMonFromParty
	jr c, .exit

	ld a, [wCurPartySpecies]
	cp EGG
	ld hl, .EggText
	jr z, .show_text_and_exit
	call IsAPokemon
	ld hl, .NotMonText
	jr c, .show_text_and_exit

	call GetRelearnableMoves
	ld hl, .NoMovesToLearnText
	jr z, .show_text_and_exit

.menuloop
	ld hl, .WhichMoveText
	call PrintText
	call JoyWaitAorB
	call ChooseMoveToLearn
	jr nc, .learn
	call CloseSubmenu
.exit
	ld hl, .ComeAgainText
.show_text_and_exit
	jp PrintText

.learn
	ld a, [wMenuSelection]
	ld [wd265], a
	call GetMoveName
	ld de, wStringBuffer1
	call CopyName1
	ld b, 0
	predef LearnMove
	ld a, b
	and a
	push af
	call CloseSubmenu
	call SpeechTextBox
	pop af
	jr z, .menuloop

	ld a, HEART_SCALE
	ld [wCurItem], a
	ld a, 1
	ld [wItemQuantityChangeBuffer], a
	ld a, -1
	ld [wCurItemQuantity], a
	ld hl, wNumItems
	call TossItem

	ld hl, .HandedOverOneHeartScaleText
	call PrintText
	call JoyWaitAorB
	jr .exit

.IntroText
	ctxt "Ah! You have a"
	line "HEART SCALE!"

	para "Shall I help your"
	line "#MON remember a"
	cont "move?"
	done

.WhichMonText
	ctxt "Excellent! Which"
	line "#MON should"
	cont "remember a move?"
	done

.WhichMoveText
	ctxt "Which move should"
	line "it remember?"
	done

.HandedOverOneHeartScaleText
	ctxt "<PLAYER> handed"
	line "over one HEART"
	cont "SCALE."
	done

.ComeAgainText
	ctxt "If you come back"
	line "with a HEART"
	para "SCALE, I'll help"
	line "your #MON"
	cont "remember moves."
	done

.EggText
	ctxt "An EGG can't learn"
	line "moves!"
	done

.NotMonText
	ctxt "What?! That's not a"
	line "#MON!"
	done

.NoMovesToLearnText
	ctxt "This #MON can't"
	line "learn any moves"
	cont "from me."
	done

GetRelearnableMoves:
	; Get moves relearnable by CurPartyMon
	; Returns z if no moves can be relearned.
	ld hl, wd002
	xor a
	ld [hli], a
	ld [hl], $ff
	ld a, MON_SPECIES
	call GetPartyParam
	ld [wCurPartySpecies], a
	push af
	ld a, MON_LEVEL
	call GetPartyParam
	ld [wCurPartyLevel], a
	ld b, 0
	ld de, wd002 + 1
.loop
	push bc
	ld a, [wCurPartySpecies]
	dec a
	ld c, a
	ld b, 0
	ld hl, EvosAttacksPointers
	add hl, bc
	add hl, bc
	ld a, BANK(EvosAttacksPointers)
	call GetFarHalfword
.skip_evos
	ld a, BANK(EvosAttacks)
	call GetFarByteAndIncrement
	and a
	jr nz, .skip_evos
.loop_moves
	ld a, BANK(EvosAttacks)
	call GetFarByteAndIncrement
	and a
	jr z, .done

	ld c, a
	ld a, [wCurPartyLevel]
	cp c
	jr c, .done
	ld a, BANK(EvosAttacks)
	call GetFarByteAndIncrement
.okay
	ld c, a
	call CheckAlreadyInList
	jr c, .loop_moves
	call CheckPokemonAlreadyKnowsMove
	jr c, .loop_moves
	ld a, c
	ld [de], a
	inc de
	ld a, $ff
	ld [de], a
	pop bc
	inc b
	push bc
	jr .loop_moves
.done
	callba GetPreEvolution
	pop bc
	jr c, .loop
	pop af
	ld [wCurPartySpecies], a
	ld a, b
	ld [wd002], a
	and a
	ret

CheckAlreadyInList:
	push hl
	push de
	push bc
	ld a, c
	ld hl, wd002 + 1
	call IsInSingularArray
	pop bc
	pop de
	pop hl
	ret

CheckPokemonAlreadyKnowsMove:
	; Check if move c is in the selected pokemon's movepool already.
	; Returns carry if yes.
	push hl
	push bc
	ld a, MON_MOVES
	call GetPartyParamLocation
	ld b, NUM_MOVES
.loop
	ld a, [hli]
	cp c
	jr z, .yes
	dec b
	jr nz, .loop
	and a
	jr .done
.yes
	scf
.done
	pop bc
	pop hl
	ret

ChooseMoveToLearn:
; Open a full-screen scrolling menu
; Number of items stored in wd002
; List of items stored in wd002 + 1
; Print move names, PP, details, and descriptions
; Enable Up, Down, A, and B
; Up scrolls up
; Down scrolls down
; A confirms selection
; B backs out
	call FadeToMenu
	callba BlankScreen
	call UpdateSprites
	ld hl, .MenuHeader
	call CopyMenuHeader
	xor a
	ld [wMenuCursorBuffer], a
	ld a, 1
	ld [wMenuScrollPosition], a
	call ScrollingMenu
	call SpeechTextBox
	ld a, [wMenuJoypad]
	cp B_BUTTON
	scf
	ret z
	ld a, [wMenuSelection]
	ld [wPutativeTMHMMove], a
	and a
	ret

.MenuHeader
	db $40 ; flags
	db 01, 01 ; start coords
	db 11, 19 ; end coords
	dw .menudata2
	db 1 ; default option

.menudata2
	db $30 ; pointers
	db 5, 8 ; rows, columns
	db 1 ; horizontal spacing
	dbw 0, wd002
	dba .PrintMoveName
	dba .PrintDetails
	dba .PrintMoveDesc

.PrintMoveName
	push de
	ld a, [wMenuSelection]
	ld [wd265], a
	call GetMoveName
	pop hl
	jp PlaceString

.PrintDetails
	ld hl, wStringBuffer1
	ld bc, wStringBuffer2 - wStringBuffer1
	ld a, " "
	call ByteFill
	ld a, [wMenuSelection]
	cp $ff
	ret z
	push de
	dec a
	ld bc, MOVE_LENGTH
	ld hl, Moves + MOVE_TYPE
	rst AddNTimes
	ld a, BANK(Moves)
	call GetFarByte
	ld [wd265], a
	; get move type
	and $3f
	; 5 characters
	ld c, a
	add a
	add a
	add c
	ld c, a
	ld b, 0
	ld hl, .Types
	add hl, bc
	ld d, h
	ld e, l

	ld hl, wStringBuffer1
	call PlaceString
	ld hl, wStringBuffer1 + 4
	ld [hl], "/"
	; get move class
	ld a, [wd265]
	and $c0
	rlca
	rlca
	ld c, a
	add a
	add a
	add c
	ld c, a
	ld b, 0
	ld hl, .Classes
	add hl, bc
	ld d, h
	ld e, l

	ld hl, wStringBuffer1 + 5
	call PlaceString
	ld hl, wStringBuffer1 + 9
	ld [hl], "/"

	ld a, [wMenuSelection]
	dec a
	ld bc, MOVE_LENGTH
	ld hl, Moves + MOVE_PP
	rst AddNTimes
	ld a, BANK(Moves)
	call GetFarByte
	ld [wEngineBuffer1], a
	ld hl, wStringBuffer1 + 10
	ld de, wEngineBuffer1
	lb bc, 1, 2
	call PrintNum
	ld hl, wStringBuffer1 + 12
	ld [hl], "@"

	ld hl, SCREEN_WIDTH - 5
	pop de
	add hl, de
	push de
	ld de, wStringBuffer1
	call PlaceString
	pop de
	ret

.Types
	db "NORM@"
	db "FIGH@"
	db " FLY@"
	db "POIS@"
	db "GRND@"
	db "ROCK@"
	db "BIRD@"
	db " BUG@"
	db "GHST@"
	db " STL@"
	db " FRY@"

	db " GAS@"
	db "WIND@"
	db " SND@"
	db " TRI@"
	db "PRSM@"
	db "TP16@"
	db "TP17@"
	db "TP18@"
	db "CRSE@"

	db "FIRE@"
	db "WATR@"
	db "GRAS@"
	db "ELEC@"
	db "PSYC@"
	db " ICE@"
	db "DRGN@"
	db "DARK@"
.Classes
	db "PHYS@"
	db "SPEC@"
	db "STAT@"

.PrintMoveDesc
	push de
	call SpeechTextBox
	ld a, [wMenuSelection]
	cp $ff
	pop de
	ret z
	ld [wCurSpecies], a
	hlcoord 1, 14
	jpba PrintMoveDesc
