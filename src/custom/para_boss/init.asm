; para boss init routine

para_boss_flip:  		.byte SPR_HFLIP, $00

para_boss_init:
    JSR Level_ObjCalcXDiffs

    ; Face Player when appearing
    LDA para_boss_flip, y
    STA objects_attributes, x

    LDA #$01
    STA para_state, x
    RTS