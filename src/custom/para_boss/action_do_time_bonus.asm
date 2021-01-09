


para_boss_do_time_bonus:
	LDA #01 			; Disable the clock so it doesn't kill the player
	STA Level_TimerEn

	JSR DoTimeBonus
    BNE +

    ; All time depleted...

    LDA #$c0
    STA Objects_Timer,X  ; Object timer = $C0

    INC Level_GetWandState
    INC para_state, x
	JMP para_boss_dirty_update

+
	RTS