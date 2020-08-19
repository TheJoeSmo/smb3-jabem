para_boss_action_summon_micro_goomba:
    LDY Objects_Timer,X
    BNE +  ; If timer not expired, jump to +

    ; Return to first internal state
    LDA #$00
    STA para_state, x

    ; Set timer to $80
    LDA #$80
    STA Objects_Timer,X

+:
    ; Var3 += 2
    INC Objects_Var3,X
    INC Objects_Var3,X

    INC Objects_Var5,X  ; Var5++

    LDA Objects_Var5,X
    AND #$1f
    BNE +  ; 1:32 ticks, proceed, otherwise jump to +

    JSR summon_micro_goomba  ; Drop a Microgoomba

+:
    LDY #$08     ; Y = $08

    LDA Objects_Var5,X
    AND #$10
    BEQ +  ; 16 ticks on, 16 ticks off; jump to +

    LDY #-$08    ; Y = -$08

+:
    STY Objects_YVel,X  ; Update Y velocity

    LDY #$00     ; Y = 0

    LDA Objects_FlipBits,X
    BNE +  ; If flipped, jump to +

    INY      ; Y = 1

+:
    LDA Objects_XVel,X
    CMP Paragoomba_XVelLimit,Y
    BEQ +     ; If Paragoomba is at his X velocity limit, jump to +

    CLC
    ADC Paragoomba_XVelAccel,Y
    STA Objects_XVel,X  ; Accelerate Paragoomba

+:
    INC Objects_Var2,X   ; Var2++

    LDA Objects_Var2,X
    AND #$3f
    BNE +  ; 1:64 ticks proceed, otherwise jump to +

    JSR Level_ObjCalcXDiffs

    ; Move towards Player
    LDA GroundTroop_FlipTowardsPlayer,Y
    STA Objects_FlipBits,X

+:
    JSR Object_ApplyXVel     ; Apply X Velocity
    JMP Object_ApplyYVel_NoLimit     ; Apply Y velocity and don't come back!

