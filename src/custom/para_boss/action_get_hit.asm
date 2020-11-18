
; Boss falling out of sky animation
para_boss_get_hit:	
	LDA #$04
	STA objects_animation_frame, x

	LDA objects_timer, x
	BNE +

	INC para_state, x
	JMP para_boss_dirty_update		; Do the next state	

+

	JMP para_boss_apply_velocity