

para_boss_right_quickest:
    DEC objects_x_velocity, x  
    DEC objects_x_velocity, x
    DEC objects_x_velocity, x  
    DEC objects_x_velocity, x

para_boss_right_quicker:
    DEC objects_x_velocity, x
    DEC objects_x_velocity, x

para_boss_right:
    DEC objects_x_velocity, x
    DEC objects_x_velocity, x
    DEC objects_x_velocity, x

    LDA objects_x_velocity, x
    CMP #-50
    BPL +
    LDA #-50
    STA objects_x_velocity, x
+

    RTS


para_boss_left_quickest:
    INC objects_x_velocity, x
    INC objects_x_velocity, x
    INC objects_x_velocity, x
    INC objects_x_velocity, x

para_boss_left_quicker:
    INC objects_x_velocity, x
    INC objects_x_velocity, x

para_boss_left:
    INC objects_x_velocity, x

    LDA objects_x_velocity, x
    CMP #50
    BMI +
    LDA #50
    STA objects_x_velocity, x
+


para_boss_do_nothing:
    RTS


para_boss_handle_horizontal_velocity:
    LDY #$00
    JSR Object_CalcCoarseXDiff

    BEQ +
    LDY #$04
+
    LDA Temp_Var15
    CLC
    ADC #$10
    CMP #$20
    BLT +

    LDA Temp_Var15
    CLC 
    ADC #$20
    CMP #$40
    BLT ++

    LDA Temp_Var15
    CLC
    ADC #$40
    CMP #$80
    BLT +++

    INY

    +++

    INY

    ++

    INY

+

    TYA
    JSR DynJump

    .word para_boss_do_nothing
    .word para_boss_right
    .word para_boss_right_quicker
    .word para_boss_right_quickest

    .word para_boss_do_nothing
    .word para_boss_left
    .word para_boss_left_quicker
    .word para_boss_left_quickest