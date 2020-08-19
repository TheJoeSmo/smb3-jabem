para_boss_action_fly_above_player:

    ; Var3 += 3
    INC Objects_Var3,X
    INC Objects_Var3,X
    INC Objects_Var3,X

    JSR Level_ObjCalcYDiffs

    CPY #$00
    BNE PRG004_B011  ; If Player is higher than Paragoomba, jump to PRG004_B011

    LDA Temp_Var16
    CMP #$38
    BLT PRG004_B011  ; If Paragoomba is not sufficiently above Player, jump to PRG004_B011

    INC Objects_YVel,X  ; A little lower

    BNE PRG004_B015     ; If Paragoomba hit zero, jump to PRG004_B015

    INC Objects_Var4,X ; Var4++ (next internal state)

    ; Set timer to $80
    LDA #$80
    STA Objects_Timer,X

    RTS      ; Return

PRG004_B011:

    ; Fly higher
    LDA #-$10
    STA Objects_YVel,X

PRG004_B015:
    JSR Object_ApplyYVel_NoLimit     ; Apply Y velocity

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