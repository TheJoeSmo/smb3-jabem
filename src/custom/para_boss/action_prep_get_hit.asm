
; Boss just got hit
para_boss_prep_get_hit:	
	LDA #$02
	STA objects_animation_frame, x

	LDA #$00
	STA objects_x_velocity, x
	LDA #4
	STA objects_y_velocity, x
	JSR para_boss_apply_velocity

	LDA objects_timer, x
	BNE +

	LDA #$08
	STA objects_timer, x

	INC para_state, x
	JMP para_boss_dirty_update		; Do the next state

+
	RTS