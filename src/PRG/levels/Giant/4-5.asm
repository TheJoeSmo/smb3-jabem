; Original address was $B72C
; 4-5
    .word W405_BonusL   ; Alternate level layout
    .word W405_BonusO   ; Alternate object layout
    .byte LEVEL1_SIZE_08 | LEVEL1_YSTART_170
    .byte LEVEL2_BGPAL_00 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18 | LEVEL2_UNUSEDFLAG
    .byte LEVEL3_TILESET_01 | LEVEL3_VSCROLL_LOCKLOW | LEVEL3_PIPENOTEXIT
    .byte 11 & %00011111 | LEVEL4_INITACT_NOTHING
    .byte LEVEL5_BGM_OVERWORLD | LEVEL5_TIME_300

    .byte $17, $0E, $64, $17, $1A, $20, $15, $10, $63, $13, $12, $62, $11, $14, $60, $15
    .byte $18, $40, $15, $03, $05, $19, $00, $74, $11, $08, $10, $19, $0C, $79, $15, $22
    .byte $83, $19, $22, $7D, $11, $26, $10, $15, $28, $05, $57, $2C, $31, $16, $2F, $05
    .byte $34, $2F, $22, $34, $30, $00, $56, $33, $32, $34, $35, $22, $16, $36, $05, $55
    .byte $3A, $33, $57, $42, $30, $38, $42, $41, $30, $43, $82, $12, $44, $10, $18, $47
    .byte $82, $39, $4C, $41, $19, $50, $7F, $36, $51, $A2, $25, $56, $40, $09, $57, $10
    .byte $57, $55, $31, $56, $56, $32, $2F, $56, $0C, $23, $57, $C2, $22, $57, $41, $16
    .byte $59, $05, $58, $5D, $30, $53, $5C, $35, $36, $5B, $0E, $15, $60, $83, $36, $65
    .byte $42, $54, $66, $31, $57, $6A, $31, $36, $6D, $42, $19, $6F, $70, $51, $64, $52
    .byte $51, $69, $52, $53, $64, $52, $55, $69, $52, $19, $73, $76, $15, $73, $83, $16
    .byte $79, $05, $54, $79, $34, $11, $7A, $10, $77, $7C, $61, $20, $7E, $41, $01, $7E
    .byte $50, $03, $7E, $50, $05, $7E, $50, $07, $7E, $50, $09, $7E, $50, $0B, $7E, $50
    .byte $0D, $7E, $50, $0F, $7E, $50, $11, $7E, $50, $13, $7E, $50, $15, $7E, $50, $17
    .byte $7E, $50, $46, $5A, $52, $48, $5E, $50, $49, $5F, $50, $4A, $60, $50, $4C, $62
    .byte $50, $4D, $63, $50, $4E, $64, $50, $53, $69, $52, $57, $6D, $52, $E5, $61, $50
    .byte $06, $06, $10, $06, $10, $10, $08, $1C, $10, $04, $2A, $10, $06, $3A, $10, $08
    .byte $46, $10, $FF
