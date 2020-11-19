

para_boss_action_prep_short_attack_with_sound:
	LDA Sound_QLevel1
	ORA #SND_LEVELPOOF   
	STA Sound_QLevel1

para_boss_action_prep_short_attack:
	LDA cur_random
	AND #%00001111
	STA objects_timer, x

	INC para_state, x
	JMP para_boss_dirty_update		; Do the next state