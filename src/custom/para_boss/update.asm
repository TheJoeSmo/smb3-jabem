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
    .word para_boss_action_summon_micro_goomba      ; 2: Drop Micro goombas on Player
    .word para_boss_action_do_nothing

    .word para_boss_action_prep_strong_attack       ; 3: Set the time for the next action
    .word para_boss_hover_over_player               ; 4: Fly around for a while
    .word para_boss_action_prep_attack              ; 5: Set the time for the next action
    .word para_boss_action_be_slow                  ; 6: Fly around slowly




