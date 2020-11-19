

_position_lo_x = Temp_Var1
_poof_timer    = Temp_Var2
_position_lo_y = Temp_Var3
_position_hi_y = Temp_Var4

summon_poof_from_object_spot:
	STA _poof_timer

	LDA Objects_Y, x
    STA _position_lo_y
    LDA Objects_YHi, x
    STA _position_hi_y
    LDA Objects_X, x
    STA _position_lo_x
    JMP +

; A is the duration of the poof
summon_poof:
	STA _poof_timer

+
    LDY #$05     ; Searching special object slots 0 - 5
    JSR SpecialObj_FindEmptyAbortY   ; Find an open special object slot or don't come back

    ; A poof
    LDA #SOBJ_POOF       
    STA SpecialObj_ID, y

    LDA _poof_timer
    STA SpecialObj_Data, y    ; Used as "counter" while poof is in effect

    ; poof Y
    LDA _position_lo_y
    STA SpecialObj_YLo, y
    LDA _position_hi_y
    STA SpecialObj_YHi, y
    LDA _position_lo_x
    STA SpecialObj_XLo, y

    ; poof X/YVel = 0
    LDA #$00
    STA SpecialObj_YVel, y
    STA SpecialObj_XVel, y

    RTS      ; Return

