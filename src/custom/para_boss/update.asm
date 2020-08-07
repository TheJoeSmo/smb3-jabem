; update routine for para boss

para_boss_update:
    LDA is_paused
    BEQ +
; If paused only draw the boss
    JMP para_boss_draw

+

    INC objects_v5, x
    JSR para_boss_movement
    JSR para_boss_draw
    RTS