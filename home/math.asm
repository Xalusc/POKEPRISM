GetScriptStringBuffer:
	call GetScriptByte

GetNthStringBuffer::
	ld hl, wStringBuffer1
	ld bc, wStringBuffer2 - wStringBuffer1
	jr _AddNTimes

GetPartyLocation::
; Add the length of a PartyMon struct to hl a times.
	ld bc, PARTYMON_STRUCT_LENGTH
	jr _AddNTimes

SkipNames::
; Skip a names.
	ld bc, NAME_LENGTH

; fallthrough
_AddNTimes::
; Add bc * a to hl.
; Preserves bc
	and a
	ret z

	push bc
.loop
	rra ; and a from below and above resets carry
	jr nc, .noadd
	add hl, bc
.noadd
	sla c
	rl b
	and a
	jr nz, .loop
.done
	pop bc
	ret

SimpleMultiply::
; Multiply a by c. Return the product in a.
; honestly does not need to be this complicated
	push hl
	push bc
	ld hl, 0
	ld b, h
	rst AddNTimes
	ld a, l
	pop bc
	pop hl
	ret

SimpleDivide::
; Divide a by c. Return quotient b and remainder a.
	inc c
	dec c
	jr z, .div0
	ld b, 0
	and a
	ret z
.loop
	inc b
	sub c
	jr nc, .loop
	ret z
	add c
	dec b
	ret

.div0 ; OH SHI-
	ldh [hCrashSavedA], a
	ld a, 2
DivideByZero_SimpleDivide::
	call Crash
; crash ends here

SubtractSigned::
; Return a - b, sign in carry.
	sub b
	ret nc
	cpl
	inc a
	scf
	ret

Multiply16::
	; calculates bc * de and stores the result in bcde (bc: high word, de: low word) and in hProduct
	push hl
	callba _Multiply16
	pop hl
	ret

Divide16::
	; calculates bc / de, stores quotient in de and remainder in bc
	; also stores quotient in hQuotient and remainder in hRemainder
	push hl
	callba _Divide16
	pop hl
	ret

AddNTimes16::
	; calculates hProduct + bc * de, returns in hProduct
	; returns carry status for the addition
	push hl
	push bc
	push de
	callba _AddNTimes16
	pop de
	pop bc
	pop hl
	ret

SimpleMultiplyDivide::
	; do a * c / b and return in bc, remainder in a
	push hl
	push de
	ld e, b
	ld hl, 0
	ld b, h
	rst AddNTimes
	ld d, b
	ld b, h
	ld c, l
	call Divide16
	ld a, c
	ld b, d
	ld c, e
	pop de
	pop hl
	ret
