summon_micro_goomba:
    LDY #$05     ; Searching special object slots 0 - 5
    JSR SpecialObj_FindEmptyAbortY   ; Find an open special object slot or don't come back

    ; A microgoomba
    LDA #SOBJ_MICROGOOMBA
    STA SpecialObj_ID,Y

    ; Data = 0
    LDA #$00
    STA SpecialObj_Data,Y

    ; Microgoomba Y
    LDA Objects_Y,X
    CLC
    ADC #$04
    STA SpecialObj_YLo,Y
    LDA Objects_YHi,X
    ADC #$00
    STA SpecialObj_YHi,Y

    ; Microgoomba X
    LDA Objects_X,X
    CLC
    ADC #$04
    STA SpecialObj_XLo,Y

    ; Microgoomba X/YVel = 0
    LDA #$00
    STA SpecialObj_YVel,Y
    STA SpecialObj_XVel,Y

    RTS      ; Return