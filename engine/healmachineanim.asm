HealMachineAnim:
	; If you have no Pokemon, don't change the buffer.  This can lead to some glitchy effects if you have no Pokemon.
	ld a, [wPartyCount]
	and a
	ret z
	; The location of the healing machine relative to the player is stored in hScriptVar.
	; 0: Up and left (Pokemon Center)
	; 1: Left (Elm's Lab)
	; 2: Up (Hall of Fame)
	ldh a, [hScriptVar]
	ld [wHealMachineAnimType], a
	ldh a, [rOBP1]
	ld [wHealMachineOBPBackup], a
	call .RunScript
	ld a, [wHealMachineOBPBackup]
	jp DmgToCgbObjPal1

.RunScript
	xor a
	ld [wHealMachineRoutineIDX], a
.jumpable_loop
	ld a, [wHealMachineAnimType]
	ld e, a
	ld d, 0
	ld hl, .Pointers
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wHealMachineRoutineIDX]
	ld e, a
	inc a
	ld [wHealMachineRoutineIDX], a
	add hl, de
	ld a, [hl]
	cp 5
	ret z
	jumptable .Jumptable
	jr .jumpable_loop

.Pointers
	dw .Pokecenter
	dw .ElmLab
	dw .HallOfFame

.Pokecenter
.ElmLab
	db 0, 1, 3, 5
.HallOfFame
	db 0, 2, 4, 5

.Jumptable
	dw .LoadGFX
	dw .PC_LoadBallsOntoMachine
	dw .HOF_LoadBallsOntoMachine
	dw .PlayHealMusic
	dw .HOF_PlaySFX

.LoadGFX
	call .LoadPalettes
	ld de, .HealMachineGFX
	ld hl, vObjTiles tile $7c
	lb bc, BANK(.HealMachineGFX), $2
	jp Request2bpp

.PC_LoadBallsOntoMachine
	ld hl, wSprites + $80
	ld de, .PC_ElmsLab_OAM
	call .PlaceHealingMachineTile
	call .PlaceHealingMachineTile
	jr .LoadBallsOntoMachine

.HOF_LoadBallsOntoMachine
	ld hl, wSprites + $80
	ld de, .HOF_OAM

.LoadBallsOntoMachine
	ld a, [wPartyCount]
	ld b, a
.party_loop
	call .PlaceHealingMachineTile
	push de
	ld de, SFX_SECOND_PART_OF_ITEMFINDER
	call PlaySFX
	pop de
	ld c, 30
	call DelayFrames
	dec b
	jr nz, .party_loop
	ret

.PlayHealMusic
	ld de, SFX_HEAL_POKEMON
	call PlaySFX
	jp .FlashPalettes8Times

.HOF_PlaySFX
	ld de, SFX_GAME_FREAK_LOGO_GS
	call PlaySFX
	call .FlashPalettes8Times
	call WaitSFX
	ld de, SFX_BOOT_PC
	jp PlaySFX

.PC_ElmsLab_OAM
	dsprite   4, 0,   4, 2, $7c, $16
	dsprite   4, 0,   4, 6, $7c, $16
	dsprite   4, 6,   4, 0, $7d, $16
	dsprite   4, 6,   5, 0, $7d, $36 ; xflip
	dsprite   5, 3,   4, 0, $7d, $16
	dsprite   5, 3,   5, 0, $7d, $36 ; xflip
	dsprite   6, 0,   4, 0, $7d, $16
	dsprite   6, 0,   5, 0, $7d, $36 ; xflip

.HealMachineGFX: INCBIN "gfx/field/heal_machine.2bpp"

.HOF_OAM
	dsprite   5, 5,   9, 0, $7d, $16
	dsprite   5, 5,   9, 6, $7d, $16
	dsprite   6, 2,   9, 0, $7d, $16
	dsprite   6, 2,   9, 6, $7d, $16
	dsprite   6, 7,   9, 0, $7d, $16
	dsprite   6, 7,   9, 6, $7d, $16

.LoadPalettes
	ld hl, .palettes
	ld de, wOBPals + 8 * 6
	ld bc, 8
	ld a, 5
	call FarCopyWRAM
	ld a, 1
	ldh [hCGBPalUpdate], a
	ret

.palettes
	RGB 31, 31, 31
	RGB 31, 19, 10
	RGB 31, 07, 01
	RGB 00, 00, 00

.FlashPalettes8Times
	ld c, 8
.palette_loop
	push bc
	call .FlashPalettes
	ld c, 10
	call DelayFrames
	pop bc
	dec c
	jr nz, .palette_loop
	ret

.FlashPalettes
	ldh a, [rSVBK]
	push af
	wbk BANK(wOBPals)

	ld hl, wOBPals + 8 * 6
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	push de
	ld c, 3
.palette_loop_2
	ld a, [hli]
	ld e, a
	ld a, [hld]
	ld d, a
	dec hl
	ld a, d
	ld [hld], a
	ld a, e
	ld [hli], a
	inc hl
	inc hl
	inc hl
	dec c
	jr nz, .palette_loop_2
	pop de
	dec hl
	ld a, d
	ld [hld], a
	ld a, e
	ld [hl], a

	pop af
	ldh [rSVBK], a
	ld a, 1
	ldh [hCGBPalUpdate], a
	ret

.PlaceHealingMachineTile
	push bc
	ld a, [wHealMachineAnimType]
	bcpixel 2, 4
	cp 1 ; ElmsLab
	jr z, .okay
	bcpixel 0, 0

.okay
	ld a, [de]
	add c
	inc de
	ld [hli], a
	ld a, [de]
	add b
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	pop bc
	ret
