

para_boss_wait_long:
para_boss_action_prep_strong_attack:
	LDA #$40
	STA objects_timer, x

	INC para_state, x
	JMP para_boss_dirty_update		; Do the next state