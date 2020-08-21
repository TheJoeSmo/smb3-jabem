para_boss_action_summon_micro_goomba:
    LDA objects_timer, x
    BNE +

    JSR summon_micro_goomba
    INC para_state, x

    +

    JMP para_boss_action_be_slow_dirty
