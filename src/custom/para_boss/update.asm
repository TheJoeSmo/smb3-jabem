Paragoomba_XVelAccel:   .byte $01, -$01
Paragoomba_XVelLimit:   .byte $14, $EC
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

    AND Objects_Var5, x
    BEQ +  ; If mask results in zero, jump to +

    INY      ; Y = 1

+:
    TYA
    STA Objects_Frame,X  ; Set frame appropriately

    JSR para_boss_draw  ; Draw Paragoomba
    JSR PRG004_AF1A  ; (Indirectly) Handle getting bumped underneath

    LDA Objects_Var4,X
    JSR DynJump

    ; THESE MUST FOLLOW DynJump FOR THE DYNAMIC JUMP TO WORK!!
    .word para_boss_action_flutter_down             ; 0: Paragoomba flutters down
    .word para_boss_action_fly_above_player         ; 1: Fly above Player
    .word para_boss_action_summon_micro_goomba      ; 2: Drop Micro goombas on Player






