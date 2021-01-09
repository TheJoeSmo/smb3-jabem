

para_boss_action_do_player_fall:
    LDA Objects_Timer,X
    BEQ +
    RTS

+
    INC para_state, x
	JMP para_boss_dirty_update