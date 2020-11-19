

find_amount_of_sprites_on_screen:
	LDA #$00
	STA Temp_Var1

	LDY #$04
-
    LDA objects_states, y
    BEQ +
    INC Temp_Var1		; If used, add 1 to the count
+
    DEY
    BPL -           

    LDA Temp_Var1
	RTS