

; Temp_Var1 = Object sprite Y
; Temp_Var2 = Object sprite X
; Temp_Var3 = Object's LR flag
; Temp_Var4 = Object's attributes
; Temp_Var5 = Objects_SprVVis
; Temp_Var6 = Object's starting tiles index (and -> 'X')
; Temp_Var7 = Object's Sprite_RAM offset (and -> 'Y')
; Temp_Var8 = Objects_SprHVis

_object_sprite_y = Temp_Var1
_object_sprite_x = Temp_Var2
_objects_attributes = Temp_Var3
_objects_sprite_attributes = Temp_Var4
_objects_sprite_v_visability = Temp_Var5
_objects_sprite_visability = Temp_Var8
__objects_sprite_visability = Temp_Var10

draw_24x16_object:
    LDA _objects_sprite_v_visability  ; Check sprite vertical visibility
    LSR A
    BCS +rts ; If this sprite is off-screen, jump to +rts (RTS)

    LDA _objects_sprite_visability  ; Checking horizontal sprite visibility
    ASL A       ; Left shift flags value
    STA __objects_sprite_visability ; -> Temp_Var10

; Set y data (0, 0, 0)
    LDA _object_sprite_y
    BCS +                       ; If horizontally off screen, jump
    STA sprite_data_y, y
+
    BIT __objects_sprite_visability
    BMI +                       ; If this sprite is off-screen, jump
    STA sprite_data_y+4, y
+
    BVS +                       ; If horizontally off screen, jump
    STA sprite_data_y+8, y
+

; Set x data (0, 8, 16)
    LDA _object_sprite_x
    STA sprite_data_x, y
    CLC
    ADC #$08
    STA sprite_data_x+4, y
    CLC
    ADC #$08
    STA sprite_data_x+8, y

; Set each of the sprite's patterns
    LDA ObjectGroup_PatternSets, x
    STA sprite_data_graphic, y
    LDA ObjectGroup_PatternSets+1, x
    STA sprite_data_graphic+4, y
    LDA ObjectGroup_PatternSets+2, x
    STA sprite_data_graphic+8, y

    ; Set each sprite's attributes
    LDA _objects_attributes
    ORA _objects_sprite_attributes       ; Combine attributes
    STA sprite_data_attributes, y
    STA sprite_data_attributes+4, y
    STA sprite_data_attributes+8, y

    BIT _objects_attributes
    BVC +rts  ; If sprite is not horizontally flipped return

    ; Swap end sprites patterns
    LDA sprite_data_graphic, y
    PHA
    LDA sprite_data_graphic+8, y
    STA sprite_data_graphic, y
    PLA
    STA sprite_data_graphic+8, y

+rts:
    RTS      ; Return