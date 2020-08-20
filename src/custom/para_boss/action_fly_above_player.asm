para_boss_pixel_difference = $38

para_boss_action_fly_above_player:

    ; Var3 += 3
    INC Objects_Var3,X
    INC Objects_Var3,X
    INC Objects_Var3,X

    JSR Level_ObjCalcYDiffs

    CPY #$00
    BNE +  ; If Player is higher than Paragoomba, jump to +

    LDA Temp_Var16
    CMP #para_boss_pixel_difference
    BLT +  ; If Paragoomba is not sufficiently above Player, jump to +

    INC Objects_YVel,X  ; A little lower

    BNE ++     ; If Paragoomba hit zero, jump to ++

    INC Objects_Var4,X ; Var4++ (next internal state)

    ; Set timer to $80
    LDA #$80
    STA Objects_Timer,X

    RTS      ; Return

+:

    ; Fly higher
    LDA #-$10
    STA Objects_YVel,X

++:
    JSR Object_ApplyYVel_NoLimit     ; Apply Y velocity

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