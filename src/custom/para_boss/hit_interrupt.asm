
; Boss has been hit
para_hit_interrupt:
	DEC objects_health, x

	LDA objects_health, x
	BEQ para_death_interrupt

	LDA #$08
	STA objects_timer, x
	STA level_viberate

	LDA #$1C
	STA para_state, x

	RTS

; Boss has died
para_death_interrupt:
	RTS