; para boss init routine

para_boss_flip:  		.byte SPR_HFLIP, $00

para_boss_init:
    JSR Level_ObjCalcXDiffs

    ; Not invincible by default
    LDA #$00
    STA objects_v14, x

    LDA Objects_X, x
    CLC
    ROR A
    ROR A 
    ROR A 
    ROR A
    AND #%00000011
    BNE +
    LDA #$07
    JMP ++
+
    CMP #$01
    BNE +
    LDA #$05
    JMP ++
+
    CMP #$02
    BNE +
    LDA #$03
    JMP ++
+
    LDA #$01    ; Cannot die
    STA objects_v14, x
    LDA #$05
++
	STA objects_health, x

	LDA #$00
	STA objects_v6, x 		; Draw the boss
	STA Level_GetWandState 	; Reset wand state

    ; Face Player when appearing
    LDA para_boss_flip, y
    STA objects_attributes, x

    LDA #$01
    STA para_state, x
    RTS