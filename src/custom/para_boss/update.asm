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
    .word para_boss_action_flutter_down             ; 0: Paragoomba flutters down
    .word para_boss_action_fly_above_player         ; 1: Fly above Player
    .word $0000                                     ; 2: 
    .word para_boss_action_do_nothing               ; 3: Debug

    .word para_boss_action_prep_strong_attack       ; 4: Set the time for the next action
    .word para_boss_hover_over_player               ; 5: Fly around for a while

    .word para_boss_action_prep_attack              ; 6: Set the time for the next action
    .word para_boss_action_be_slow                  ; 7: Fly around slowly

    .word para_boss_action_prep_attack              ; 8: Set time until spawning micro goombas
    .word para_boss_action_summon_micro_goomba      ; 9: Spawn micro goombas
    .word para_boss_action_prep_short_attack        ; A: Set time until next spawn
    .word para_boss_action_summon_micro_goomba      ; B: Spawn micro goombas
    .word para_boss_action_prep_short_attack        ; C: Set time until next spawn
    .word para_boss_action_summon_micro_goomba      ; D: Spawn micro goombas
    .word para_boss_action_prep_short_attack        ; E: Set time until next spawn

    .word para_boss_action_prep_attack              ; F: Set the time for the next action
    .word para_boss_hover_over_player               ; 10: Fly around for a while

    .word para_boss_action_prep_short_attack        ; 11: Set the time for the next action
    .word para_boss_action_summon_goomba            ; 12: Spawn a goomba

    .word para_boss_action_prep_attack              ; 13: Set the time for the next action
    .word para_boss_hover_over_player               ; 14: Fly around for a while