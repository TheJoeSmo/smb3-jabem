

para_boss_action_fall_to_kings_room:
    LDA Player_YHi
    CMP #$02
    BLT +  ; If Player's Y Hi < 2, jump to + (RTS)

    LDY Player_Current  ; Y = Player_Current

    ; When Level_ExitToMap goes non-zero, fall to king's room, not exit to map
    LDA #$01
    STA Player_FallToKing,Y

    LSR A
    STA Map_ReturnStatus        ; Map status = 0 (level cleared)
    INC Level_ExitToMap         ; INC Level_ExitToMap ; Fall into king's room (in this context)

+
    RTS