; Original address was $B457
; Airship run, jump
    .word W6AirshipL    ; Alternate level layout
    .word W6AirshipO    ; Alternate object layout
    .byte LEVEL1_SIZE_03 | LEVEL1_YSTART_170
    .byte LEVEL2_BGPAL_04 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
    .byte LEVEL3_TILESET_10 | LEVEL3_VSCROLL_LOCKED | LEVEL3_PIPENOTEXIT
    .byte 10 & %00011111 | LEVEL4_INITACT_AIRSHIP
    .byte LEVEL5_BGM_AIRSHIP | LEVEL5_TIME_300

    .byte $79, $00, $3F, $79, $10, $3F, $40, $10, $0E, $79, $20, $3F, $E1, $31, $70, $FF
