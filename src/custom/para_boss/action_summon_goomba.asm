

para_boss_action_summon_flying_para_goomba:
    LDA #OBJ_PARAGOOMBAWITHMICROS
    STA Temp_Var7
    BNE para_boss_action_summon_enemy


para_boss_action_summon_para_goomba:
    LDA #OBJ_PARAGOOMBA
    STA Temp_Var7
    BNE para_boss_action_summon_enemy


para_boss_action_summon_goomba:
    LDA #OBJ_GOOMBA
    STA Temp_Var7


para_boss_action_summon_enemy:
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

    LDA cur_random
    AND #%00111111
    STA Temp_Var14
    LDA #$00
    SEC
    SBC Temp_Var14
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
    INC para_state, x

++

    JMP para_boss_action_be_slow_dirty