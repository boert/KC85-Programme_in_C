;; Quelle:
;; TEMO.ASM

; sdcccall(1)
; Parameters 16 bit + 16 bit
; HL + DE
;
; return 16 bit
; DE


;;
;; Input:
;;  HL = Data address
;;  BC = Data length
;;
;; Output:
;;  DE = CRC16
;;  HL,BC,AF are modified

.globl _calc_crc16_asm
_calc_crc16_asm::
    ; resort parameters
    ld b, d
    ld c, e

    ld de, #-1
ch1:
    ld a, (hl)
    xor d
    ld d, a
    rrca
    rrca
    rrca
    rrca
    and a, #0x0f
    xor d
    ld d, a
    rrca
    rrca
    rrca
    push af
    and a, #0x1f
    xor e
    ld e, a
    pop af
    push af
    rrca
    and a, #0xf0
    xor e
    ld e, a
    pop af
    and a, #0xe0
    xor d
    ld d, e
    ld e, a
    cpi
    jp pe, ch1
    ret

