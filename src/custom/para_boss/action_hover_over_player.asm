


para_boss_hover_over_player:
    LDA #$00
    STA Temp_Var14      ; Slowly go above player and regular vertical speeds
    JSR para_boss_handle_vertical_velocity
    JSR para_boss_handle_horizontal_velocity
    JMP para_boss_apply_velocity