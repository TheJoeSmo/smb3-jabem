

para_boss_rise_quickest:
    DEC objects_y_velocity, x  
    DEC objects_y_velocity, x

para_boss_rise_quicker:
    DEC objects_y_velocity, x
    DEC objects_y_velocity, x

para_boss_rise:
    DEC objects_y_velocity, x

    LDA objects_y_velocity, x
    CMP #-50
    BPL +
    LDA #-50
    STA objects_y_velocity, x
+

    RTS


para_boss_lower_quickest:
    INC objects_y_velocity, x
    INC objects_y_velocity, x

para_boss_lower_quicker:
    INC objects_y_velocity, x

para_boss_lower:
    INC objects_y_velocity, x

    LDA objects_y_velocity, x
    CMP #50
    BMI +
    LDA #50
    STA objects_y_velocity, x
+

    RTS


para_boss_handle_vertical_velocity:
    LDY #$00
    JSR Object_CalcCoarseYDiff

    LDA Temp_Var15
    BPL para_boss_rise_quickest     ; If below player, get above them

    LDA Temp_Var15
    CLC
    ADC #$18
    BCS +

    CLC
    ADC #$02
    BCS ++

    CLC
    ADC #$04
    BCS +++

    INY

+++
    INY

++
    INY

+

    TYA

    JSR DynJump

    .word para_boss_rise_quickest
    .word para_boss_rise
    .word para_boss_lower
    .word para_boss_lower_quickest