InitName::
; Intended for names, so this function is limited to ten characters.
	push hl
	ld c, 10

_InitString::
; if the string pointed to by hl is empty (defined as "zero or more spaces
; followed by a null"), then initialize it to the string pointed to by de.
	push bc
.loop
	ld a, [hli]
	cp "@"
	jr z, .blank
	cp " "
	jr nz, .notblank
	dec c
	jr nz, .loop
.blank
	pop bc
	ld l, e
	ld h, d
	pop de
	ld b, 0
	inc c
	rst CopyBytes
	ret
.notblank
	pop bc
	pop hl
	ret

FarStringCmp::
	call StackCallInBankA

StringCmp::
; Compare c bytes at de and hl.
; Return z if they all match.
; Return c if [de] < [hl]
.loop
	ld a, [de]
	cp [hl]
	ret nz
	inc de
	inc hl
	dec c
	jr nz, .loop
	ret
