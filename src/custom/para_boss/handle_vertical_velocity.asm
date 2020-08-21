
para_boss_vertical_distance_ranges:
    .byte $18, $1A, $1E, $00
    .byte $14, $1A, $1E, $00
    .byte $18, $1A, $1E, $00

para_boss_vertical_distance_speeds:
    .byte $01, $03, $04, $07
    .byte $02, $04, $04, $06
    .byte $02, $03, $05, $06


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


; Temp_Var14 determines the offset and the high bit determines how fast to fly above the player
para_boss_handle_vertical_velocity:
    LDA Temp_Var14
    AND #%01111111
    TAY
    JSR Object_CalcCoarseYDiff

    LDA Temp_Var14
    AND #%10000000
    BEQ +
    LDA Temp_Var15
    BPL para_boss_rise_quickest     ; If below player, get above them no matter what
    JMP ++
+
    LDA Temp_Var15
    BPL para_boss_rise              ; Slower rise above the player

++
    LDA Temp_Var15
    CLC
    ADC para_boss_vertical_distance_ranges, y
    BCS +

-
    INY

    LDA para_boss_vertical_distance_ranges, y
    BEQ +

    LDA Temp_Var15
    CLC
    ADC para_boss_vertical_distance_ranges, y
    BCS +
    BCC -

+
    LDA para_boss_vertical_distance_speeds, y
    JSR DynJump

    .word para_boss_do_nothing
    .word para_boss_rise_quickest
    .word para_boss_rise_quicker
    .word para_boss_rise

    .word para_boss_do_nothing
    .word para_boss_lower
    .word para_boss_lower_quicker
    .word para_boss_lower_quickest