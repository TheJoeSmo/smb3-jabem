

para_boss_action_determine_attack:
	LDA cur_random+1
	AND #%00000111

	JSR DynJump

	.word para_boss_do_spawn_micro_goombas
	.word para_boss_do_spawn_micro_goombas
	.word para_boss_do_spawn_micro_goombas
	.word para_boss_do_spawn_micro_goombas
	.word para_boss_do_throw_goomba_at_player
	.word para_boss_do_throw_paragoomba_at_player
	.word para_boss_do_throw_flying_paragoomba_at_player
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


para_boss_do_flying:
	LDA #$01
	STA para_state, x
	JMP para_boss_dirty_update