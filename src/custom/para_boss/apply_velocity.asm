para_boss_apply_velocity:
    JSR Object_ApplyXVel                ; Apply X Velocity
    JMP Object_ApplyYVel_NoLimit        ; Apply Y velocity and don't come back!