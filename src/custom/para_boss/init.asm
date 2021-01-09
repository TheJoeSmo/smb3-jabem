; para boss init routine

para_boss_flip:  		.byte SPR_HFLIP, $00

para_boss_init:
    JSR Level_ObjCalcXDiffs

    LDA #$05
	STA objects_health, x

	LDA #$00
	STA objects_v6, x 		; Draw the boss
	STA Level_GetWandState 	; Reset wand state

    ; Face Player when appearing
    LDA para_boss_flip, y
    STA objects_attributes, x

    LDA #$01
    STA para_state, x
    RTS