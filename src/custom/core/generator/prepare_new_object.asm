; Prepares a new object by initializing all of the many object
; variables to zero...

; X = index of on-screen object
prepare_new_object:

    ; Clear various object variables
    LDA #$00
    STA objects_v1, x
    STA objects_v2, x
    STA object_sprite_x, x
    STA objects_timer, x
    STA objects_no_collide_timer, x
    STA objects_x_velocity, x
    STA objects_y_velocity, x
    STA objects_attributes, x
    STA objects_animation_frame, x
    STA objects_flashing_counter, x
    STA objects_detection_flags, x

    CPX #$06
    BGE +  ; If using slot index >= 6, jump to + (skip variables available only to slots 0 to 5)

    ; Clear some more variables (object slots 0 to 5 ONLY)
    STA objects_enforce_page_chg, x
    STA objects_splash_disable_cnt, x
    STA objects_quicksand_death_cnt, x
    STA objects_in_water, x

+
    CPX #$05
    BGE +  ; If using slot index >= 5, jump to + (skip variables available only to slots 0 to 4)

    ; Clear even more variables (object slots 0 to 4 [major objects] ONLY!!)
    STA objects_player_info, x
    STA objects_timer_4, x
    STA objects_timer_3, x
    STA objects_slope_position, x
    STA objects_v7, x
    STA objects_v6, x
    STA objects_v5, x
    STA objects_v4, x
    STA objects_v3, x
    STA objects_target_x, x
    STA objects_target_y, x
    STA objects_giant_handling, x
    STA objects_offscreen_test, x
    STA objects_health, x
    STA objects_enforce_page_chg, x
    STA objects_v10, x
    STA objects_v11, x
    STA objects_v12, x
    STA objects_v13, x
    STA objects_v14, x

+
    RTS      ; Return