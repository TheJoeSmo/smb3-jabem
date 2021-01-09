

para_boss_wand_horz_vel:
	.byte -40, 40

para_boss_die_in_poof:
	LDA #$01 			; Stop drawing the boss
	STA objects_v6, x

	LDA Sound_QLevel2
    ORA #SND_LEVELAIRSHIP
    STA Sound_QLevel2

	LDA #$20
    JSR summon_poof_from_object_spot

    INC para_state, x


    ; Recovered Koopaling wand
    LDA #SOBJ_RECOVEREDWAND
    STA SpecialObj_ID,Y

    LDA objects_x, x
    STA SpecialObj_XLo, y
    LDA objects_lo_y, x
    SEC
    SBC #$20
    STA SpecialObj_YLo, y
    LDA objects_hi_y, x
    STA SpecialObj_YHi, y

    ; Halt velocities in this slo
    
    LDA #-30
    STA SpecialObj_YVel, y

    STY Temp_Var1
	JSR Level_ObjCalcXDiffs
	LDA para_boss_wand_horz_vel, y

	LDY Temp_Var1
	STA SpecialObj_XVel, y


    ; Var 1 = $50
    LDA #$50
    STA SpecialObj_Var1,Y


    JMP para_boss_dirty_update

; Wait for the player to retrieve the wand
para_boss_wait_for_wand_grab:
	LDA Level_GetWandState
	BEQ +

    LDA #$05
    STA Level_GetWandState

	LDA #$9e
    STA RotatingColor_Cnt 		; Cool color effect

	INC para_state, x
	JMP para_boss_dirty_update

+
	RTS