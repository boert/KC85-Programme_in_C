; sdcccall(1)
; Parameters 16 bit + 16 bit
; HL + DE
;
; return 16 bit
; DE


;;
;; Input:
;;  HL = Data address
;;  DE = Data length
;;
;; Output:
;;  DE = SUM16
;;  HL,BC,AF are modified

.globl _calc_sum16_asm
_calc_sum16_asm::

    ; SUM16 in reg CA
    xor a
    ld  c, a

    ; prepare fast loop
    ; https://map.grauw.nl/articles/fast_loops.php
    ; Number of loops is in DE
    ld  b, e
    dec de
    inc d

loop:
    add a, (hl)

    jr nc, skip_inc
    inc c

skip_inc:
    inc hl          ; naechste Adresse

    djnz loop       ; loop counter
    dec d
    jr  nz, loop

    ld  e, a         ; low byte
    ld  d, c         ; high byte

    ret
