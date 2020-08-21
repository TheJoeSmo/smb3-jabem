

ObjNorm_ParaGoomba:
    JSR Object_DeleteOffScreen   ; Delete object if it falls off-screen

    LDA Player_HaltGame
    BEQ +

; Draw and don't come back
    JMP ParaGoomba_Draw

+

    LDA Objects_Timer4, x
    BNE ++

; Set proper ground troop X velocity
    LDY #$08

    LDA objects_attributes, x
    BNE +

; Flip horizontal velocity if needed
    LDY #-$08

+
    STY Objects_XVel, x

++

    JSR Object_Move                 ; Do standard movements

    DEC objects_y_velocity, x

    ; Toggle frame 0/1
    LDA Counter_1
    LSR A
    LSR A
    LSR A
    AND #$01
    STA objects_animation_frame,X

    JSR ParaGoomba_Draw  ; Draw the winged Goomba

    INC objects_v5, x  ; Var5++

    LDA objects_v4, x
    BNE +  ; If Var4 <> 0, jump to +

    LDA objects_y_velocity, x
    BPL +  ; If Paragoomba is not moving upward, jump to +

    ; Var3 += 2
    INC objects_v3, x
    INC objects_v3, x

+
    INC objects_v3, x   ; Var3++

    LDA objects_detection_flags, x
    AND #$08
    BEQ +  ; If Paragoomba did NOT hit ceiling, jump to +

    ; Bounce off ceiling
    LDA #$01
    STA objects_y_velocity, x

+
    LDA objects_detection_flags, x
    AND #$04
    BEQ ++  ; If Paragoomba did NOT hit ground, jump to ++

    LDA objects_v5, x
    AND #$3f
    BNE +  ; 64 ticks on, 64 ticks off; jump to +

    JSR Level_ObjCalcXDiffs

    ; Set flip towards Player
    LDA GroundTroop_FlipTowardsPlayer, y
    STA objects_attributes, x

+
    JSR Object_HitGround     ; Align to floor

    LDA objects_v4, x
    BNE +  ; If Var4 <> 0, jump to +

    ; Var3 = 0
    LDA #$00
    STA objects_v3, x

+
    LDA Objects_Timer, x
    BNE ++  ; If timer not expired, jump to ++

    INC objects_v4, x ; Var4++ (next internal state)

    LDY #-$10   ; Y = -$10 (little hop)

    LDA objects_v4, x
    CMP #$04
    BNE +  ; If Var4 <> 4, jump to +

    ; Var4 = 0
    LDA #$00
    STA objects_v4, x

    ; Timer set to $50
    LDA #$50
    STA Objects_Timer, x

    LDY #-$30    ; Y = -$30 (big hop)

+
    STY Objects_YVel, x  ; Set Y velocity appropriately

++
    LDA objects_detection_flags, x
    AND #$03
    BEQ +  ; If Paragoomba did not hit wall, jump to +

    JSR Object_FlipFace  ; Turn around

+
PRG004_AF1A:
    JMP Object_HandleBumpUnderneath  ; Handle getting bumped from underneath

    RTS      ; Return