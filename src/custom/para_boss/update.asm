para_boss_y_vel_limit:   .byte $01, -$01
para_boss_x_vel_limit:   .byte $14, $EC
para_boss_mask:
    .byte $04, $08, $08, $08, $10

para_boss_update:
    LDA #$80
    STA PatTable_BankSel+4

    LDA objects_v6, x   ; If set don't draw
    BNE +
    JSR para_boss_draw
+

    LDA Player_HaltGame
    BEQ +
    RTS             ; Do no logic if paused
+

    LDA objects_health, x   ; No collision after death
    BEQ +
    JSR para_hit_test
+

para_boss_dirty_update:
    LDA para_state, x

    JSR DynJump

    ; THESE MUST FOLLOW DynJump FOR THE DYNAMIC JUMP TO WORK!!
    .word para_boss_action_do_nothing               ; 0: Debug

    .word para_boss_wait_long                       ; 1: Set the time for the next action
    .word para_boss_select_next_flight_pattern      ; 2: Determine the type of fly for the boss
    .word para_boss_normal_fly                      ; 3: Fly around for a while
    .word para_boss_action_determine_attack         ; 4: Figure out the attack to use

    .word para_boss_wait                            ; 5: Set the time for the next action
    .word para_boss_normal_fly                      ; 6: Fly around slowly
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

    .word para_boss_action_prep_short_attack_with_sound        ; 13: Set the time for the next action
    .word para_boss_action_summon_goomba            ; 14: Spawn a goomba
    .word para_boss_do_flying

    .word para_boss_action_prep_short_attack_with_sound        ; 16: Set the time for the next action
    .word para_boss_action_summon_para_goomba       ; 17: Spawn a paragoomba
    .word para_boss_do_flying                       ; 18: Jump to state 1

    .word para_boss_action_prep_short_attack_with_sound        ; 19: Set the time for the next action
    .word para_boss_action_summon_flying_para_goomba; 1A: Spawn a flying paragoomba
    .word para_boss_do_flying                       ; 1B: Jump to state 1

    .word para_boss_prep_get_hit                    ; 1C: Got hit
    .word para_boss_get_hit                         ; 1D: Falling
    .word para_boss_do_flying                       ; 1E
    .word $0000                                     ; 1F
    .word $0000                                     ; 20
    .word $0000                                     ; 21

    .word para_boss_action_prep_short_attack_with_sound     ; 22: Set the time for the next action
    .word para_boss_action_lob_goomba                       ; 23: Spawn a goomba
    .word para_boss_do_flying

    .word para_boss_action_prep_short_attack_with_sound     ; 25: Set the time for the next action
    .word para_boss_action_lob_para_goomba                  ; 26: Spawn a paragoomba
    .word para_boss_do_flying

    .word para_boss_action_prep_short_attack_with_sound     ; 28: Set the time for the next action
    .word para_boss_action_lob_flying_para_goomba           ; 29: Spawn a flying paragoomba
    .word para_boss_do_flying

    .word para_boss_die_in_poof                     ; 2B: Make a poof
    .word para_boss_wait_for_wand_grab              ; 2C: Wait for the player to get the wand
    .word para_boss_do_time_bonus                   ; 2D: Do the time bonus
    .word para_boss_action_flicker_away             ; 2E: Do the flicker effect
    .word para_boss_action_fall_to_kings_room       ; 2F: Fall to the king's room
    .word para_boss_action_do_nothing               ; 0: Debug