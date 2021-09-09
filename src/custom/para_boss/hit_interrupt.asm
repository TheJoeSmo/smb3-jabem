

para_flash_durations:
	.byte 30, 25, 20, 15, 10

; Boss has been hit
para_hit_interrupt:
	DEC objects_health, x

	LDA objects_health, x
	BEQ para_death_interrupt

para_boss_does_not_die:
	LDA #$08
	STA objects_timer, x
	STA level_viberate

	LDA #$1C
	STA para_state, x

	LDA objects_health, x
	TAY
	LDA para_flash_durations, y
	STA objects_flashing_counter, x

	RTS

; Boss has died
para_death_interrupt:
	; Add check to see if the boss can die
	LDA objects_v14, x
	BEQ +

	LDA #$05
	STA objects_health, x
	JMP para_boss_does_not_die

+
	; Normal death code
	LDA #$2B
	STA para_state, x
	RTS