

GroundTroop_XVel:
    .byte -$08, $08
    .byte -$06, $06
    .byte -$05, $05

    .byte $F0, $10, $F4, $0C, $F7, $09


ObjNorm_GroundTroop:
    JSR Object_DeleteOffScreen   ; Delete object if it falls off-screen

    LDA Player_HaltGame
    BEQ +  ; If gameplay is not halted, jump to +

    JMP GroundTroop_Draw     ; Draw the enemy and don't come back!

+
    LDA Objects_FlipBits,X
    ASL A
    ASL A
    ROL A
    AND #$01
    TAY      ; Y = 0 or 1, depending if horizontally flipped or not

    ; objects_target_x is set if enemy is hit by a left/right bouncing block
    LDA objects_target_x, x
    BPL +  ; If TargetingXVal >= 0, jump to +

    ; Otherwise, 'Y' += 2
    INY
    INY

    CMP #-$02
    BNE +  ; If TargetingXVal <> -2, jump to +

    ; Otherwise, 'Y' += 2
    INY
    INY

+:

    LDA Objects_Timer4, x
    BNE +
    ; Set proper ground troop X velocity
    LDA GroundTroop_XVel,Y
    STA objects_x_velocity, x

+

    ; Toggle frame 0/1
    LDA Objects_Var5,X
    LSR A
    LSR A
    AND #$01
    STA Objects_Frame,X

    LDA Objects_Var1,X
    BEQ +  ; If Var1 = 0, jump to +

    DEC Objects_Var1,X   ; Var1--

    JSR Object_ApplyXVel     ; Apply X velocity
    JSR Object_ApplyYVel

    INC Objects_Var5,X  ; Var5++

    JSR GroundTroop_Draw     ; Draw the enemy
    JMP Player_HitEnemy  ; Do Player to enemy collision and don't come back!

+:
    JSR GroundTroop_Draw     ; Draw the enemy
    JSR Object_Move      ; Standard object movements

    ; If this enemy is in contact with a left/right bouncing block, set objects_target_x
    LDA LRBounce_Vel
    STA objects_target_x,X

    JSR GroundTroop_BumpOffOthers    ; Bounce off other enemies

    LDY LRBounce_Vel
    INY
    INY

    ; Var7 += PRG004_B353[Y]
    LDA Objects_Var7,X
    CLC
    ADC PRG004_B353,Y
    STA Objects_Var7,X

    BCC +  ; If no carry, jump to +

    INC Objects_Var5,X  ; Var5++

+:

    LDA Objects_DetStat,X
    AND #$04
    BNE PRG004_B3EC  ; If enemy hit ground, jump to PRG004_B3EC

    ; Enemy did not hit ground...

    LDA Objects_DetStat,X
    AND #$08
    BEQ +  ; If enemy hit did NOT ceiling, jump to +

    ; If enemy hit ceiling, bounce off it
    LDA #$01
    STA objects_y_velocity, x

+:
    LDY Level_ObjectID,X
    CPY #OBJ_PARATROOPAGREENHOP
    BEQ +  ; If this is a hopping green shell paratroopa, jump to +

    CPY #OBJ_BIGGREENHOPPER
    BEQ +  ; If this is a GIANT hopping green shell paratroopa, jump to +

    ; Not a green shell hopper...

    STA Objects_Var5,X ; Var5 = 1
    JMP ++  ; Jump to ++

+:
    ; Hopping green shelled troopas have a slight "float" in their Y velocity
    DEC objects_y_velocity, x
    JMP ++  ; Jump to ++

PRG004_B3EC:
    ; Ground troop hit ground...

    ; Stop using custom velocity
    LDA #$00
    STA Objects_Timer4, x

    JSR Object_HitGround     ; Align to floor

    LDA Level_ObjectID,X
    CMP #OBJ_BIGGREENHOPPER
    BEQ +  ; If this the GIANT hopping green shell paratroopa, jump to P+

    CMP #OBJ_PARATROOPAGREENHOP
    BNE ++  ; If this is NOT a hopping green shell paratroopa, jump to ++

+:

    ; Green shelled troopas...

    LDA #-$30   ; Y velocity will be set to -$30 out of water

    LDY Objects_InWater,X
    BEQ +  ; If this troopa is not in the water, jump to +

    LDA #-$18   ; Y velocity will be set to -$18 in water

+:
    STA objects_y_velocity, x  ; Set Y velocity for hop

++:
    LDA Objects_DetStat,X
    AND #$03
    BEQ +  ; If enemy hasn't hit a wall, jump to +

    JSR Object_FlipFace  ; Turn around

+:
    JMP Object_HandleBumpUnderneath
