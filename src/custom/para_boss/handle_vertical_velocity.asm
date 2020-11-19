
para_boss_vertical_distance_ranges: 
; Bands
    .byte 10, 12, 14, 16,  18, 20, 22, 24,  26, 28, 30, 32, 60  ; Chaotic Neutral Band  ; 0
    .byte 10, 12, 14, 16,  18, 20, 22, 24,  26, 28, 30, 32, 60  ; Fall From Heaven Band ; 13
    .byte 6, 12, 14, 16,   18, 24, 26, 32, 60                   ; Twin Peaks Band       ; 26

; Fast Speeds
    .byte 18, 24, 26, 32    ; 12.5 blocks above player          ; 31
    .byte 14, 20, 22, 28    ; 10.5 blocks above player          ; 35
    .byte 10, 16, 18, 24    ; 8.5 blocks above player           ; 39
    .byte 6, 12, 14, 20     ; 6.5 blocks above player           ; 43
    .byte 2, 8, 10, 12      ; 4.5 blocks above player           ; 47
    .byte 0, 4, 6, 8        ; 2.5 blocks above player           ; 51
    .byte 60                ; Max value to stop overflow

; Normal Speeds
    .byte 18, 24, 26, 32    ; 12.5 blocks above player          ; 56
    .byte 14, 20, 22, 28    ; 10.5 blocks above player          ; 60
    .byte 10, 16, 18, 24    ; 8.5 blocks above player           ; 64
    .byte 6, 12, 14, 20     ; 6.5 blocks above player           ; 68
    .byte 2, 8, 10, 12      ; 4.5 blocks above player           ; 72
    .byte 0, 4, 6, 8        ; 2.5 blocks above player           ; 76
    .byte 60                ; Max value to stop overflow

; do_nothing 0 | rise_quickest 1 | rise_quicker 2 | rise 3 | do_nothing 4 | lower 5 | lower_quicker 6 | lower_quickest 7
para_boss_vertical_distance_speeds:
; Bands
    .byte 1, 2, 6, 7, 2, 3, 5, 6, 1, 2, 6, 7, 7     ; Chaotic Neutral Band
    .byte 2, 3, 5, 6, 2, 3, 5, 7, 2, 3, 6, 7, 7     ; Fall From Heaven Band
    .byte 2, 3, 5, 6, 2, 3, 5, 6, 7, 7              ; Twin Peaks Band

; Fast Speed
    .byte 1, 2, 6, 7        ; 12.5 blocks above player
    .byte 1, 2, 6, 7        ; 10.5 blocks above player
    .byte 1, 2, 6, 7        ; 8.5 blocks above player
    .byte 1, 2, 6, 7        ; 6.5 blocks above player 
    .byte 1, 2, 6, 7        ; 4.5 blocks above player
    .byte 1, 2, 6, 7        ; 2.5 blocks above player
    .byte 7                 ; Go down and go down fast

; Normal Speed
    .byte 2, 3, 5, 6        ; 12.5 blocks above player
    .byte 2, 3, 5, 6        ; 10.5 blocks above player
    .byte 2, 3, 5, 6        ; 8.5 blocks above player
    .byte 2, 3, 5, 6        ; 6.5 blocks above player 
    .byte 2, 3, 5, 6        ; 4.5 blocks above player
    .byte 2, 3, 5, 6        ; 2.5 blocks above player
    .byte 7                 ; Go down and go down fast


para_boss_rise_quickest:
    LDA objects_y_velocity, x
    SEC
    SBC #(OBJECT_FALLRATE + 3)
    STA objects_y_velocity, x
    JMP para_boss_rise_cap

para_boss_rise_quicker:
    LDA objects_y_velocity, x
    SEC
    SBC #(OBJECT_FALLRATE + 2)
    STA objects_y_velocity, x
    JMP para_boss_rise_cap

para_boss_rise:
    LDA objects_y_velocity, x
    SEC
    SBC #(OBJECT_FALLRATE + 1)
    STA objects_y_velocity, x


para_boss_rise_cap:
; Add poof upwards
    LDA objects_y_velocity, x
    CMP #-15
    BPL +

    LDA tick_counter
    AND #%00001111
    BNE +

    LDA #$10
    JSR summon_poof_from_object_spot

+

; Add cap
    LDA objects_y_velocity, x
    CMP #-40
    BPL +
    LDA #-40
    STA objects_y_velocity, x
+

    RTS

para_boss_lower_quickest:
    LDA objects_y_velocity, x
    CLC
    ADC #(3 - OBJECT_FALLRATE)
    STA objects_y_velocity, x
    JMP para_boss_lower_cap

para_boss_lower_quicker:
    LDA objects_y_velocity, x
    CLC
    ADC #(2 - OBJECT_FALLRATE)
    STA objects_y_velocity, x
    JMP para_boss_lower_cap

para_boss_lower:
    LDA objects_y_velocity, x
    CLC
    ADC #(1 - OBJECT_FALLRATE)
    STA objects_y_velocity, x

para_boss_lower_cap:
    LDA objects_y_velocity, x
    CMP #30
    BMI +

    LDA tick_counter
    AND #%00000001
    BNE +

    LDA #$10
    JSR summon_poof_from_object_spot

+

    LDA objects_y_velocity, x
    CMP #40
    BMI +
    LDA #40
    STA objects_y_velocity, x
+

    RTS

para_boss_handle_below_player:
    LDA objects_detection_flags, x
    AND #object_hit_ground
    BNE para_boss_handle_on_ground

    JMP para_boss_rise

para_boss_handle_on_ground:
    LDA #-20
    STA objects_y_velocity, x
    RTS


; Temp_Var14 determines the offset and the high bit determines how fast to fly above the player
para_boss_handle_vertical_velocity:
    LDA Temp_Var14
    AND #%01111111
    TAY
    JSR Object_CalcCoarseYDiff

    LDA Temp_Var14
    AND #%10000000
    BNE +
    LDA Temp_Var15
    BPL para_boss_handle_below_player   ; The boss is below the player

-
; Loop through each value until we hit a value under the var

    LDA Temp_Var15
    ADC para_boss_vertical_distance_ranges, y
    BPL +

    INY
    JMP -


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