; para boss movement routine

para_boss_movement:
    LDY objects_attributes, x
    LDA para_boss_flip_cheat, y
    STA objects_x_velocity, x

    JSR object_handle_movement

    DEC objects_y_velocity, x

    LDA objects_detection_flags, x
    AND #object_hit_ceiling
    BEQ +

; Hit a ceiling
    LDA #$01
    STA objects_y_velocity, x

+

	LDA objects_v4, x
    BNE +
    LDA objects_y_velocity, x
    BPL +
; If var4 is not 0 and not moving upward, jump

    INC objects_v3, x
    INC objects_v3, x

+
    INC objects_v3, x


    LDA objects_detection_flags, x
    AND #object_hit_ground
    BEQ +

; Hit the ground
    LDA objects_v5, x
    AND #$3F
    BNE ++  ; 64 ticks on, 64 ticks off; jump to ++

; Set flip towards Player
    JSR determine_horizontal_player_relativity  ; Sets the y dependent on the player's position
    LDA para_boss_flip, y
    STA objects_attributes, x

++
    JSR object_handle_ground    ; Handle floor collision

    LDA objects_v4, x
    BNE ++

    LDA #$00
    STA objects_v3, x

++
    LDA objects_timer, x
    BNE +           ; If timer not expired, jump to +

    INC objects_v4, x ; Var4++ (next internal state)

    LDY #-$10   ; Y = -$10 (little hop)

    LDA objects_v4, x
    CMP #$04
    BNE ++

    LDA #$00
    STA objects_v4, x

    ; Timer set to $50
    LDA #$50
    STA objects_timer, x

    LDY #-$30    ; Y = -$30 (big hop)

++
    STY objects_y_velocity, x

+
    LDA objects_detection_flags, x
    AND #object_hit_wall
    BEQ +

    JSR object_face_other_direction

+
    JMP object_handle_external_collision
