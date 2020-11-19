; A method to make a goomba
; param Temp_Var1: The x position for the goomba
; param Temp_Var2: The y position for the goomba

_position_lo_x = Temp_Var1
_position_hi_x = Temp_Var2
_position_lo_y = Temp_Var3
_position_hi_y = Temp_Var4
_velocity_x = Temp_Var5
_velocity_y = Temp_Var6
_enemy_id = Temp_Var7
_player_horizontal_difference = Temp_Var8
_palette = Temp_Var9

goomba_flip_bits:    .byte SPR_HFLIP, $00

prepare_new_enemy:
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

    JSR Level_ObjCalcXDiffs
    STY _player_horizontal_difference

    LDA goomba_flip_bits, y         ; Set the flipped bit dependent if the player is the left or right
    STA Objects_FlipBits, x

    LDA _enemy_id
    STA objects_ids, x              ; Treat this as a goomba

    LDA _palette                    ; Use the correct palette
    STA objects_sprite_attributes, x

    LDA #$40
    STA Objects_Timer4, x

    LDA #$10
    STA objects_no_collide_timer, x

    LDA _velocity_y
    STA objects_y_velocity, x

    LDA _velocity_x
    STA objects_x_velocity, x

    LDX object_index                ; Restore object index
    RTS
