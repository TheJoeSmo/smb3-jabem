    
para_boss_draw:
    ; Toggle frame 0/1
    LDA Counter_1
    LSR A
    LSR A
    LSR A
    AND #$01
    STA Objects_Frame,X


    JSR para_boss_draw_mirrored     ; Draw mirrored goomba enemy


    LDY objects_sprite_offset, x  	; get sprite_data offset

; Left wing
    LDA sprite_data_y, y
    CMP #$F8
    BEQ +  ; If this sprite is vertically off-screen, jump to +

    SEC
    SBC #10
    STA sprite_data_y+8, y

+
; Right wing
    LDA sprite_data+4, y
    CMP #$F8
    BEQ +  ; If this sprite is vertically off-screen, jump to +

    SEC
    SBC #10
    STA sprite_data+12, y

+

    ; Left wing sprite X
    LDA sprite_data_x, y
    SEC
    SBC #$02
    STA sprite_data_x+8, y

    ; Right wing sprite X
    LDA sprite_data_x+4, y
    CLC
    ADC #$02
    STA sprite_data_x+12, y

    ; Left wing attribute
    LDA #sprite_horizontal_flip+sprite_pal_2
    STA sprite_data_attributes+8, y

    ; Right wing attribute
    LDA #sprite_pal_2
    STA sprite_data_attributes+12, y

    LDA objects_v5, x
    AND #%00001000
    LSR A
    ROR A
    ROR A
    TAY
    LDA para_boss_wings, y
    STA sprite_data_graphic+8, y
    STA sprite_data_graphic+12, y
    RTS


para_boss_draw_mirrored:
_objects_sprite_visability = Temp_Var3
    LDY #$00    ; Y = 0 (Sprite Y offset)
    LDA #SPR_VFLIP  ; A = SPR_VFLIP (draw mirrored sprite)

    STA Temp_Var9       ; Temp_Var9 = $00 (non-mirrored sprite) or SPR_VFLIP (mirrored sprite), depending on entry

    JSR object_quick_calc_position

    LDY objects_sprite_offset, x  	; Y = sprite_data offset

    LDA objects_sprite_v_visability, x
    LSR A
    BCS +rts     		; If this sprite is vertically off-screen, return

    LDA objects_sprite_visability, x
    STA _objects_sprite_visability
    ASL _objects_sprite_visability
    BCS +  						; If this sprite is horizontally off-screen, jump

    LDA object_sprite_y, x
    STA sprite_data_y, y

+
    ASL _objects_sprite_visability
    BCS +  						; If this sprite is horizontally off-screen, jump

    STA sprite_data+4, y     	; Otherwise, set Sprite Y

+

    ; Set left sprite X
    LDA object_sprite_x, x
    STA sprite_data_x, y

    ; Set right sprite X
    CLC
    ADC #$08
    STA sprite_data_x+4, y

    ; Temp_Var1 = current flip bits
    LDA objects_attributes, x
    STA Temp_Var1
    ORA objects_sprite_attributes, x    ; OR in the sprite attributes

    ASL Temp_Var9
    BCC +  ; If Temp_Var9 was assigned to $00 at start, we jump to +

    AND #<~SPR_HFLIP  ; Clear horizontal flip if Temp_Var9 was $80 at start

+:
    STA sprite_data+$02, y     ; Set left sprite attribute

    BCC +  ; If Temp_Var9 was assigned to $00 at start, we jump to +

    ORA #SPR_HFLIP   ; Set horizontal flip if Temp_Var9 was $80 at start

+:
    STA sprite_data+$06, y     ; Set right sprite attribute

    LDA Objects_Frame,X
    LDX ObjGroupRel_Idx  ; X = object group relative index

    ASL A        ; Multiply frame by 2

    CLC
    ADC ObjectGroup03_PatternStarts,X   ; Add in the base pattern set index

    TAX      ; Frame * 2 + Pattern Start -> 'X'

    LDA ObjectGroup03_PatternSets,X  ; Get the appropriate pattern for this frame

    BIT Temp_Var1
    BVS +  ; If horizontally flipped, jump to +

    ; Store left sprite pattern
    STA sprite_data+$01, y

    LDA ObjectGroup03_PatternSets+1,X ; Get the next pattern

    ; Store right sprite pattern
    STA sprite_data+$05, y

    JMP ++  ; Jump to ++

+:
    ; Store right sprite pattern
    STA sprite_data+$05, y

    LDA ObjectGroup03_PatternSets+1,X ; Get the next pattern

    ; Store left sprite pattern
    STA sprite_data+$01, y

++:
    LDX SlotIndexBackup     ; X = object slot index

+rts
    RTS      ; Return