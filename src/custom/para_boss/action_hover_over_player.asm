


para_boss_hover_over_player:

; Determine if we need to change state
    LDA objects_timer, x
    BNE +

; Change state (updates next frame)
    LDA #$06
    STA para_state, x    

+

; Calculate the frame we are on (between 0 and 1)
    LDA tick_counter
    AND #%00000100
    CLC
    ROR A
    ROR A 
    STA objects_animation_frame, x

; Calculate velocities
    LDA #$00
    STA Temp_Var14      ; Slowly go above player and regular vertical speeds
    JSR para_boss_handle_vertical_velocity
    JSR para_boss_handle_horizontal_velocity
    JMP para_boss_apply_velocity