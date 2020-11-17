
; Boss has been hit
para_hit_interrupt:
	DEC objects_health, x

	LDA objects_health, x
	BEQ para_death_interrupt

	;LDA #$02
	;STA objects_animation_frame, x

	RTS

; Boss has died
para_death_interrupt:
	RTS