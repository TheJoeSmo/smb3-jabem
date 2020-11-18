
; 0 is hittable, 1 is not hittable
para_state_hittable: 
	.byte 0, 0, 0, 0
    .byte 0, 0, 0, 0
    .byte 0, 0, 0, 0
    .byte 0, 0, 0, 0

    .byte 0, 0, 0, 0
    .byte 0, 0, 0, 0
    .byte 0, 0, 0, 0
    .byte 1, 1, 0, 0

para_hit_test:
    JSR Object_HandleBumpUnderneath  	; Handle getting bumped

    LDA objects_player_info, x
    BEQ + 								; If player not hitting the boss, jump

    LDY para_state, x
    LDA para_state_hittable, y
    BEQ ++ 								; If hittable, jump

    LDA #$00
    ORA Player_IsDying      ; ORA Player_IsDying      ; If Player is dying...
    ORA Player_OffScreen    ; ... off-screen ...
    ORA Player_Behind_En    ; ... or behind the scenes ...
    BNE +++     ; ... jump to +++ (RTS)

    JSR Player_GetHurt  ; Otherwise, hurt Player!

+++:
    RTS      ; Return

++
    LDA player_y_vel
    BMI + 								; If Player is moving upward, jump to +(RTS)

; Play squish sound
    LDA player_sound_queue
    ORA #SND_PLAYERSWIM
    STA player_sound_queue

    LDA #$10
    STA objects_no_collide_timer, x

; Give the player some points
    LDA #$09
    JSR Score_PopUp

; Player Y Vel = -$30 (bounce off)
    LDA #-$30
    STA player_y_vel

    JSR para_hit_interrupt

+
    RTS      ; Return