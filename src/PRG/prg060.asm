
	; Music_RestH_LUT is indexed by (Music_RestH_Base + Music_RestH_Off + [0 to 15])
	; * Music_RestH_Base is always divisible by $10, Music_RestH_Off is $00 or $10
	;
	; * Offset (0 to 15) comes from the lower 4 bits of $80+ values
	;   (The upper 4 bits set a patch value, unrelated)
	;
	; * Result is a "rest" (in ticks) for the pause between events
	;
	; * Obviously that means a song is "optimized" by selecting the best set, and
	;   must have a correct row +$10 if it plans on being "low time warning compatible"
Music_RestH_LUT:
Music_RestH_LUT00:
	.byte $08, $08, $0B, $0A, $10, $18, $15, $16, $20, $30, $40, $60, $80, $01, $1F, $00 ; $00 - $0F
Music_RestH_LUT10:
	.byte $07, $08, $0A, $0A, $0F, $16, $14, $14, $1E, $2D, $3C, $5A, $78, $05, $00, $00 ; $10 - $1F
Music_RestH_LUT20:
	.byte $07, $07, $09, $0A, $0E, $15, $13, $12, $1C, $2A, $38, $54, $70, $01, $04, $00 ; $20 - $2F
Music_RestH_LUT30:
	.byte $06, $06, $08, $08, $0C, $12, $10, $10, $18, $24, $30, $48, $60, $04, $02, $16 ; $30 - $3F
Music_RestH_LUT40:
	.byte $05, $05, $07, $06, $0A, $0F, $0D, $0E, $14, $1E, $28, $3C, $50, $03, $01, $13 ; $40 - $4F
Music_RestH_LUT50:
	.byte $04, $05, $06, $06, $09, $0D, $0C, $0C, $12, $1B, $24, $36, $48, $1E, $03, $00 ; $50 - $5F
Music_RestH_LUT60:
	.byte $04, $04, $05, $06, $08, $0C, $0B, $0A, $10, $18, $20, $30, $40, $00, $00, $00 ; $60 - $6F
Music_RestH_LUT70:
	.byte $03, $04, $05, $04, $07, $0A, $09, $0A, $0E, $15, $1C, $2A, $38, $0B, $00, $00 ; $70 - $7F
Music_RestH_LUT80:
	.byte $03, $03, $04, $04, $06, $09, $08, $08, $0C, $12, $18, $24, $30, $02, $00, $00 ; $80 - $8F
Music_RestH_LUT90:
	.byte $02, $02, $03, $02, $04, $06, $05, $06, $08, $0C, $10, $18, $20		     ; $90 - $9C


M12ASegData1A:
	.byte $D8, $68, $60, $60, $5A, $50, $4C, $68, $60, $60, $5A, $50, $4C, $68, $60, $60
	.byte $5A, $50, $4C

M12ASegData17:
	.byte $00
M12ASegData1A_Sq1:
	.byte $D4, $7E, $D8, $64, $5E, $56, $56, $48, $50, $64, $5E, $56, $56, $48, $50, $64
	.byte $5E, $56, $56, $48, $50
M12ASegData1A_Tri:
	.byte $DC, $30, $DA, $3E, $DC, $3A, $D8, $2A, $2E, $DC, $30, $DA, $7E

M12ASegData24:
	.byte $8E, $4C, $4A, $48, $5E, $5C, $5A, $58, $56, $54, $52, $50, $4E, $4C, $4A, $48
	.byte $46, $44, $42, $40, $3E, $3C, $3A, $38, $36, $34, $32, $30, $46, $44, $42, $40
	.byte $3E, $3C, $3A, $38, $36, $34, $32, $30, $2E, $2C, $2A, $28, $26, $24, $22, $20
	.byte $1E, $1C, $1A, $18, $2E, $2C, $2A, $28, $26, $24, $22, $20, $1E, $1C, $1A, $18
	.byte $16, $14, $12, $10, $0E, $0C, $0A, $08, $06, $88, $04, $00, $80, $4C, $4A, $48
	.byte $5E, $5C, $5A, $58, $56, $54, $52, $50, $4E, $4C, $4A, $48, $46, $44, $42, $40
	.byte $3E, $3C, $3A, $38, $36, $34, $32, $30, $2E, $2C, $2A, $28, $26, $88, $12
M12ASegData24_Tri:
	.byte $8E, $4C, $4A, $48, $5E, $5C, $5A, $58, $56, $54, $52, $50, $4E, $4C, $4A, $48
	.byte $46, $44, $42, $40, $3E, $3C, $3A, $38, $36, $34, $32, $30, $46, $44, $42, $40
	.byte $3E, $3C, $3A, $38, $36, $34, $32, $30, $2E, $2C, $2A, $28, $26, $24, $22, $20
	.byte $1E, $1C, $1A, $18, $2E, $2C, $2A, $28, $26, $24, $22, $20, $1E, $1C, $1A, $18
	.byte $16, $14, $12, $10, $0E, $0C, $0A, $08, $06, $88, $1C
M12ASegData24_Dpcm:
	.byte $82, $09, $09, $09, $09, $00

M12ASegData03:
	.byte $C4, $4C, $50, $C9, $64, $C0, $62, $60, $CA, $5E, $00, $C0, $7E, $C4, $4C, $50
	.byte $C9, $64, $C0, $62, $60, $CA, $5E

M12ASegData00:
	.byte $D8, $7E, $D4, $6E, $6C, $6A, $D8, $66, $68, $D4, $58, $5A, $D8, $60, $D4, $5A
	.byte $60, $64, $00, $D9, $30, $3E, $D8, $48, $D9, $3A, $D4, $48, $D8, $48, $3A

M12ASegData01:
	.byte $D8, $7E, $D4, $6E, $6C, $6A, $D8, $66, $68, $78, $D4, $78, $DA, $78, $00, $D9
	.byte $30, $38, $D4, $3E, $D8, $48, $6E, $D4, $6E, $D8, $6E, $3E

M12ASegData02:
	.byte $D8, $7E, $D9, $66, $D9, $64, $DA, $60, $7E, $00, $D8, $30, $D9, $40, $44, $48
	.byte $D4, $3E, $D8, $3E, $30

M12ASegData16:
	.byte $94, $48, $4C, $50, $98, $52, $C4, $56, $5A, $5E, $98, $60, $7E, $9A, $48, $00
	.byte $94, $42, $46, $48, $98, $4C, $C4, $50, $52, $56, $98, $50, $7E, $9A, $38
M12ASegData16_Tri:
	.byte $94, $3A, $7E, $7E, $88, $34, $84, $34, $3E, $3E, $98, $30, $7E, $9A, $30
M12ASegData16_Nse:
	.byte $94, $02, $02, $02, $02, $01, $02, $02, $02, $98, $06, $01, $9A, $01
M12ASegData16_Dpcm:
	.byte $94, $05, $05, $05, $05, $7E, $05, $05, $05, $9C, $05, $7E

M12ASegData04:
	.byte $C8, $3E, $CA, $56, $C8, $3E, $40, $CA, $58, $C8, $5C, $56, $CA, $3E, $C8, $56
	.byte $52, $CA, $40, $C4, $44, $C0, $42, $40, $00, $C8, $38, $CA, $50, $C8, $38, $3A
	.byte $CA, $52, $C8, $56, $50, $CA, $38, $C8, $50, $4A, $CA, $3A, $C8, $3A
M12ASegData04_Tri:
	.byte $94, $30, $3E, $3E, $48, $48, $50, $50, $56, $32, $40, $40, $4A, $4A, $52, $52
	.byte $58, $30, $3E, $3E, $48, $48, $50, $50, $56, $32, $40, $40, $4A, $4A, $52, $52
	.byte $58

M12ASegData12:
	.byte $98, $48, $48, $48, $94, $7E, $48, $7E, $99, $48, $98, $48, $48, $46, $46, $46
	.byte $94, $7E, $46, $7E, $99, $46, $98, $46, $46, $00, $98, $3A, $3A, $3A, $94, $34
	.byte $98, $3A, $3A, $94, $34, $3A, $34, $98, $3A, $38, $38, $38, $94, $30, $98, $38
	.byte $38, $94, $30, $38, $30, $98, $38
M12ASegData12_Tri:
	.byte $9A, $34, $99, $42, $4C, $98, $7E, $42, $4C, $9A, $30, $99, $3E, $48, $98, $7E
	.byte $3E, $48
M12ASegData12_Nse:
	.byte $98, $02, $94, $02, $02, $00
M12ASegData12_Dpcm:
	.byte $9A, $05, $99, $05, $05, $98, $7E, $05, $05, $00

M12ASegData15:
	.byte $B4, $7E, $B8, $7E, $B4, $48, $3E, $48, $B9, $4E, $B4, $52, $52, $52, $BC, $56
	.byte $00, $B4, $7E, $B8, $7E, $B4, $38, $30, $38, $B9, $3E, $B4, $42, $42, $42, $BC
	.byte $46
M12ASegData15_Tri:
	.byte $B4, $7E, $B8, $7E, $B4, $3E, $38, $3E, $B9, $44, $B4, $48, $48, $48, $BC
M12ASegData15_Dpcm:
	.byte $4C, $B0, $0F, $0F, $B8, $0F, $B8, $0E, $B4, $0E, $B8, $0E, $B4, $0E, $0E, $0E
	.byte $0E, $B0, $0E, $0F, $0E, $0F, $0E, $0F, $0E, $0F, $0E, $0F, $B9, $0E

M12ASegData18:
	.byte $94, $50, $50, $50, $98, $5E, $94, $5A, $54, $4C, $98, $56, $94, $7E, $32, $34
	.byte $26, $00, $94, $3E, $3E, $3E, $98, $4C, $94, $48, $42, $3C, $98, $46, $7E, $7E
M12ASegData18_Tri:
	.byte $94, $42, $7E, $7E, $98, $34, $94, $34, $34, $3C, $3E, $7E, $7E, $32, $34, $26

M12ASegData13:
	.byte $B4, $38, $4C, $7E, $4C, $4C, $7E, $3A, $4E, $7E, $4E, $4E, $7E, $3C, $50, $7E
	.byte $50, $50, $7E, $52, $7E, $BC, $52, $00, $B4, $20, $B8, $40, $B4, $40, $B8, $40
	.byte $B4, $22, $B8, $42, $B4, $42, $B8, $42, $B4, $24, $B8, $44, $B4, $44, $B8, $44
	.byte $B4, $46, $7E, $BC, $46
M12ASegData13_Tri:
	.byte $B4, $46, $5E, $7E, $5E, $5E, $7E, $48, $60, $7E, $60, $60, $7E, $4A, $62, $7E
	.byte $62, $62, $7E, $3E, $7E, $BC, $3E

M12ASegData14:
	.byte $B8, $7E, $98, $7E, $92, $50, $7E, $50, $7E, $7E, $4C, $7E, $4C, $7E, $9B, $48
	.byte $00, $00, $9D, $44, $46, $48, $B4, $7E, $98, $7E, $92, $46, $7E, $46, $7E, $7E
	.byte $3A, $7E, $3A, $7E, $9B, $38
M12ASegData14_Tri:
	.byte $B8, $7E, $82, $3E, $7E, $3E, $98, $7E, $92, $7E, $7E, $3E, $7E, $3E, $7E, $9B
	.byte $30, $7E
M12ASegData14_Dpcm:
	.byte $B8, $7E, $98, $7E, $92, $05, $7E, $05, $7E, $7E, $05, $7E, $05, $7E, $98, $7E
	.byte $92, $7E, $7E, $08, $98, $09

M12ASegData19:
	.byte $B9, $50, $B4, $7E, $7E, $B0, $50, $50, $B4, $52, $50, $4C, $48, $3E, $48, $4C
	.byte $7E, $56, $B9, $56, $B4, $7E, $7E, $B0, $56, $56, $B4, $56, $4C, $56, $58, $4E
	.byte $58, $5C, $52, $5C, $BC, $60, $00, $B9, $3E, $B4, $7E, $7E, $B0, $3E, $3E, $B4
	.byte $42, $3E, $3A, $38, $30, $38, $3A, $7E, $46, $B9, $46, $B4, $7E, $7E, $B0, $46
	.byte $46, $B4, $46, $3E, $46, $48, $40, $48, $4C, $44, $4C, $BC, $50
M12ASegData19_Tri:
	.byte $B9, $48, $B4, $7E, $7E, $B0, $48, $48, $B4, $48, $48, $42, $3E, $38, $3E, $42
	.byte $7E, $4C, $B9, $4C, $B4, $7E, $7E, $B0, $4C, $4C, $B4, $4C, $46, $4C, $4E, $48
	.byte $4E, $52, $4C, $52, $BC, $56
M12ASegData19_Dpcm:
	.byte $B9, $0E, $7E, $84, $0E, $0E, $0E, $0F, $0F, $0F, $88, $0E, $84, $0E, $80, $0E
	.byte $0E, $0E, $0E, $0E, $0E, $89, $0E, $0F, $0F, $0F, $B0, $0F, $0F, $0F, $0F, $0F
	.byte $0F, $0F, $0F, $0F, $0F, $BA, $0F

M12ASegData05:
	.byte $9C, $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E, $00, $CA, $3E, $42, $46, $42, $4A
	.byte $4C, $50, $4A, $4C, $5A, $56, $C8, $4C, $4E, $CB, $50, $C8, $46, $CA, $42, $40
M12ASegData05_Tri:
	.byte $94, $30, $48, $26, $3E, $30, $48, $26, $3E, $30, $48, $26, $3E, $30, $48, $26
	.byte $3E, $34, $4C, $2A, $42, $34, $4C, $2A, $42, $34, $4C, $2A, $42, $34, $4C, $2A
	.byte $42, $2E, $46, $26, $3E, $2E, $46, $26, $3E, $2E, $46, $26, $3E, $2E, $46, $26
	.byte $3E, $30, $48, $26, $3E, $30, $48, $26, $3E, $2E, $46, $26, $3E, $2E, $46, $26
	.byte $3E
M12ASegData05_Nse:
	.byte $94, $02, $06, $00
M12ASegData05_Dpcm:
	.byte $98, $01, $02, $00

M12ASegData07:
	.byte $98, $7E, $28, $22, $7E, $98, $20, $94, $20, $22, $88, $7E, $7E, $00, $98, $7E
	.byte $1E, $18, $7E, $98, $16, $94, $16, $18, $88, $7E, $7E
M12ASegData07_Tri:
	.byte $A8, $3A, $84, $7E, $88, $3A, $A4, $30, $36, $38, $A8, $3A, $84, $7E, $88, $3A
	.byte $A4, $30, $36, $38
M12ASegData07_Nse:
	.byte $94, $04, $02, $00
M12ASegData07_Dpcm:
	.byte $94, $0A, $0B, $07, $07, $00

M12ASegData06:
	.byte $B6, $7E, $B2, $7E, $86, $30, $82, $30, $B2, $7E, $7E, $18, $88, $30, $8A, $7E
	.byte $B8, $7E, $86, $30, $82, $30, $B6, $7E, $B2, $7E, $86, $3A, $82, $3A, $B2, $7E
	.byte $7E, $22, $88, $3A, $8A, $7E, $B8, $7E, $86, $3A, $82, $3A, $00, $86, $7E, $82
	.byte $7E, $86, $20, $82, $20, $88, $7E, $20, $8A, $7E, $88, $7E, $86, $20, $82, $20
	.byte $86, $7E, $82, $7E, $86, $2A, $82, $2A, $82, $7E, $7E, $7E, $88, $2A, $8A, $7E
	.byte $88, $7E, $86, $2A, $82, $2A
M12ASegData06_Tri:
	.byte $94, $30, $30, $30, $30, $88, $38, $3E, $98, $7E, $82, $7E, $7E, $30, $98, $38
	.byte $98, $3E, $94, $3A, $3A, $3A, $3A, $88, $42, $48, $98, $7E, $82, $7E, $7E, $3A
	.byte $98, $42, $98, $48
M12ASegData06_Nse:
	.byte $98, $02, $92, $06, $01, $02, $00
M12ASegData06_Dpcm:
	.byte $98, $01, $03, $00

M12ASegData08:
	.byte $8D, $7E, $7E, $7E, $9A, $7E, $00
M12ASegData08_Dpcm:
	.byte $8D, $08, $08, $08, $98, $08, $08

M12ASegData0A:
	.byte $95, $7E, $8E, $7E, $8D, $4E, $84, $50, $7E, $7E, $88, $50, $84, $7E, $89, $7E
	.byte $84, $50, $85, $7E, $8E, $7E, $8D, $4E, $84, $50, $7E, $95, $7E, $8E, $7E, $8D
	.byte $50, $84, $52, $7E, $7E, $88, $52, $84, $7E, $89, $7E, $84, $52, $85, $7E, $8E
	.byte $7E, $8D, $50, $84, $52, $7E, $00, $CA, $46, $42, $40, $42, $48, $46, $44, $46
M12ASegData0A_Tri:
	.byte $99, $30, $84, $26, $89, $26, $84, $30, $99, $30, $84, $26, $89, $26, $84, $30
	.byte $99, $34, $84, $2A, $89, $2A, $84, $34, $99, $34, $84, $2A, $89, $2A, $84, $34
M12ASegData0A_Nse:
	.byte $94, $02, $02, $06, $02, $02, $06, $02, $02, $06, $02, $02, $06, $02, $02, $06
	.byte $02, $00
M12ASegData0A_Dpcm:
	.byte $98, $01, $84, $03, $01, $01, $88, $03, $84, $01, $99, $03, $84, $03, $88, $01
	.byte $84, $03, $01, $00

M12ASegData0B:
	.byte $95, $7E, $8E, $7E, $8D, $54, $84, $56, $7E, $7E, $88, $56, $84, $7E, $89, $7E
	.byte $84, $54, $85, $7E, $8E, $7E, $8D, $52, $84, $54, $7E, $95, $7E, $8E, $7E, $8D
	.byte $50, $84, $52, $7E, $7E, $88, $52, $84, $7E, $89, $7E, $84, $52, $85, $7E, $8E
	.byte $7E, $8D, $50, $84, $52, $7E, $00, $CA, $4C, $48, $46, $42, $48, $46, $42, $40
M12ASegData0B_Tri:
	.byte $99, $38, $84, $2E, $89, $2E, $84, $38, $99, $36, $84, $2A, $89, $2A, $84, $36
	.byte $99, $34, $84, $2A, $89, $2A, $84, $34, $2E, $7E, $88, $2E, $7E, $84, $7E, $2E
M12ASegData0B_Nse:
	.byte $94, $02, $02, $06, $02, $02, $06, $02, $02, $06, $02, $02, $06, $02, $02, $06
	.byte $02, $94, $02, $02, $06, $02, $02, $06, $02, $02, $98, $06, $89, $06, $8D, $02
	.byte $02, $02, $88, $06, $00
M12ASegData0B_Dpcm:
	.byte $98, $01, $84, $03, $01, $01, $88, $03, $84, $01, $99, $03, $84, $03, $88, $01
	.byte $84, $03, $01, $98, $01, $84, $03, $01, $01, $88, $03, $84, $01, $98, $01, $89
	.byte $7E, $84, $01, $88, $02

M12ASegData0D:
	.byte $9C, $7E, $7E, $00, $9C, $7E, $7E
M12ASegData0D_Tri:
	.byte $98, $30, $32, $34, $36, $38, $26, $2C, $2E
M12ASegData0D_Nse:
	.byte $98, $02, $92, $02, $01, $02, $00

M12ASegData0E:
	.byte $8A, $22, $2E, $2C, $20, $28, $34, $32, $24, $00, $8A, $18, $24, $22, $14, $1E
	.byte $2A, $28, $1A
M12ASegData0E_Tri:
	.byte $8A, $3A, $46, $44, $38, $40, $4C, $4A, $3C
M12ASegData0E_Dpcm:
	.byte $94, $01, $90, $01, $01, $7E, $01, $01, $01, $00

M12ASegData09:
	.byte $98, $3E, $3E, $42, $42, $46, $92, $46, $7E, $42, $7E, $7E, $40, $98, $42, $3E
	.byte $3E, $42, $92, $42, $7E, $46, $9C, $7E, $98, $48, $48, $4C, $4C, $50, $92, $50
	.byte $7E, $4C, $7E, $7E, $4A, $98, $4C, $48, $48, $4C, $92, $4C, $7E, $50, $9C, $7E
	.byte $00, $92, $38, $7E, $30, $98, $38, $92, $38, $7E, $30, $98, $38, $92, $38, $7E
	.byte $30, $38, $7E, $38, $7E, $7E, $36, $98, $38, $92, $38, $7E, $30, $98, $38, $92
	.byte $38, $7E, $30, $38, $7E, $38, $9C, $7E, $92, $42, $7E, $3A, $98, $42, $92, $42
	.byte $7E, $3A, $98, $42, $92, $42, $7E, $3A, $42, $7E, $42, $7E, $7E, $40, $98, $42
	.byte $92, $42, $7E, $3A, $98, $42, $92, $42, $7E, $3A, $42, $7E, $42, $9C, $7E
M12ASegData09_Tri:
	.byte $88, $30, $30, $82, $7E, $7E, $30, $2A, $7E, $30, $88, $7E, $34, $38, $7E, $88
	.byte $30, $30, $82, $7E, $7E, $30, $2A, $7E, $30, $8C, $7E, $88, $3A, $3A, $82, $7E
	.byte $7E, $3A, $34, $7E, $3A, $88, $7E, $3E, $42, $7E, $88, $3A, $3A, $82, $7E, $7E
	.byte $3A, $34, $7E, $3A, $8C, $7E
M12ASegData09_Nse:
	.byte $98, $02, $92, $02, $01, $02, $98, $02, $92, $02, $01, $02, $98, $02, $92, $02
	.byte $01, $02, $02, $01, $06, $02, $01, $02, $00
M12ASegData09_Dpcm:
	.byte $8A, $01, $8D, $02, $82, $01, $8A, $01, $8D, $02, $82, $01, $8A, $01, $88, $02
	.byte $86, $05, $82, $05, $8A, $01, $8D, $02, $82, $01, $00

M12ASegData0C:
	.byte $98, $3E, $3E, $42, $42, $46, $92, $46, $7E, $42, $7E, $7E, $40, $98, $42, $92
	.byte $48, $7E, $48, $9A, $7E, $92, $48, $7E, $48, $9C, $7E, $00, $92, $38, $7E, $30
	.byte $98, $38, $92, $38, $7E, $30, $98, $38, $92, $38, $7E, $30, $38, $7E, $38, $7E
	.byte $7E, $36, $98, $38, $92, $38, $7E, $38, $9A, $7E, $92, $38, $7E, $38, $8C, $7E
M12ASegData0C_Tri:
	.byte $88, $30, $30, $82, $7E, $7E, $30, $2A, $7E, $30, $88, $7E, $34, $38, $7E, $82
	.byte $30, $7E, $30, $8A, $7E, $82, $30, $7E, $30, $8C, $7E
M12ASegData0C_Nse:
	.byte $98, $02, $92, $02, $01, $02, $98, $02, $92, $02, $01, $02, $98, $02, $92, $02
	.byte $01, $02, $02, $01, $06, $02, $01, $02, $8A, $01, $86, $01, $82, $01, $06, $01
	.byte $06, $02, $01, $02, $88, $02, $8A, $06, $00
M12ASegData0C_Dpcm:
	.byte $8A, $01, $8D, $02, $82, $01, $8A, $01, $8D, $02, $82, $01, $88, $01, $86, $01
	.byte $82, $01, $86, $02, $88, $01, $82, $01, $8A, $01, $86, $0A, $88, $0B, $82, $01
	.byte $00

M12ASegData0F:
	.byte $D8, $6E, $5E, $66, $5E, $6E, $5E, $66, $6A, $70, $60, $68, $60, $70, $60, $68 ; $B0C9 - $B0D8
	.byte $6C, $00, $D4, $7E, $D8, $56, $56, $56, $56, $56, $56, $56, $56, $58, $58, $58 ; $B0D9 - $B0E8
	.byte $58, $58, $58, $58, $58
M12ASegData0F_Tri:
	.byte $9C, $7E, $7E, $7E, $7E
M12ASegData0F_Nse:
	.byte $9C, $01, $89, $01, $8D, $02, $02, $02, $8A, $01, $00
M12ASegData0F_Dpcm:
	.byte $8A, $7E, $01, $89, $01, $8D, $03, $03, $03, $8A, $7E, $00

M12ASegData10:
	.byte $D2, $7E, $7E, $30, $36, $7E, $DB, $3A, $D2, $7E, $7E, $7E, $DD, $3A, $3C, $D2
	.byte $3A, $7E, $36, $30, $7E, $2C, $00, $D2, $7E, $7E, $26, $2C, $7E, $DB, $30, $D2
	.byte $7E, $7E, $7E, $DD, $30, $32, $D2, $30, $7E, $2C, $26, $7E, $22

M12ASegData11:
	.byte $D2, $7E, $7E
	.byte $30, $36, $7E, $DB, $3A, $D2, $7E, $7E, $7E, $92, $48, $4C, $7E, $98, $4E, $82
	.byte $7E, $00, $D2, $7E, $7E, $26, $2C, $7E, $DB, $30, $D2, $7E, $7E, $7E, $92, $3E
	.byte $42, $7E, $98, $44, $82, $7E
M12ASegData10_Tri:
M12ASegData11_Tri:
	.byte $D2, $7E, $7E, $30, $36, $7E, $D9, $3A, $7E, $D2, $7E, $8C, $7E, $7E
M12ASegData10_Nse:
M12ASegData11_Nse:
	.byte $88, $02, $82, $06, $01, $02, $88, $02, $82, $06, $01, $02, $88, $02, $82, $06
	.byte $01, $02, $88, $02, $82, $06, $01, $02, $00
M12ASegData10_Dpcm:
M12ASegData11_Dpcm:
	.byte $88, $01, $86, $7E, $88, $7E, $82, $7E, $88, $03, $7E, $03, $7E, $03, $00

M2BSegData14:
	.byte $98, $56, $56, $90, $54, $56, $94, $7E, $98, $56, $5A, $5A, $90, $58, $5A, $94
	.byte $7E, $98, $5A, $00, $98, $5C, $5C, $90, $5A, $5C, $94, $7E, $98, $5C, $60, $60
	.byte $90, $5E, $60, $94, $7E, $98, $60
M2BSegData14_Tri:
	.byte $94, $4E, $5C, $66, $5C, $4E, $5C, $66, $5C, $52, $60, $6A, $60, $52, $60, $6A
	.byte $60

M2BSegData15:
	.byte $98, $5C, $5C, $90, $5A, $5C, $94, $7E, $98, $5C, $60, $60, $90, $5E, $60, $94
	.byte $7E, $98, $60, $00, $98, $62, $62, $90, $60, $62, $94, $7E, $98, $62, $66, $66
	.byte $90, $64, $66, $94, $7E, $98, $66
M2BSegData15_Tri:
	.byte $94, $54, $62, $6C, $62, $54, $62, $6C, $62, $58, $66, $70, $66, $58, $66, $70
	.byte $66
M2BSegData14_Dpcm:
M2BSegData15_Dpcm:
	.byte $98, $05, $00

M2BSegData1A:
	.byte $DC, $7E, $7E, $7E, $7E, $D4, $18, $30, $12, $2A, $14, $2C, $D8, $7E, $DC, $7E
	.byte $D4, $18, $30, $12, $2A, $14, $2C, $D8, $7E, $DC, $7E, $D4, $0A, $22, $04, $1C
	.byte $06, $1E, $D8, $7E, $DC, $7E, $D4, $0A, $22, $04, $1C, $06, $1E, $DC, $7E, $D2
	.byte $1E, $1C, $1A, $D8, $18, $1E, $1C, $10, $0E, $1A, $D2, $18, $24, $22, $20, $2C
	.byte $2A, $D6, $28, $1E, $16, $14, $12, $10, $DC, $7E, $00
M2BSegData1A_Tri:
	.byte $8C, $7E, $7E, $7E, $7E, $84, $30, $48, $2A, $42, $2C, $44, $88, $7E, $8C, $7E
	.byte $84, $30, $48, $2A, $42, $2C, $44, $88, $7E, $8C, $7E, $84, $22, $3A, $1C, $34
	.byte $1E, $36, $88, $7E, $8C, $7E, $84, $22, $3A, $1C, $34, $1E, $36, $8C, $7E, $82
	.byte $36, $34, $32, $88, $30, $36, $34, $28, $26, $32, $82, $30, $3C, $3A, $38, $44
	.byte $42, $86, $40, $36, $2E, $2C, $2A, $28, $8C, $7E
M2BSegData1A_Dpcm:
	.byte $8A, $01, $02, $84, $01, $01, $88, $01, $8A, $02, $8A, $01, $89, $02, $88, $01
	.byte $01, $84, $01, $88, $02, $84, $02, $02, $00
M2BSegData1A_Nse:
	.byte $84, $02, $00

M2BSegData09:
	.byte $9C, $7E, $7E, $BC, $30, $48, $46, $7E, $30, $48, $46, $7E, $00, $9C, $7E, $7E
	.byte $BC, $22, $3A, $38, $7E, $22, $3A, $38, $7E
M2BSegData09_Tri:
	.byte $8C, $7E, $7E, $BC, $30, $48, $46, $7E, $30, $48, $46, $7E, $8C, $7E, $7E, $00
M2BSegData09_Dpcm:
	.byte $88, $0F, $86, $0F, $82, $0F, $82, $0F, $0F, $0F, $88, $0F, $88, $0F, $82, $0F
	.byte $0F, $0F, $84, $0F, $0F, $82, $0F, $0F, $0F, $00

M2BSegData0A:
	.byte $E8, $32, $32, $E4, $32, $32, $E2, $32, $38, $38, $E8, $32, $32, $E4, $32, $32
	.byte $E2, $32, $38, $38, $E8, $3E, $3E, $E4, $3E, $3E, $E2, $3E, $44, $44, $E8, $3E
	.byte $3E, $E4, $3E, $3E, $E2, $3E, $44, $44, $00, $E8, $36, $36, $E4, $36, $36, $E2
	.byte $36, $3C, $3C, $E8, $36, $36, $E4, $36, $36, $E2, $36, $3C, $3C, $E8, $42, $42
	.byte $E4, $42, $42, $E2, $42, $48, $48, $E8, $42, $42, $E4, $42, $42, $E2, $42, $48
	.byte $48
M2BSegData0A_Tri:
	.byte $E4, $58, $7E, $58, $7E, $58, $58, $E2, $58, $5E, $5E, $E4, $58, $7E, $58, $7E
	.byte $58, $58, $E2, $58, $5E, $5E, $E4, $64, $7E, $64, $7E, $64, $64, $E2, $64, $6A
	.byte $6A, $E4, $64, $7E, $64, $7E, $64, $64, $E2, $64, $6A, $6A
M2BSegData0A_Nse:
	.byte $E8, $02, $02, $E4, $02, $02, $E2, $02, $02, $02, $00
M2BSegData0A_Dpcm:
	.byte $E8, $0F, $0F, $E4, $0F, $0F, $E2, $0F, $0F, $0F, $E8, $0F, $0F, $E4, $0F, $0F
	.byte $E2, $0F, $0F, $0F, $E8, $0E, $0E, $E4, $0E, $0E, $E2, $0E, $0E, $0E, $E8, $0E
	.byte $0E, $E4, $0E, $0E, $E2, $0E, $0E, $0E, $00

M2BSegData07:
	.byte $B4, $18, $2E, $BB, $2C, $E0, $7E, $2A, $28, $26, $E4, $24, $14, $EB, $7E, $00
	.byte $B4, $14, $2A, $BB, $28, $E0, $7E, $26, $24, $22, $E4, $20, $10, $EB, $7E
M2BSegData07_Tri:
	.byte $E4, $3A, $50, $EB, $4E, $E0, $7E, $4C, $4A, $48, $E4, $46, $36, $EB, $7E
M2BSegData07_Dpcm:
	.byte $EC, $7E, $EA, $7E, $E4, $0E, $EC, $0F, $E4, $7E, $00

M2BSegData08:
	.byte $BA, $7E, $BB, $26, $2E, $20, $2A, $EA, $7E, $00, $B8, $7E, $BB, $28, $18, $1A
	.byte $10, $B8, $7E, $EA, $7E
M2BSegData08_Tri:
	.byte $BB, $34, $46, $2C, $3A, $BA, $7E, $EA, $7E
M2BSegData08_Dpcm:
	.byte $BB, $7E, $7E, $7E, $7E, $E4, $0E, $EC, $0F, $EA, $7E

M12ASegData1B:
	.byte $D2, $56, $54, $56, $DA, $50, $D8, $52, $54, $DA, $56, $D8, $60, $D6, $68, $D2
	.byte $68, $D8, $64, $68, $6A, $5E, $DA, $64, $D8, $60, $00
	.byte $D8, $2E, $30, $7E, $34, $36, $38, $30, $42, $3E, $3A, $38, $34, $3A, $3E, $26
	.byte $30

M12ASegData1C:
	.byte $D6, $68, $D2, $68, $DA, $68, $D9, $5E, $D4, $64, $D8, $64, $D2, $7E, $60, $5E
	.byte $D8, $60, $D6, $6A, $D2, $6A, $DA, $6A, $D9, $60, $D4, $64, $DA, $68, $D8, $64
	.byte $00
	.byte $D8, $2E, $38, $3C, $40, $46, $42, $40, $42, $3E, $3A, $3E, $40, $3A, $3E, $26
	.byte $3A

M12ASegData1D:
	.byte $A4, $3E, $7E, $94, $56, $98, $52, $94, $4C, $46, $42, $3E, $7E, $3E, $7E, $AA
	.byte $7E, $00, $A4, $2E, $7E, $94, $46, $98, $42, $94, $3A, $34, $30, $2E, $7E, $2E
	.byte $7E, $AA, $7E
M12ASegData1D_Tri:
	.byte $A4, $3E, $7E, $56, $98, $52, $94, $4C, $46, $42, $3E, $7E, $3E, $7E, $AA, $7E
M12ASegData1D_Nse:
	.byte $94, $02, $90, $02, $02, $94, $02, $02, $02, $02, $02, $02, $00
M12ASegData1D_Dpcm:
	.byte $A4, $06, $A0, $05, $05, $A4, $05, $05, $7E, $05, $05, $05, $06, $7E, $06, $8D
	.byte $7E, $7E, $08, $88, $08, $8D, $09, $09, $09, $94, $08

M12ASegData1E:
	.byte $98, $7E, $94, $50, $52, $50, $4C, $48, $46, $98, $4C, $94, $4C, $9A, $42, $94
	.byte $7E, $98, $7E, $94, $46, $48, $46, $42, $3E, $3A, $98, $38, $94, $38, $9A, $3E
	.byte $94, $7E, $00, $98, $7E, $94, $48, $4C, $48, $46, $42, $3E, $98, $42, $94, $42
	.byte $9A, $3A, $94, $7E, $98, $7E, $94, $3E, $42, $3E, $3A, $38, $34, $98, $30, $94
	.byte $30, $9A, $38, $94, $7E
M12ASegData1E_Tri:
	.byte $99, $30, $98, $38, $94, $38, $98, $3E, $99, $3A, $98, $42, $94, $42, $98, $48
	.byte $99, $3E, $98, $46, $94, $46, $98, $4C, $99, $30, $98, $38, $94, $38, $98, $3E
M12ASegData1E_Nse:
	.byte $94, $02, $90, $02, $02, $94, $02, $02, $02, $02, $02, $02, $00
M12ASegData1E_Dpcm:
	.byte $A4, $01, $A0, $05, $05, $A4, $05, $01, $01, $06, $07, $01, $00

M12ASegData1F:
	.byte $98, $7E, $94, $3A, $3E, $40, $48, $44, $40, $99, $3E, $9A, $38, $94, $7E, $00
	.byte $98, $7E, $94, $30, $34, $52, $58, $56, $52, $99, $50, $9A, $48, $94, $7E
M12ASegData1F_Tri:
	.byte $98, $3A, $94, $3A, $98, $40, $94, $40, $98, $48, $30, $94, $30, $98, $38, $94
	.byte $38, $98, $3E
M12ASegData1F_Nse:
	.byte $94, $02, $90, $02, $02, $94, $02, $02, $02, $02, $02, $02, $00
M12ASegData1F_Dpcm:
	.byte $A4, $01, $A0, $05, $05, $A4, $05, $01, $01, $06, $07, $01, $00

M12ASegData20:
	.byte $98, $7E, $94, $3A, $3E, $40, $48, $44, $40, $99, $3E, $9A, $48, $94, $7E, $98
	.byte $7E, $94, $42, $40, $42, $46, $48, $42, $9B, $4C, $C8, $3E, $00, $98, $7E, $94
	.byte $30, $34, $52, $58, $56, $52, $99, $50, $9A, $56, $94, $7E, $98, $7E, $94, $3A
	.byte $38, $3A, $3E, $42, $3A, $9C, $46, $C8, $2E
M12ASegData20_Tri:
	.byte $98, $3A, $94, $3A, $98, $40, $94, $40, $98, $48, $38, $94, $38, $98, $3E, $94
	.byte $3E, $98, $48, $36, $94, $36, $98, $3E, $94, $3E, $98, $48, $34, $94, $34, $98
	.byte $3E, $94, $3E, $98, $3E
M12ASegData20_Nse:
	.byte $94, $02, $90, $02, $02, $94, $02, $02, $02, $02, $02, $02, $00
M12ASegData20_Dpcm:
	.byte $A4, $01, $A0, $05, $05, $A4, $05, $01, $01, $06, $07, $01, $00

M12ASegData21:
	.byte $CA, $50, $C4, $7E, $4C, $50, $52, $CB, $56, $C8, $5A, $CA, $56, $C4, $7E, $52
	.byte $50, $52, $CB, $48, $C8, $56, $CA, $52, $C4, $7E, $50, $4C, $50, $CA, $48, $C6
	.byte $46, $48, $50, $00, $C4, $30, $90, $56, $50, $94, $48, $3E, $C4, $7E, $46, $30
	.byte $34, $C4, $34, $90, $52, $4C, $94, $46, $3E, $C8, $7E, $3A, $C4, $38, $90, $52
	.byte $4C, $94, $44, $3E, $C4, $7E, $34, $30, $34, $C4, $42, $90, $52, $48, $94, $42
	.byte $3A, $C8, $7E, $34, $C4, $30, $90, $52, $48, $94, $40, $3A, $C4, $7E, $30, $2E
	.byte $30, $C4, $3E, $90, $50, $48, $94, $3E, $38, $C6, $26, $2A, $30
M12ASegData21_Tri:
	.byte $C8, $48, $C4, $3E, $C8, $48, $C4, $3E, $C8, $48, $46, $C4, $3E, $C8, $46, $C4
	.byte $3E, $C8, $46, $44, $C4, $3E, $C8, $44, $C4, $3E, $C8, $44, $42, $C4, $3A, $C8
	.byte $42, $C4, $3A, $C8, $42, $40, $C4, $3A, $C8, $40, $C4, $3A, $C8, $40, $3E, $C4
	.byte $38, $C8, $3E, $C4, $38, $C8, $3E
M12ASegData21_Nse:
	.byte $C4, $02, $C0, $02, $02, $C4, $02, $02, $02, $02, $02, $02, $00
M12ASegData21_Dpcm:
	.byte $A4, $01, $A0, $06, $06, $A4, $06, $07, $01, $06, $07, $06, $00

M12ASegData22:
	.byte $CA, $4C, $C4, $7E, $48, $46, $48, $CB, $4C, $C8, $3E, $00, $C4, $2A, $90, $54
	.byte $48, $94, $42, $3C, $C4, $7E, $2A, $28, $2A, $C4, $2E, $90, $52, $4C, $94, $46
	.byte $3E, $C8, $7E, $3E
M12ASegData22_Tri:
	.byte $C8, $3C, $C4, $34, $C8, $3C, $C4, $34, $C8, $3C, $3E, $C4, $34, $C8, $3E, $C4
	.byte $34, $C8, $3E
M12ASegData22_Nse:
	.byte $C4, $02, $C0, $02, $02, $C4, $02, $02, $02, $02, $02, $02, $00
M12ASegData22_Dpcm:
	.byte $A4, $01, $A0, $06, $06, $A4, $06, $07, $01, $06, $07, $06, $00

M12ASegData23:
	.byte $CA, $4C, $C4, $7E, $48, $46, $48, $94, $56, $7E, $56, $7E, $AA, $7E, $00, $C4
	.byte $2A, $90, $54, $48, $94, $42, $3C, $C4, $7E, $2A, $28, $2A, $94, $2E, $7E, $2E
	.byte $7E, $AA, $7E
M12ASegData23_Tri:
	.byte $C8, $3C, $C4, $34, $C8, $3C, $C4, $34, $C8, $3C, $3E, $C4, $34, $C8, $3E, $C4
	.byte $34, $C8, $3E, $94, $3E, $7E, $3E, $7E, $AA, $7E
M12ASegData23_Nse:
	.byte $C4, $02, $C0, $02, $02, $C4, $02, $02, $02, $02, $02, $02, $00
M12ASegData23_Dpcm:
	.byte $A4, $06, $A0, $06, $06, $A4, $06, $07, $01, $06, $07, $07, $06, $7E, $06, $8D
	.byte $7E, $7E, $08, $88, $08, $8D, $09, $09, $09, $94, $08

M2BSegData0E:
	.byte $A2, $26, $7E, $92, $3E, $56, $7E, $98, $52, $92, $42, $44, $7E, $98, $46, $93
	.byte $7E, $7E, $7E, $56, $98, $6E, $7E, $00, $A2, $16, $7E, $92, $2E, $46, $7E, $98
	.byte $42, $92, $30, $32, $7E, $98, $34, $9C, $7E
M2BSegData0E_Tri:
	.byte $A2, $3E, $7E, $92, $3E, $4C, $7E, $98, $48, $92, $3A, $3C, $7E, $98, $3E, $93
	.byte $7E, $7E, $7E, $7E, $98, $7E, $3E, $00
M2BSegData0E_Nse:
	.byte $98, $01, $02, $00
M2BSegData0E_Dpcm:
	.byte $9A, $01, $05, $88, $05, $86, $7E, $8D, $08, $08, $98, $08, $96, $08, $92, $05

M2BSegData0F:
	.byte $92, $7E, $7E, $50, $7E, $93, $7E, $4E, $98, $50, $92, $7E, $7E, $93, $4E, $98
	.byte $50, $92, $42, $7E, $98, $48, $7E, $93, $7E, $00

M2BSegData10:
	.byte $92, $7E, $7E, $50, $7E, $93, $7E, $4E, $96, $50, $50, $97, $48, $98, $4C, $9B
	.byte $7E, $00, $92, $7E, $7E, $3E, $7E, $93, $7E, $3E, $98, $3E, $92, $7E, $7E, $93
	.byte $3E, $98, $3E, $92, $3A, $7E, $98, $38, $7E, $93, $7E, $92, $7E, $7E, $3E, $7E
	.byte $93, $7E, $3E, $96, $3E, $3E, $97, $3E, $9C, $3A
M2BSegData0F_Tri:
	.byte $98, $7E, $96, $7E, $92, $30, $98, $38, $98, $3E, $98, $7E, $96, $7E, $92, $3A
	.byte $96, $2A, $92, $2A, $98, $30
M2BSegData10_Tri:
	.byte $98, $7E, $96, $7E, $92, $30, $98, $38, $98, $3E, $98, $7E, $96, $7E, $92, $26
	.byte $96, $2E, $92, $2E, $98, $34

M2BSegData11:
	.byte $92, $7E, $7E, $50, $7E, $93, $7E, $50, $96, $50, $3E, $97, $42, $98, $48, $9B
	.byte $7E, $00, $92, $7E, $7E, $3E, $7E, $93, $7E, $3E, $96, $3E, $34, $97, $34, $9C
	.byte $38
M2BSegData11_Tri:
	.byte $98, $7E, $96, $7E, $92, $30, $98, $38, $98, $26, $98, $30, $9B, $7E
M2BSegData0F_Nse:
M2BSegData10_Nse:
M2BSegData11_Nse:
	.byte $98, $02, $92, $02, $01, $93, $02, $98, $01, $92, $02, $01, $93, $02, $00
M2BSegData0F_Dpcm:
M2BSegData10_Dpcm:
	.byte $98, $7E, $96, $05, $92, $05, $98, $7E, $08, $00
M2BSegData11_Dpcm:
	.byte $98, $7E, $96, $05, $92, $05, $98, $7E, $98, $08, $98, $7E, $96, $05, $92, $05
	.byte $92, $09, $9D, $09, $94, $09, $98, $08, $00

M2BSegData12:
	.byte $92, $42, $7E, $42, $48, $7E, $48, $93, $7E, $7E, $6A, $98, $5A, $92, $3E, $7E
	.byte $3E, $48, $7E, $48, $93, $7E, $7E, $68, $98, $56, $92, $3A, $7E, $3A, $42, $7E
	.byte $42, $93, $7E, $7E, $64, $98, $52, $92, $38, $7E, $38, $3E, $7E, $3E, $93, $7E
	.byte $7E, $60, $98, $50, $00, $92, $3A, $7E, $3A, $42, $7E, $42, $93, $7E, $7E, $3A
	.byte $98, $2A, $92, $38, $7E, $38, $3E, $7E, $3E, $93, $7E, $7E, $38, $98, $26, $92
	.byte $34, $7E, $34, $3A, $7E, $3A, $93, $7E, $7E, $34, $98, $22, $92, $30, $7E, $30
	.byte $38, $7E, $38, $93, $7E, $7E, $30, $98, $20
M2BSegData12_Tri:
	.byte $98, $3A, $3A, $7E, $7E, $38, $38, $7E, $7E, $34, $34, $7E, $7E, $30, $30, $7E
	.byte $7E
M2BSegData12_Nse:
	.byte $98, $02, $92, $02, $01, $93, $02, $98, $01, $92, $02, $01, $93, $02, $00
M2BSegData12_Dpcm:
	.byte $98, $7E, $96, $05, $92, $05, $98, $7E, $08, $00

M2BSegData13:
	.byte $92, $42, $7E, $42, $48, $7E, $48, $93, $7E, $7E, $6A, $98, $5A, $92, $42, $7E
	.byte $42, $48, $7E, $48, $93, $7E, $7E, $6C, $98, $5A, $92, $46, $7E, $46, $48, $7E
	.byte $48, $4A, $7E, $4A, $4C, $93, $7E, $4C, $7E, $7E, $56, $98, $7E, $9A, $56, $00
	.byte $92, $3A, $7E, $3A, $42, $7E, $42, $93, $7E, $7E, $3A, $98, $2A, $92, $3C, $7E
	.byte $3C, $42, $7E, $42, $93, $7E, $7E, $3C, $98, $2A, $92, $34, $7E, $34, $38, $7E
	.byte $38, $3A, $7E, $3A, $3C, $93, $7E, $3C, $7E, $7E, $46, $98, $7E, $9A, $46
M2BSegData13_Tri:
	.byte $98, $3A, $3A, $9A, $7E, $98, $3C, $3C, $9A, $7E, $98, $3E, $42, $44, $46, $3E
	.byte $7E, $9A, $2E
M2BSegData13_Nse:
	.byte $98, $02, $92, $02, $01, $93, $02, $98, $01, $92, $02, $01, $93, $02, $00
M2BSegData13_Dpcm:
	.byte $98, $7E, $96, $05, $92, $05, $98, $7E, $08, $98, $7E, $96, $05, $92, $05, $98
	.byte $7E, $08, $98, $7E, $96, $05, $92, $05, $98, $7E, $08, $98, $7E, $96, $7E, $9D
	.byte $08, $08, $98, $08, $08

M2BSegData1E:
	.byte $84, $38, $7E, $38, $38, $7E, $38, $38, $38, $3E, $7E, $3E, $7E, $00, $84, $2A
	.byte $7E, $2A, $2A, $7E, $2A, $2A, $2A, $30, $7E, $30, $7E
M2BSegData1E_Tri:
	.byte $84, $5E, $7E, $5E, $5E, $7E, $5E, $5E, $5E, $64, $7E, $64, $7E
M2BSegData1E_Nse:
	.byte $84, $06, $01, $04, $06, $01, $04, $04, $04, $04, $01, $04, $01

M2BSegData1F:
	.byte $84, $12, $7E, $20, $2A, $7E, $20, $2A, $20, $12, $7E, $20, $2A, $7E, $20, $2A
	.byte $20, $14, $7E, $22, $2C, $7E, $22, $2C, $22, $14, $7E, $22, $2C, $7E, $22, $2C
	.byte $22, $00, $84, $12, $7E, $20, $38, $7E, $20, $38, $20, $12, $7E, $20, $38, $7E
	.byte $20, $38, $20, $14, $7E, $22, $3A, $7E, $22, $3A, $22, $14, $7E, $22, $3A, $7E
	.byte $22, $3A, $22
M2BSegData1F_Tri:
	.byte $9C, $7E, $7E, $7E, $7E
M2BSegData1F_Tri21:
	.byte $8C, $7E, $7E, $7E, $8A, $7E, $84, $7E, $50, $5A, $68
M2BSegData1F_Tri22:
	.byte $8C, $5E, $8A, $7E, $84, $7E, $7E, $60, $64, $8C, $6E, $8A, $7E, $84, $7E, $6A
	.byte $68, $64
M2BSegData1F_Tri23:
	.byte $84, $68, $5E, $9C, $68, $7E, $7E, $8B, $7E
M2BSegData1F_Nse:
M2BSegData1F_Nse21:
M2BSegData1F_Nse22:
M2BSegData1F_Nse23:
	.byte $94, $04, $04, $06, $04, $04, $04, $04, $06, $00
M2BSegData1F_Dpcm:
M2BSegData1F_Dpcm21:
M2BSegData1F_Dpcm22:
M2BSegData1F_Dpcm23:
	.byte $94, $06, $06, $05, $06, $06, $07, $0C, $05, $00

M2BSegData16:
	.byte $88, $30, $36, $3A, $8C, $3C, $00, $88, $20, $26, $2A, $8C, $32
M2BSegData16_Tri:
	.byte $88, $26, $2C, $30, $8C, $3C
M2BSegData16_Dpcm:
	.byte $9B, $7E, $90, $0E, $0F, $0E, $0F, $0E, $0F, $0E, $0F, $0E, $0F, $90, $0E, $0F
	.byte $0E, $0F, $0E, $0F, $0E, $0F, $0E, $0F

M2BSegData17:
	.byte $8C, $7E, $00

M2BSegData18:
	.byte $94, $36, $38, $36, $38, $34, $30, $2A, $98, $30, $94, $30, $90, $36, $34, $98
	.byte $30, $94, $2A, $98, $30, $00, $94, $2E, $30, $2E, $30, $2A, $2A, $22, $98, $20
	.byte $94, $20, $94, $24, $98, $20, $99, $7E
M2BSegData17_Tri:
M2BSegData18_Tri:
	.byte $84, $30, $30, $36, $38, $3A, $3A, $40, $42, $30, $30, $36, $38, $3A, $3A, $42
	.byte $48
M2BSegData17_Nse:
M2BSegData18_Nse:
	.byte $84, $02, $02, $06, $02, $00
M2BSegData17_Dpcm:
M2BSegData18_Dpcm:
	.byte $98, $01, $94, $02, $01, $00

M2BSegData19:
	.byte $94, $3E, $3E, $42, $44, $46, $3E, $7E, $3E, $3A, $3A, $38, $3A, $7E, $30, $34
	.byte $30, $36, $36, $34, $36, $34, $30, $2A, $30, $7E, $3E, $3E, $3E, $3E, $3E, $3E
	.byte $3E, $00, $94, $2E, $2E, $30, $32, $34, $2E, $7E, $2E, $2A, $2A, $26, $2A, $7E
	.byte $22, $22, $22, $26, $26, $26, $26, $22, $22, $22, $20, $7E, $2E, $2E, $2E, $30
	.byte $30, $34, $34
M2BSegData19_Tri:
	.byte $84, $3E, $3E, $44, $46, $4C, $4C, $50, $56, $3A, $3A, $40, $42, $48, $48, $4C
	.byte $52, $30, $30, $36, $38, $3A, $3A, $40, $42, $7E, $3E, $3E, $3E, $42, $42, $46
	.byte $46
M2BSegData19_Nse:
	.byte $84, $02, $02, $06, $02, $02, $02, $06, $02, $02, $02, $06, $02, $02, $02, $06
	.byte $02, $02, $02, $06, $02, $02, $02, $06, $02, $02, $02, $02, $02, $02, $02, $02
	.byte $02
M2BSegData19_Dpcm:
	.byte $98, $01, $94, $02, $01, $98, $01, $94, $02, $01, $98, $01, $94, $02, $01, $98
	.byte $01, $94, $02, $01, $98, $01, $94, $02, $01, $98, $01, $94, $02, $01, $98, $01
	.byte $94, $02, $01, $01, $06, $88, $07

M2BSegData00:
	.byte $94, $6C, $6E, $6E, $6E, $54, $56, $56, $56, $3C, $3E, $3C, $3E, $98, $3E, $26
	.byte $00, $94, $66, $68, $68, $68, $4E, $50, $50, $50, $36, $38, $36, $38, $98, $26
	.byte $0E
M2BSegData00_Tri:
	.byte $9A, $7E, $7E, $7E, $98, $7E, $3E

M2BSegData01:
	.byte $94, $54, $56, $56, $54, $56, $56, $54, $56, $5A, $58, $5A, $98, $5C, $FF, $5E
	.byte $94, $5A, $56, $52, $00, $94, $4E, $50, $50, $4E, $50, $50, $4E, $50, $52, $50
	.byte $52, $98, $54, $FF, $56, $94, $52, $50, $4C, $CA, $48, $46, $42, $3E, $48, $46
	.byte $42, $46
M2BSegData01_Tri:
	.byte $94, $30, $48, $30, $48, $38, $50, $38, $50, $3A, $52, $3A, $3E, $9A, $7E

M2BSegData02:
	.byte $94, $54, $56, $56, $54, $56, $56, $54, $56, $5A, $58, $5A, $5E, $7E, $64, $98
	.byte $6E, $00, $94, $4E, $50, $50, $4E, $50, $50, $4E, $50, $52, $50, $52, $56, $7E
	.byte $60, $98, $6C
M2BSegData02_Tri:
	.byte $94, $30, $48, $30, $48, $38, $50, $38, $50, $3A, $52, $3A, $3E, $9A, $7E
M2BSegData01_Nse:
M2BSegData02_Nse:
	.byte $94, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $06, $9A, $01, $00
M2BSegData01_Dpcm:
M2BSegData02_Dpcm:
	.byte $94, $01, $98, $05, $05, $05, $05, $94, $05, $05, $99, $05, $98, $05, $00

M2BSegData03:
	.byte $94, $50, $52, $56, $98, $5A, $C4, $56, $52, $50, $94, $4C, $50, $52, $98, $56
	.byte $C4, $52, $50, $4C, $94, $48, $4C, $50, $98, $52, $C4, $50, $4C, $46, $99, $48
	.byte $98, $28, $94, $2C, $26, $48, $46, $44, $00, $94, $48, $4C, $50, $98, $52, $C4
	.byte $50, $4C, $48, $94, $46, $48, $4C, $98, $50, $C4, $4C, $48, $46, $94, $42, $46
	.byte $48, $98, $4C, $C4, $48, $46, $3A, $94, $38, $7E, $7E, $98, $3A, $94, $3E, $38
	.byte $99, $7E
M2BSegData03_Tri:
	.byte $94, $42, $7E, $7E, $88, $34, $84, $34, $34, $34, $94, $3E, $7E, $7E, $88, $30
	.byte $84, $30, $30, $30, $94, $3A, $7E, $7E, $88, $34, $84, $34, $3E, $3E, $94, $30
	.byte $7E, $7E, $98, $32, $94, $36, $30, $99, $7E
M2BSegData03_Nse:
	.byte $94, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $06, $9A, $01, $00
M2BSegData03_Dpcm:
	.byte $94, $05, $05, $05, $98, $05, $94, $05, $05, $05, $94, $05, $05, $05, $98, $05
	.byte $94, $05, $05, $05, $94, $05, $05, $05, $98, $05, $94, $05, $05, $05, $94, $05
	.byte $05, $99, $05, $98, $05, $00

M2BSegData04:
	.byte $C4, $42, $46, $48, $C8, $5A, $94, $5A, $98, $72, $C4, $3E, $42, $46, $C8, $56
	.byte $94, $56, $98, $6E, $00, $C4, $3A, $3E, $42, $48, $46, $4C, $48, $42, $38, $3A
	.byte $3E, $46, $42, $48, $46, $3E
M2BSegData04_Tri:
	.byte $98, $3A, $84, $48, $89, $52, $88, $7E, $98, $38, $84, $48, $89, $50, $88, $7E

M2BSegData05:
	.byte $C4, $3A, $3E, $42, $C8, $52, $94, $52, $98, $6A, $C4, $38, $36, $38, $50, $98
	.byte $52, $56, $00, $C4, $34, $38, $3A, $42, $40, $46, $42, $3A, $30, $2E, $30, $3E
	.byte $98, $42, $46
M2BSegData05_Tri:
	.byte $98, $34, $84, $42, $89, $4C, $98, $7E, $30, $84, $3E, $48, $C8, $34, $38
M2BSegData04_Nse:
M2BSegData05_Nse:
	.byte $99, $06, $06, $88, $01, $00
M2BSegData04_Dpcm:
M2BSegData05_Dpcm:
	.byte $99, $05, $05, $84, $05, $05, $00

M2BSegData06:
	.byte $C4, $3A, $3E, $42, $C8, $52, $C4, $50, $52, $54, $94, $56, $3E, $3E, $3E, $3E
	.byte $26, $26, $26, $24, $26, $24, $26, $28, $2A, $2C, $2E, $00, $C4, $34, $38, $3A
	.byte $42, $40, $46, $48, $4A, $94, $4C, $34, $34, $34, $34, $1C, $1C, $1C, $1E, $20
	.byte $1E, $20, $22, $24, $26, $28
M2BSegData06_Tri:
	.byte $98, $34, $84, $42, $89, $4C, $98, $7E, $3E, $7E, $26, $7E, $3E, $26, $26, $2E
M2BSegData06_Nse:
	.byte $99, $06, $06, $88, $01, $98, $02, $02, $02, $02, $94, $02, $02, $02, $02, $02
	.byte $02, $02, $02
M2BSegData06_Dpcm:
	.byte $99, $05, $05, $84, $05, $05, $98, $05, $05, $05, $05, $94, $05, $05, $05, $05
	.byte $05, $05, $06, $07, $00

M2BSegData0B:
	.byte $C4, $3E, $56, $52, $C8, $4C, $C4, $3E, $42, $44, $CC, $46, $00, $C4, $2E, $46
	.byte $42, $C8, $3A, $C4, $2E, $30, $32, $CC, $34
M2BSegData0B_Tri:
	.byte $CC, $7E, $C8, $3E, $42, $44, $46

M2BSegData0C:
	.byte $C4, $3E, $48, $56, $C8, $54, $5A, $C4, $54, $56, $50, $48, $C8, $3E, $42, $C4
	.byte $3C, $3E, $48, $56, $C8, $54, $5A, $C4, $54, $CC, $56, $00, $C4, $38, $3E, $50
	.byte $C8, $4E, $52, $C4, $4E, $50, $48, $3E, $C8, $38, $3C, $C4, $36, $38, $3E, $50
	.byte $C8, $4E, $52, $C4, $4E, $CC, $50
M2BSegData0C_Tri:
	.byte $C4, $30, $56, $60, $56, $3E, $56, $60, $56, $30, $56, $60, $56, $3E, $56, $60
	.byte $56, $30, $56, $60, $56, $3E, $56, $60, $56, $30, $56, $60, $56, $3E, $56, $60
	.byte $56

M2BSegData0D:
	.byte $C4, $42, $48, $5A, $C8, $58, $5E, $C4, $5A, $56, $3E, $5A, $C8, $56, $7E, $C4
	.byte $7E, $3E, $44, $56, $C8, $52, $56, $C4, $4E, $CA, $5A, $56, $00, $C4, $3A, $42
	.byte $52, $C8, $50, $56, $C4, $52, $50, $38, $52, $C8, $50, $7E, $C4, $7E, $36, $3E
	.byte $4E, $C8, $4C, $4E, $C4, $44, $CA, $52, $46
M2BSegData0D_Tri:
	.byte $C4, $3A, $52, $60, $52, $3A, $52, $60, $52, $38, $50, $5E, $50, $38, $50, $5E
	.byte $50, $36, $4E, $5C, $4E, $36, $4E, $5C, $4E, $3A, $52, $60, $52, $3E, $56, $64
	.byte $56
M2BSegData0C_Nse:
M2BSegData0D_Nse:
	.byte $94, $06, $02, $02, $02, $00
M2BSegData0C_Dpcm:
M2BSegData0D_Dpcm:
	.byte $94, $7E, $05, $05, $05, $00

M2BSegData1B:
	.byte $84, $42, $40, $3E, $8C, $3C, $84, $7E, $08, $20, $34, $20, $34, $32, $7E, $20
	.byte $30, $7E, $20, $30, $7E, $2E, $30, $32, $00, $84, $30, $2E, $2C, $8C, $2A, $84
	.byte $7E, $08, $20, $2A, $20, $2A, $28, $7E, $20, $26, $7E, $20, $26, $7E, $24, $26
	.byte $28
M2BSegData1B_Tri:
	.byte $84, $3C, $3A, $38, $8C, $36, $84, $7E, $9C, $7E, $7E
M2BSegData1B_Nse:
	.byte $94, $02, $01, $02, $02, $01, $02, $02, $02, $02, $02, $02, $02, $02, $02, $06
	.byte $02, $02, $02, $06, $02, $02, $02, $06, $02, $02, $02, $06, $02
M2BSegData1B_Dpcm:
	.byte $94, $01, $7E, $01, $01, $7E, $01, $01, $01, $01, $01, $01, $01, $98, $01, $94
	.byte $02, $01, $98, $01, $94, $02, $01, $98, $08, $94, $02, $08, $98, $01, $94, $08
	.byte $01

M2BSegData1C:
	.byte $84, $08, $20, $34, $20, $34, $32, $7E, $20, $30, $7E, $20, $30, $7E, $2E, $30
	.byte $32, $84, $08, $20, $34, $20, $34, $32, $7E, $20, $30, $7E, $20, $30, $7E, $2E
	.byte $30, $32, $00, $84, $08, $20, $2A, $20, $2A, $28, $7E, $20, $26, $7E, $20, $26
	.byte $7E, $24, $26, $28, $84, $08, $20, $2A, $20, $2A, $28, $7E, $20, $26, $7E, $20
	.byte $26, $7E, $24, $26, $28
M2BSegData1C_Tri:
	.byte $98, $7E, $9C, $5E, $98, $7E, $90, $5C, $5A, $94, $56, $5A, $50, $7E, $56, $7E
	.byte $4C, $7E, $46, $4C, $50, $9C, $7E
M2BSegData1C_Nse:
	.byte $94, $02, $02, $06, $02, $00
M2BSegData1C_Dpcm:
	.byte $98, $01, $94, $02, $01, $00

M2BSegData1D:
	.byte $84, $0A, $22, $36, $22, $36, $34, $7E, $22, $32, $7E, $22, $32, $7E, $30, $32
	.byte $34, $84, $0A, $22, $36, $22, $36, $34, $7E, $22, $32, $7E, $22, $32, $7E, $30
	.byte $32, $34, $00, $84, $0A, $22, $2C, $22, $2C, $2A, $7E, $22, $28, $7E, $22, $28
	.byte $7E, $26, $28, $2A, $84, $0A, $22, $2C, $22, $2C, $2A, $7E, $22, $28, $7E, $22
	.byte $28, $7E, $26, $28, $2A
M2BSegData1D_Tri:
	.byte $98, $7E, $9C, $60, $98, $7E, $94, $7E, $5E, $60, $6A, $66, $5E, $5C, $58, $90
	.byte $5C, $5E, $5C, $58, $94, $5C, $52, $58, $52, $4E, $52, $7E, $7E, $7E, $7E
M2BSegData1D_Nse:
	.byte $94, $02, $02, $06, $02, $00
M2BSegData1D_Dpcm:
	.byte $98, $01, $94, $02, $01, $00
