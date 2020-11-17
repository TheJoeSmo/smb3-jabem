;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; calc_coarse_y_difference:
;
; Calculates a "coarse" Y difference with the Player,
; returning a one byte value that determines the
; difference in Y/YHi coordinates in units of 8 pixels.
; Returns Temp_Var15 in the format of a crude signed
; value for Y Hi in bit 6 and 7
; [00 -> Y Hi = 0, 01 -> Y Hi = 1, 11 -> Y Hi = negative]
; and the base Y difference in the bits 0 - 5 (so units
; of 8 pixels.)
; Temp_Var16 holds the raw difference in "Y Hi"
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; $DCB9

_y_pos_hi = Temp_Var1
_y_pos_lo = Temp_Var2
_y_pos_lo_difference = Temp_Var15
_y_pos_hi_difference = Temp_Var16

calc_coarse_y_difference:
    LDA objects_lo_y, x
    SEC
    SBC _y_pos_lo
    STA _y_pos_lo_difference

    LDA objects_hi_y, x
    SBC _y_pos_hi
    STA _y_pos_hi_difference

; 16bit LSR to move 2 low bits from hi into the lo
    LSR A
    ROR _y_pos_lo_difference
    LSR A
    ROR _y_pos_lo_difference

; 4 pixel difference for each unit of lo_difference

    RTS      ; Return