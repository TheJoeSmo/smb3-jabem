; Returns a 0 or 1 to represent if the player is to the right or left respectively in the Y register
; Temp_Var16 hold the pixel difference relative to the player

determine_horizontal_player_relativity:
    LDA player_x
    SEC
    SBC objects_lo_x, x
    STA Temp_Var16  ; Temp_Var16 = difference between Player's X and object's X

    LDY #$00     ; Y = 0
    LDA player_x_hi
    SBC objects_hi_x, x
    BPL +  ; If Player's X Hi >= Object's X Hi, jump to + (RTS)

    INY      ; Otherwise Y = 1

+
    RTS      ; Return