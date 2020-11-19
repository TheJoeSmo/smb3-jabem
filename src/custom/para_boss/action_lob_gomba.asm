

para_boss_action_lob_flying_para_goomba:
    LDA #OBJ_PARAGOOMBAWITHMICROS
    STA Temp_Var7

    LDA #SPR_PAL3
    STA Temp_Var9

    BNE para_boss_action_lob_enemy


para_boss_action_lob_para_goomba:
    LDA #OBJ_PARAGOOMBA
    STA Temp_Var7

    LDA #SPR_PAL1
    STA Temp_Var9

    BNE para_boss_action_lob_enemy
    

para_boss_action_lob_goomba:
    LDA #OBJ_GOOMBA
    STA Temp_Var7

    LDA #SPR_PAL3
    STA Temp_Var9


para_boss_action_lob_enemy:
    LDA objects_timer, x
    BNE ++

    LDA objects_lo_x, x
    STA Temp_Var1
    LDA objects_hi_x, x
    STA Temp_Var2
    LDA objects_lo_y, x
    STA Temp_Var3
    LDA objects_hi_y, x
    STA Temp_Var4

    LDA #-30
    STA Temp_Var6
    

    JSR Object_CalcCoarseXDiff

    LDA Temp_Var15
    LSR A
    LSR A
    LSR A
    STA Temp_Var5

    CPY #$00
    BNE +
    
    LDA #$00
    SEC
    SBC Temp_Var5
    STA Temp_Var5

+

    JSR prepare_new_enemy

    LDA #$1C
    JSR summon_poof

    INC para_state, x


++

    LDA #$03
    STA objects_animation_frame, x

    JMP para_boss_action_be_slow_without_animation