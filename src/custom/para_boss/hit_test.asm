
; 0 is hittable, 1 is not hittable
para_state_hittable: 
	.byte 0, 0, 0, 0, 0, 0, 0

para_hit_test:
    JSR Object_HandleBumpUnderneath  	; Handle getting bumped

    LDA objects_player_info, x
    BEQ + 								; If player not hitting the boss, jump

    LDY para_state, x
    LDA para_state_hittable, y
    BEQ ++ 								; If hittable, jump

    JMP Player_HurtIfNotDieOffBehind    ; Hurt Player and don't come back!

++
    LDA player_y_vel
    BMI + 								; If Player is moving upward, jump to +(RTS)

; Play squish sound
    LDA player_sound_queue
    ORA #SND_PLAYERSWIM
    STA player_sound_queue

; Give the player some points
    LDA #$09
    JSR Score_PopUp

; Player Y Vel = -$30 (bounce off)
    LDA #-$30
    STA player_y_vel

+
    RTS      ; Return