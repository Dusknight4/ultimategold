PrintDonorMonTypes:
; Like PrintMonTypes, but with the types the mon in wTempMonDVs
; gets from its template species, as in battle.
	push hl
	call GetBaseData
	call ApplyDonorTypes
	jr PrintMonTypes.got_base_data

PrintMonTypes:
; Print one or both types of [wCurSpecies]
; on the stats screen at hl.

	push hl
	call GetBaseData
.got_base_data
	pop hl

	push hl
	ld a, [wBaseType1]
	call .Print

	; Single-typed monsters really
	; have two of the same type.
	ld a, [wBaseType1]
	ld b, a
	ld a, [wBaseType2]
	cp b
	pop hl
	jr z, .hide_type_2

	ld bc, SCREEN_WIDTH * 2
	add hl, bc

.Print:
	ld b, a
	jr PrintType

.hide_type_2
	; Erase any type name that was here before.
	; Seems to be pointless in localized versions.
	ld a, " "
	ld bc, SCREEN_WIDTH - 3
	add hl, bc
	ld [hl], a
	inc bc
	add hl, bc
	ld bc, NAME_LENGTH_JAPANESE - 1
	jp ByteFill

PrintMoveType:
; Print the type of move b at hl.

	push hl
	ld a, b
	dec a
	ld bc, MOVE_LENGTH
	ld hl, Moves
	call AddNTimes
	ld de, wStringBuffer1
	ld a, BANK(Moves)
	call FarCopyBytes
	ld a, [wStringBuffer1 + MOVE_TYPE]
	pop hl

	ld b, a

PrintType:
; Print type b at hl.

	ld a, b

	push hl
	add a
	ld hl, TypeNames
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hli]
	ld e, a
	ld d, [hl]
	pop hl

	jp PlaceString

GetTypeName:
; Copy the name of type [wNamedObjectIndex] to wStringBuffer1.

	ld a, [wNamedObjectIndex]
	ld hl, TypeNames
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, wStringBuffer1
	ld bc, MOVE_NAME_LENGTH
	jp CopyBytes

ApplyDonorTypes:
; Replace wBaseType1/2 of [wCurSpecies] with the types the mon in
; wTempMonDVs gets from its template species (Speed/Special DV byte),
; the same way the battle code does.
	push hl
	ld a, [wCurSpecies]
	push af
	ld a, [wBaseType1]
	ld b, a
	ld a, [wBaseType2]
	ld c, a

	ld a, [wTempMonDVs + 1]
	and a
	jr z, .curse
	cp $fc
	jr nc, .overflow

	ld [wCurSpecies], a
	call GetBaseData
	ld a, [wBaseType1]
	ld d, a
	ld a, [wBaseType2]
	ld e, a
	jr .apply

.overflow
	sub $fc
	add a
	ld e, a
	ld d, 0
	ld hl, .OverflowTypes
	add hl, de
	ld a, [hli]
	ld d, a
	ld e, [hl]

.apply
	; Attack DV 8-15 -> replace type 1.
	ld a, [wTempMonDVs]
	bit 7, a
	jr z, .keep_type_1
	ld b, d
.keep_type_1
	; Defense DV odd -> replace type 2.
	ld a, [wTempMonDVs]
	bit 0, a
	jr z, .done
	ld c, e
	jr .done

.curse
	ld b, CURSE_TYPE
	ld c, b

.done
	pop af
	ld [wCurSpecies], a
	call GetBaseData
	ld a, b
	ld [wBaseType1], a
	ld a, c
	ld [wBaseType2], a
	pop hl
	ret

.OverflowTypes:
	db FIRE, ICE
	db DRAGON, STEEL
	db DARK, ICE
	db DRAGON, DARK

INCLUDE "data/types/names.asm"
