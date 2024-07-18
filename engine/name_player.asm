ShowPlayerNamingChoices:
	ld hl, ChrisNameMenuHeader
	ld a, [wPlayerGender]
	bit 0, a
	jr z, .GotGender
	ld hl, KrisNameMenuHeader
.GotGender
	call LoadMenuHeader
	call VerticalMenu
	ld a, [wMenuCursorY]
	dec a
	call CopyNameFromMenu
	jp CloseWindow

ChrisNameMenuHeader:
	db $40 ; flags
	db 00, 00 ; start coords
	db 11, 10 ; end coords
	dw .MaleNames
	db 1 ; ????
	db 0 ; default option

.MaleNames
	db $91 ; flags
	db 5 ; items
	db "NEW NAME@"
MalePlayerNameArray:
	db "PRISM@"
	db "ADAM@"
	db "BRUCE@"
	db "CALEB@"
	db 2 ; displacement
	db " Name @" ; title

KrisNameMenuHeader:
	db $40 ; flags
	db 00, 00 ; start coords
	db 11, 10 ; end coords
	dw .FemaleNames
	db 1 ; ????
	db 0 ; default option

.FemaleNames
	db $91 ; flags
	db 5 ; items
	db "NEW NAME@"
FemalePlayerNameArray:
	db "CYAN@"
	db "MARIA@"
	db "LAURA@"
	db "BELLA@"
	db 2 ; displacement
	db " Name @" ; title
