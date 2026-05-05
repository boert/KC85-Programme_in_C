;; Quelle:
;; https://64nops.wordpress.com/2021/06/19/checksum-algorithms-2/

; sdcccall(1)
; Parameters 16 bit + 16 bit
; HL + DE
;
; return 16 bit
; DE


;; Fletcher-16 checksum, mod 256
;; modified start value for sum1
;;
;; Input:
;;  HL = Data address
;;  BC = Data length
;;
;; Output:
;;  DE = Fletcher-16
;;  HL,BC,AF are modified

.globl _calc_fletcher_kc_asm
_calc_fletcher_kc_asm::
    ; resort parameters
    ld b, d
    ld c, e
fletcher16:
    ; Initialize both sums
    ld d, #0
    ld a, (hl)
    ld e, a
    ; Adjust 16-bit length for 2x8-bit loops
    inc b
    dec bc
    inc c
_fletcher16_loop:
      ld a,(hl)
      inc hl
      ; sum1 += data
      add a,e
      ld e,a
      ; sum2 += sum1
      add a,d
      ld d,a
      dec c
     jr nz,_fletcher16_loop
    djnz  _fletcher16_loop
    ret

