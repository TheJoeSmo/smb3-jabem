para_boss_action_flutter_down:
    INC Objects_Var5, x  ; Var5++

    LDY #$08     ; Y = $08

    LDA Objects_FlipBits, x
    BNE +  ; If flipped, jump to +

    LDY #-$08    ; Y = -$08

+:
    STY Objects_XVel,X  ; Set horizontal velocity

    JSR Object_Move  ; Do standard movement

    ; Fall slowly
    DEC Objects_YVel,X
    DEC Objects_YVel,X

    LDY #$08     ; Y = 8

    LDA Objects_DetStat,X
    AND #$04
    BEQ ++  ; If Paragoomba has not hit floor, jump to ++

    LDA Objects_Var5,X
    AND #$3f
    BNE +  ; 64 ticks on, 64 ticks off; jump to +

    JSR Level_ObjCalcXDiffs

    ; Set flip towards Player
    LDA GroundTroop_FlipTowardsPlayer,Y
    STA Objects_FlipBits,X

+:
    JSR Object_HitGround     ; Align to floor

    LDY #$00     ; Y = 0

    LDA Objects_Timer,X
    BEQ +  ; If timer expired, jump to +

    CMP #$20
    BGE ++  ; If timer >= $20, jump to ++

    LDY #$08     ; Y = 8

++:
    TYA
    STA Objects_Var3,X  ; Set Var3 to 0 or 8

    JMP ++  ; Jump to ++

+:
    INC Objects_Var4,X  ; Var4++ (next internal state)

++:
    LDA Objects_DetStat,X
    AND #$03
    BEQ +  ; If Paragoomba did not hit wall, jump to + (RTS)

    JSR Object_FlipFace  ; Turn around

+:
    RTS      ; Return