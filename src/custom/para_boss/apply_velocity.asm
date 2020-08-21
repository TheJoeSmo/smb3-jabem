para_boss_apply_velocity:
    JSR Object_Move

    LDA objects_detection_flags, x
    AND #object_hit_ceiling
    BEQ +

; Bounce off ceiling
    LDA #$01
    STA objects_y_velocity, x

+
    LDA objects_detection_flags, x
    AND #object_hit_ground
    BEQ +

    JSR Object_HitGround     ; Align to floor

+
    LDA objects_detection_flags, x
    AND #object_hit_wall
    BEQ +  ; If Paragoomba did not hit wall, jump to +

    JSR Object_FlipFace  ; Turn around
    LDA #-$02
    STA objects_x_velocity, x


+
    RTS      ; Return
