IF !DEF(GBS)
RunAnonymousJumptable::
	ld a, [wJumptableIndex]
ENDC

Jumptable::
; jumptable to the following pointers on the stack
; no return pointer
	pop hl
	inc hl
	bit 7, [hl]
	dec hl
	jr z, OldJumpTable
	inc hl
	inc hl
	push hl ; return pos
	push af
	dec hl
	ld a, [hld]
	ld l, [hl]
	ld h, a
	res 7, h
	pop af

OldJumpTable::
; jumptable to function a in jumptable hl
; preserves de
	push de
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
	pop de
CallLocalPointer::
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

IF !DEF(GBS)
CallLocalPointer_AfterIsInArray::
	inc hl
; fallthrough
CallNonNullLocalPointer::
; call the function in [hl] if not zero
	ld a, [hli]
	ld h, [hl]
	ld l, a
	or h
	ret z
_hl_::
	jp hl
ENDC
