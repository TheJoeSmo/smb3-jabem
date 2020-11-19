para_boss_y_vel_limit:   .byte $01, -$01
para_boss_x_vel_limit:   .byte $14, $EC
para_boss_mask:
    .byte $04, $08, $08, $08, $10

para_boss_update:
    JSR para_boss_draw

    LDA Player_HaltGame
    BEQ +
    RTS             ; Do no logic if paused
+

    JSR para_hit_test

para_boss_dirty_update:
    LDA para_state, x

    JSR DynJump

    ; THESE MUST FOLLOW DynJump FOR THE DYNAMIC JUMP TO WORK!!
    .word para_boss_action_do_nothing               ; 0: Debug

    .word para_boss_wait_long                       ; 1: Set the time for the next action
    .word para_boss_select_next_attack              ; 2: Determine the type of fly for the boss
    .word para_boss_hover_over_player               ; 3: Fly around for a while
    .word para_boss_action_determine_attack         ; 4: Figure out the attack to use

    .word para_boss_wait                            ; 5: Set the time for the next action
    .word para_boss_hover_over_player               ; 6: Fly around slowly
    .word para_boss_do_flying

    .word para_boss_wait                            ; 8: Set time until spawning micro goombas
    .word para_boss_action_summon_micro_goomba      ; 9: Spawn micro goombas
    .word para_boss_action_prep_short_attack        ; A: Set time until next spawn
    .word para_boss_action_summon_micro_goomba      ; B: Spawn micro goombas
    .word para_boss_action_prep_short_attack        ; C: Set time until next spawn
    .word para_boss_action_summon_micro_goomba      ; D: Spawn micro goombas
    .word para_boss_action_prep_short_attack        ; E: Set time until next spawn
    .word para_boss_action_summon_micro_goomba      ; F: Spawn micro goombas
    .word para_boss_action_prep_short_attack        ; 10: Set time until next spawn
    .word para_boss_do_flying
    .word $0000

    .word para_boss_action_prep_short_attack        ; 13: Set the time for the next action
    .word para_boss_action_summon_goomba            ; 14: Spawn a goomba
    .word para_boss_do_flying

    .word para_boss_action_prep_short_attack        ; 16: Set the time for the next action
    .word para_boss_action_summon_para_goomba       ; 17: Spawn a paragoomba
    .word para_boss_do_flying                       ; 18: Jump to state 1

    .word para_boss_action_prep_short_attack        ; 19: Set the time for the next action
    .word para_boss_action_summon_flying_para_goomba; 1A: Spawn a flying paragoomba
    .word para_boss_do_flying                       ; 1B: Jump to state 1

    .word para_boss_prep_get_hit                    ; 1C: Got hit
    .word para_boss_get_hit                         ; 1D: Falling
    .word para_boss_do_flying

    .word para_boss_action_prep_short_attack        ; 1F: Wait
    .word para_boss_action_summon_para_goomba       ; 20: Randomly spawn para goomba
    .word para_boss_do_flying