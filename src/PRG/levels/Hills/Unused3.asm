; Original address was $B0DD
; "Unused Level 3"
    .word Unused3_CHL   ; Alternate level layout
    .word Unused3_CHO   ; Alternate object layout
    .byte LEVEL1_SIZE_13 | LEVEL1_YSTART_180
    .byte LEVEL2_BGPAL_02 | LEVEL2_OBJPAL_08 | LEVEL2_XSTART_18
    .byte LEVEL3_TILESET_13 | LEVEL3_VSCROLL_LOCKLOW | LEVEL3_PIPENOTEXIT
    .byte 19 & %00011111 | LEVEL4_INITACT_NOTHING
    .byte LEVEL5_BGM_ATHLETIC | LEVEL5_TIME_300

    .byte $40, $00, $0E, $9A, $00, $80, $19, $56, $03, $0A, $99, $0D, $D2, $37, $0C, $12
    .byte $33, $0C, $10, $34, $0C, $10, $35, $0C, $10, $36, $0C, $10, $B1, $0B, $32, $9A
    .byte $1A, $50, $0C, $99, $11, $D2, $99, $15, $D1, $99, $18, $D1, $33, $12, $10, $34
    .byte $12, $10, $35, $12, $10, $36, $12, $10, $37, $10, $12, $33, $15, $11, $33, $18
    .byte $11, $37, $15, $11, $37, $18, $11, $35, $17, $02, $75, $22, $64, $95, $24, $85
    .byte $01, $15, $26, $50, $76, $26, $E4, $15, $2A, $60, $16, $2A, $E4, $95, $2B, $85
    .byte $01, $95, $2D, $55, $01, $75, $2D, $50, $76, $2E, $E0, $97, $2F, $53, $01, $77
    .byte $2F, $50, $27, $22, $80, $39, $27, $60, $39, $29, $60, $55, $28, $07, $E2, $67
    .byte $70, $78, $30, $E0, $99, $31, $51, $01, $79, $31, $50, $7A, $32, $E0, $9A, $38
    .byte $50, $01, $17, $39, $62, $97, $3A, $83, $08, $1A, $37, $E0, $34, $3B, $26, $34
    .byte $3C, $03, $B5, $34, $32, $17, $43, $52, $9A, $46, $80, $01, $1A, $47, $04, $9A
    .byte $4C, $50, $01, $18, $4D, $61, $98, $4E, $52, $05, $1A, $4C, $E0, $B0, $4A, $32
    .byte $9A, $40, $50, $05, $75, $52, $62, $95, $54, $85, $03, $15, $58, $04, $76, $58
    .byte $E4, $18, $5C, $01, $18, $5D, $04, $19, $5C, $E1, $79, $5D, $E1, $1A, $5F, $E0
    .byte $94, $55, $D2, $32, $55, $20, $32, $56, $03, $9A, $60, $50, $01, $17, $61, $62
    .byte $96, $62, $84, $05, $76, $62, $60, $16, $68, $04, $77, $68, $E3, $53, $64, $0B
    .byte $33, $6C, $20, $33, $6D, $03, $36, $6C, $42, $96, $7E, $54, $02, $16, $7E, $E4
    .byte $20, $7E, $D1, $AD, $75, $32, $33, $73, $21, $37, $71, $44, $3A, $78, $41, $13
    .byte $80, $62, $93, $81, $87, $02, $9A, $84, $50, $0C, $73, $84, $56, $92, $81, $D2
    .byte $7A, $91, $E0, $9A, $93, $50, $0B, $1A, $93, $E0, $74, $9D, $65, $94, $9F, $86
    .byte $02, $93, $9F, $D2, $37, $92, $0C, $26, $91, $80, $27, $91, $80, $28, $91, $80
    .byte $29, $91, $80, $2A, $91, $80, $2B, $91, $80, $2C, $91, $80, $2D, $91, $80, $2E
    .byte $91, $80, $26, $93, $80, $27, $93, $80, $28, $93, $80, $29, $93, $80, $2A, $93
    .byte $80, $2B, $93, $80, $2C, $93, $80, $2D, $93, $80, $2E, $93, $80, $99, $A2, $51
    .byte $09, $74, $A2, $54, $79, $AB, $E1, $9A, $AF, $80, $20, $1A, $AF, $01, $99, $B1
    .byte $D2, $99, $B1, $D1, $99, $B8, $D1, $B3, $B3, $32, $40, $BA, $09, $FF
