

para_boss_action_prep_attack:
	LDA #$20
	STA objects_timer, x

	INC para_state, x
	JMP para_boss_dirty_update		; Do the next state