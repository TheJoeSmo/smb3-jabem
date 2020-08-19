para_boss_y_vel_limit:   .byte $01, -$01
para_boss_x_vel_limit:   .byte $14, $EC
para_boss_mask:
    .byte $04, $08, $08, $08, $10

para_boss_update:
    JSR Object_DeleteOffScreen  ; Delete if off-screen

    LDA Player_HaltGame
    BEQ +  ; If gameplay is not halted, jump to +

    JMP para_boss_draw  ; Draw Paragoomba and don't come back!

+:
    LDY LRBounce_Vel
    INY
    INY

    LDA para_boss_mask, y

    LDY #$00     ; Y = 0

    JSR para_boss_draw  ; Draw Paragoomba
    JSR Object_HandleBumpUnderneath  ; (Indirectly) Handle getting bumped underneath

    LDA para_state, x
    JSR DynJump

    ; THESE MUST FOLLOW DynJump FOR THE DYNAMIC JUMP TO WORK!!
    .word para_boss_action_flutter_down             ; 0: Paragoomba flutters down
    .word para_boss_action_fly_above_player         ; 1: Fly above Player
    .word para_boss_action_summon_micro_goomba      ; 2: Drop Micro goombas on Player






