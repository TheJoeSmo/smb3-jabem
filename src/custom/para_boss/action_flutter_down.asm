para_boss_action_flutter_down:
    INC Objects_Var5, x  ; Var5++

    LDY #$08     ; Y = $08

    LDA Objects_FlipBits, x
    BNE PRG004_AFAC  ; If flipped, jump to PRG004_AFAC

    LDY #-$08    ; Y = -$08

PRG004_AFAC:
    STY Objects_XVel,X  ; Set horizontal velocity

    JSR Object_Move  ; Do standard movement

    ; Fall slowly
    DEC Objects_YVel,X
    DEC Objects_YVel,X

    LDY #$08     ; Y = 8

    LDA Objects_DetStat,X
    AND #$04
    BEQ PRG004_AFDC  ; If Paragoomba has not hit floor, jump to PRG004_AFDC

    LDA Objects_Var5,X
    AND #$3f
    BNE PRG004_AFCC  ; 64 ticks on, 64 ticks off; jump to PRG004_AFCC

    JSR Level_ObjCalcXDiffs

    ; Set flip towards Player
    LDA GroundTroop_FlipTowardsPlayer,Y
    STA Objects_FlipBits,X

PRG004_AFCC:
    JSR Object_HitGround     ; Align to floor

    LDY #$00     ; Y = 0

    LDA Objects_Timer,X
    BEQ PRG004_AFE3  ; If timer expired, jump to PRG004_AFE3

    CMP #$20
    BGE PRG004_AFDC  ; If timer >= $20, jump to PRG004_AFDC

    LDY #$08     ; Y = 8

PRG004_AFDC:
    TYA
    STA Objects_Var3,X  ; Set Var3 to 0 or 8

    JMP PRG004_AFE5  ; Jump to PRG004_AFE5

PRG004_AFE3:
    INC Objects_Var4,X  ; Var4++ (next internal state)

PRG004_AFE5:
    LDA Objects_DetStat,X
    AND #$03
    BEQ PRG004_AFEE  ; If Paragoomba did not hit wall, jump to PRG004_AFEE (RTS)

    JSR Object_FlipFace  ; Turn around

PRG004_AFEE:
    RTS      ; Return