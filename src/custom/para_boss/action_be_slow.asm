	

para_boss_action_be_slow:
	LDA objects_timer, x
    BNE +

    INC para_state, x

    +

para_boss_action_be_slow_dirty:
    LDA tick_counter
    AND #%00001000
    CLC
    ROR A
    ROR A
    ROR A 
    STA objects_animation_frame, x

para_boss_action_be_slow_without_animation:
	LDA #$08
    STA Temp_Var14      ; Slowly go above player and slow vertical speeds
    JSR para_boss_handle_vertical_velocity
    JSR para_boss_handle_horizontal_velocity
    JMP para_boss_apply_velocity