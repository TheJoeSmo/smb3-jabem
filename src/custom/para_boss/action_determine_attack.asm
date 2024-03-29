

; Determine a random attack depending on rng and the health of the boss
para_boss_action_determine_attack:
	JSR find_amount_of_sprites_on_screen
	CMP #2
	BMI +
; There are more than two enemies on screen
	LDA objects_health, x
	CMP #$2
	BMI ++
; Skip one roll for a microgoomba if more than two enemies
	LDA cur_random+2
	AND #%00000011
	BNE ++
	JMP para_boss_do_spawn_micro_goombas 	; Spawn some paragoombas

++
	LDA cur_random+3
	AND #%00000011
	BNE +
	JMP para_boss_do_spawn_micro_goombas 	; Spawn some paragoombas

+

	LDA objects_health, x
	SEC
	SBC #$01
	CLC
	ASL A
	ASL A
	ASL A
	STA Temp_Var14
	LDA cur_random+1
	AND #%00000111
	CLC
	ADC Temp_Var14		; A = (health << 3) + 0-7 

	JSR DynJump

	.word para_boss_do_spawn_micro_goombas
	.word para_boss_do_spawn_micro_goombas
	.word para_boss_do_spawn_micro_goombas
	.word para_boss_do_lob_paragoomba_at_player
	.word para_boss_do_throw_paragoomba_at_player
	.word para_boss_do_lob_flying_paragoomba_at_player
	.word para_boss_do_throw_flying_paragoomba_at_player
	.word para_boss_do_flying

	.word para_boss_do_spawn_micro_goombas
	.word para_boss_do_spawn_micro_goombas
	.word para_boss_do_lob_goomba_at_player
	.word para_boss_do_lob_paragoomba_at_player
	.word para_boss_do_throw_paragoomba_at_player
	.word para_boss_do_lob_flying_paragoomba_at_player
	.word para_boss_do_throw_flying_paragoomba_at_player
	.word para_boss_do_flying

	.word para_boss_do_spawn_micro_goombas
	.word para_boss_do_throw_goomba_at_player
	.word para_boss_do_lob_paragoomba_at_player
	.word para_boss_do_lob_paragoomba_at_player
	.word para_boss_do_throw_paragoomba_at_player
	.word para_boss_do_lob_flying_paragoomba_at_player
	.word para_boss_do_throw_flying_paragoomba_at_player
	.word para_boss_do_flying

	.word para_boss_do_spawn_micro_goombas
	.word para_boss_do_throw_goomba_at_player
	.word para_boss_do_throw_goomba_at_player
	.word para_boss_do_lob_paragoomba_at_player
	.word para_boss_do_lob_paragoomba_at_player
	.word para_boss_do_throw_paragoomba_at_player
	.word para_boss_do_lob_flying_paragoomba_at_player
	.word para_boss_do_flying

	.word para_boss_do_spawn_micro_goombas
	.word para_boss_do_lob_paragoomba_at_player
	.word para_boss_do_lob_paragoomba_at_player
	.word para_boss_do_throw_goomba_at_player
	.word para_boss_do_throw_goomba_at_player
	.word para_boss_do_lob_goomba_at_player
	.word para_boss_do_lob_goomba_at_player
	.word para_boss_do_flying

; Shoot between 1 and 4 micro goombas
para_boss_do_spawn_micro_goombas:
	LDA cur_random+2
	AND #%00000011
	CLC
	ASL A
	CLC
	ADC #$08
	STA para_state, x
	JMP para_boss_dirty_update


para_boss_do_throw_goomba_at_player:
	LDA #$13
	STA para_state, x
	JMP para_boss_dirty_update


para_boss_do_throw_paragoomba_at_player:
	LDA #$16
	STA para_state, x
	JMP para_boss_dirty_update


para_boss_do_throw_flying_paragoomba_at_player:
	LDA #$19
	STA para_state, x
	JMP para_boss_dirty_update

para_boss_do_lob_goomba_at_player:
	LDA #$22
	STA para_state, x
	JMP para_boss_dirty_update


para_boss_do_lob_paragoomba_at_player:
	LDA #$25
	STA para_state, x
	JMP para_boss_dirty_update


para_boss_do_lob_flying_paragoomba_at_player:
	LDA #$28
	STA para_state, x
	JMP para_boss_dirty_update

para_boss_do_flying:
	LDA #$01
	STA para_state, x
	JMP para_boss_dirty_update