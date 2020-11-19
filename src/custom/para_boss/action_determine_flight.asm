
; Flight patterns for each phase of the fight
para_boss_flights:
	.byte 43, 39, 64, 0		; 4 hits
	.byte 35, 43, 60, 13	; 3 hits
	.byte 39, 47, 72, 26	; 2 hits
	.byte 43, 51, 56, 0		; 1 hits
	.byte 31, 35, 76, 72 	; 0 hits

para_boss_flights_fly_away:
	.byte 31, 31, 35, 35, 39 	; Patterns for when the boss has three enemies on screen

; Determines the attack of the boss
para_boss_select_next_flight_pattern:
para_boss_action_determine_flight:
	JSR find_amount_of_sprites_on_screen
	CMP #3
	BPL para_boss_action_fly_away_from_player	

	LDA objects_health, x
	CLC
	ASL A
	ASL A
	STA Temp_Var14

	LDA cur_random
	AND #%00000011
	CLC
	ADC Temp_Var14

	TAY
	LDA para_boss_flights-4, y
	STA objects_v2, x

	INC para_state, x
	JMP para_boss_dirty_update		; Do the next state

; The boss has more than three enemies on screen
para_boss_action_fly_away_from_player:
	LDY objects_health, x
	LDA para_boss_flights_fly_away-1, y
	STA objects_v2, x
	INC para_state, x
	JMP para_boss_dirty_update		; Do the next state