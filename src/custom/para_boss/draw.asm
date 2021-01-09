frame_count_helper: .byte 0, 6, 12, 18, 24, 30, 36 

_object_sprite_y = Temp_Var1
_object_sprite_x = Temp_Var2
_objects_sprite_v_visability = Temp_Var5

para_boss_draw:
    JSR Object_ShakeAndCalcSprite    ; Calculate sprite data

    LDA _object_sprite_y
    SEC 
    SBC #5
    STA _object_sprite_y            ; Lower the sprite by 5 pixels

    LDA _object_sprite_x
    CLC
    SBC #2
    STA _object_sprite_x            ; Center hitbox

    LDX object_index         ; X = object slot index

    LDA objects_animation_frame, x
    TAX
    LDA frame_count_helper, x
    PHA
    TAX

    LDA Temp_Var3
    BPL +                       ; If not vertically flipped, jump to +

; Otherwise, starting tile += 3
    INX
    INX
    INX

+:
    JSR Object_Draw24x16Sprite ; Draw upper half of Big Bertha

    LSR _objects_sprite_v_visability  ; Shift the vertical visibility bits

; Sprite_RAM offset += 12 (3 sprites ahead)
    TYA
    CLC
    ADC #12
    TAY

    PLA
    TAX

    LDA Temp_Var3
    BMI +                       ; If vertically flipped, jump to +

; Otherwise, starting tile += 3
    INX
    INX
    INX

+

; Sprite Y += 16 (lower half of Big Bertha)
    LDA #16
    CLC
    ADC _object_sprite_y
    STA _object_sprite_y
    JSR Object_Draw24x16Sprite ; Draw lower half of Big Bertha

    LDX object_index         ; X = object slot index
    RTS