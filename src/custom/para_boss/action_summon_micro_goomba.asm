para_boss_action_summon_micro_goomba:
    LDY Objects_Timer,X
    BNE PRG004_B029  ; If timer not expired, jump to PRG004_B029

    ; Return to first internal state
    LDA #$00
    STA Objects_Var4,X

    ; Set timer to $80
    LDA #$80
    STA Objects_Timer,X

PRG004_B029:
    ; Var3 += 2
    INC Objects_Var3,X
    INC Objects_Var3,X

    INC Objects_Var5,X  ; Var5++

    LDA Objects_Var5,X
    AND #$1f
    BNE PRG004_B03A  ; 1:32 ticks, proceed, otherwise jump to PRG004_B03A

    JSR summon_micro_goomba  ; Drop a Microgoomba

PRG004_B03A:
    LDY #$08     ; Y = $08

    LDA Objects_Var5,X
    AND #$10
    BEQ PRG004_B044  ; 16 ticks on, 16 ticks off; jump to PRG004_B044

    LDY #-$08    ; Y = -$08

PRG004_B044:
    STY Objects_YVel,X  ; Update Y velocity

PRG004_B046:
    LDY #$00     ; Y = 0

    LDA Objects_FlipBits,X
    BNE PRG004_B04E  ; If flipped, jump to PRG004_B04E

    INY      ; Y = 1

PRG004_B04E:
    LDA Objects_XVel,X
    CMP Paragoomba_XVelLimit,Y
    BEQ PRG004_B05B     ; If Paragoomba is at his X velocity limit, jump to PRG004_B05B

    CLC
    ADC Paragoomba_XVelAccel,Y
    STA Objects_XVel,X  ; Accelerate Paragoomba

PRG004_B05B:
    INC Objects_Var2,X   ; Var2++

    LDA Objects_Var2,X
    AND #$3f
    BNE PRG004_B06E  ; 1:64 ticks proceed, otherwise jump to PRG004_B06E

    JSR Level_ObjCalcXDiffs

    ; Move towards Player
    LDA GroundTroop_FlipTowardsPlayer,Y
    STA Objects_FlipBits,X

PRG004_B06E:
    JSR Object_ApplyXVel     ; Apply X Velocity
    JMP Object_ApplyYVel_NoLimit     ; Apply Y velocity and don't come back!

