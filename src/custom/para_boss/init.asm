; para boss init routine

para_boss_init:
    JSR Level_ObjCalcXDiffs

    ; Face Player when appearing
    LDA para_boss_flip, y
    STA objects_attributes, x
    RTS