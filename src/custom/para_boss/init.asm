; para boss init routine

para_boss_flip:  .byte SPR_HFLIP, $00

init_para_boss:
    JSR Level_ObjCalcXDiffs

    ; Face Player when appearing
    LDA para_boss_flip, y
    STA objects_attributes, x
    RTS