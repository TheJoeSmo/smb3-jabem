; A method to make a goomba
; param Temp_Var1: The x position for the goomba
; param Temp_Var2: The y position for the goomba

_position_lo_x = Temp_Var1
_position_hi_x = Temp_Var2
_position_lo_y = Temp_Var3
_position_hi_y = Temp_Var4
_player_horizontal_difference = Temp_Var5

goomba_flip_bits:    .byte SPR_HFLIP, $00

prepare_new_goomba:
    JSR prepare_new_object_or_abort

    ; Set position
    LDA _position_lo_x
    STA objects_lo_x, x
    LDA _position_hi_x
    STA objects_hi_x, x
    LDA _position_lo_y
    STA objects_lo_y, x
    LDA _position_hi_y
    STA objects_hi_y, x

    JSR determine_horizontal_player_relativity
    STY _player_horizontal_difference

    LDA goomba_flip_bits, y         ; Set the flipped bit dependent if the player is the left or right
    STA Objects_FlipBits, x

    LDA #OBJ_GOOMBA
    STA objects_ids, x              ; Treat this as a goomba

    LDA #SPR_PAL3                   ; Use the correct palette
    STA objects_sprite_attributes, x

    LDA #$28
    STA Objects_Var1, x             ; Have velocity

    LDA #$ff
    STA objects_sprite_visability, x

    LDX object_index                ; Restore object index
    RTS
