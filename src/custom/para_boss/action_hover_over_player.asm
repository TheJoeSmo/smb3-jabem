para_boss_acceleration:   .byte $01, -$01
para_boss_horizontal_velocity_cap:   .byte $14, $EC
para_boss_horiztonal_limit: .byte $10, $70      ; The distance allowed to run away from the boss

para_boss_rise_quickest:
    DEC objects_y_velocity, x  
    DEC objects_y_velocity, x

para_boss_rise_quicker:
    DEC objects_y_velocity, x
    DEC objects_y_velocity, x

para_boss_rise:
    DEC objects_y_velocity, x

    LDA objects_y_velocity, x
    CMP #-32
    BPL +
    LDA #-32
    STA objects_y_velocity, x
+

    JMP para_boss_handle_horizontal_velocity


para_boss_lower_quickest:
    INC objects_y_velocity, x
    INC objects_y_velocity, x

para_boss_lower_quicker:
    INC objects_y_velocity, x

para_boss_lower:
    INC objects_y_velocity, x

    LDA objects_y_velocity, x
    CMP #32
    BMI +
    LDA #32
    STA objects_y_velocity, x
+

    JMP para_boss_handle_horizontal_velocity



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
    CMP #-64
    BPL +
    LDA #-64
    STA objects_x_velocity, x
+

    JMP para_boss_apply_velocity


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
    CMP #64
    BMI +
    LDA #64
    STA objects_x_velocity, x
+

    JMP para_boss_apply_velocity



para_boss_hover_over_player:

    JSR Level_ObjCalcYDiffs

    LDA Temp_Var16
    CMP #$20
    BMI para_boss_rise_quickest

    LDA Temp_Var16
    CMP #$60
    BMI para_boss_rise_quicker

    LDA Temp_Var16
    CMP #$68
    BMI para_boss_lower

    CMP #$78
    BMI para_boss_lower_quicker
    JMP para_boss_lower


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

    .word para_boss_apply_velocity
    .word para_boss_right
    .word para_boss_right_quicker
    .word para_boss_right_quickest

    .word para_boss_apply_velocity
    .word para_boss_left
    .word para_boss_left_quicker
    .word para_boss_left_quickest


para_boss_apply_velocity:
    JSR Object_ApplyXVel                ; Apply X Velocity
    JMP Object_ApplyYVel_NoLimit        ; Apply Y velocity and don't come back!