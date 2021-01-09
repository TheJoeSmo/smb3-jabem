

para_horz_hit_left:
    .byte -50, -45, -40, -35, -30
para_horz_hit_right:
    .byte 50, 45, 40, 35, 30
para_horz_boom_vel:
	.byte -20, 20

; Boss falling out of sky animation
para_boss_get_hit:	
	LDA #$04
	STA objects_animation_frame, x

	LDA objects_timer, x
	BNE +

	INC para_state, x
	JMP para_boss_dirty_update		; Do the next state	

+

	; Make a poof of smoke with some velocity
	LDA #28
	JSR summon_poof_from_object_spot
	STY Temp_Var1
	JSR Level_ObjCalcXDiffs
	LDA para_horz_boom_vel, y

	LDY Temp_Var1
	STA SpecialObj_XVel, y

	JSR Level_ObjCalcXDiffs
	TYA
	BEQ +

	LDY objects_health, x
	LDA para_horz_hit_right, y

-
    STA objects_x_velocity, x

	JMP para_boss_apply_velocity

+
	LDY objects_health, x
	LDA para_horz_hit_left, y
	JMP -