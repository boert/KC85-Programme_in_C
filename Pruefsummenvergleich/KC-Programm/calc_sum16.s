;; Quelle:
;; refresh.c

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

    exx
    ld  b, #0       ; high byte
    ld  hl, #0      ; Summe zuruecksetzen
    exx

    ; prepare fast loop:
    ; http://map.grauw.nl/articles/fast_loops.php
    ld  b, e
    dec de
    inc d

loop:
    ld  a, (hl)     ; neues Byte holen

    exx
    ld  c, a
    add hl, bc      ; addieren
    exx

    inc hl          ; naechste Adresse

    djnz loop       ; loop counter
    dec d
    jr  nz, loop

    exx             ; Ergebnis von HL' nach DE
    push hl
    exx
    pop  de

    ret
