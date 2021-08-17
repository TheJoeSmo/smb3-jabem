;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; ALADDIN
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

AladdinHedr2:	MusSeg 59, Aladdin_R2, Aladdin_2, $11, Aladdin_Tri2, Aladdin_Nse2, $0000
AladdinHedr3:	MusSeg 59, Aladdin_R3, Aladdin_3, $14, Aladdin_Tri3, Aladdin_Nse3, $0000
AladdinHedr4:	MusSeg 59, Aladdin_R4, Aladdin_4, $0e, Aladdin_Tri4, Aladdin_Nse4, $0000
AladdinHedr5:	MusSeg 59, Aladdin_R5, Aladdin_5, $72, Aladdin_Tri5, Aladdin_Nse5, $0000
AladdinHedr6:	MusSeg 59, Aladdin_R6, Aladdin_6, $2a, Aladdin_Tri6, Aladdin_Nse6, $0000

Aladdin_R1:
	.byte $01, $0E, $07, $19, $02, $12, $1C, $3F, $0D, $38, $37, $03, $04
Aladdin_R2:
	.byte $07, $0E, $1C, $14, $0D, $0F, $06, $03, $04
Aladdin_R3:
	.byte $07, $0E, $15, $05, $0C, $0F, $06, $03, $04
Aladdin_R4:
	.byte $0E, $07, $12, $02, $01, $23, $06, $13, $71, $29, $03, $04, $15, $6F
Aladdin_R5:
	.byte $0E, $07, $15, $14, $01, $02, $0B, $0A, $03, $05, $38, $37, $04, $0F, $06
Aladdin_R6:
	.byte $07, $0E, $15, $2A, $1C, $06, $0D, $01, $02, $6F, $03, $04, $17, $1A, $62, $00

Aladdin_1:
	.byte $A0, $7E, $A1, $50, $A2, $7E, $A3, $50, $A4, $7E, $A5, $7E, $50, $A6, $52, $A9
	.byte $50, $AA, $7E, $00
	.byte $A0, $7E, $A1, $42, $A2, $7E, $A3, $42, $A4, $7E, $A5, $7E, $42, $A6, $44, $A7
	.byte $42, $A2, $46, $48, $4C, $50, $52, $A8, $56
Aladdin_Tri1:
	.byte $A0, $7E, $A1, $42, $A2, $7E, $A7, $42, $A0, $4A, $48, $46, $A4, $44, $A0, $42
	.byte $A4, $40, $3C, $3A, $38, $A0, $4A, $48, $46, $A4, $44, $A0, $42, $A4, $40, $3C
	.byte $3A, $38, $A9, $42, $AA, $7E
Aladdin_Nse1:
	.byte $A0, $01, $A1, $06, $01, $AB, $06, $AC, $01, $AB, $06, $AC, $01, $AB, $06, $AC
	.byte $01, $AB, $06, $AC, $01, $AB, $06, $AC, $01, $A2, $06, $A1, $01, $A2, $06, $01
	.byte $06, $01, $AB, $06, $AC, $01, $AB, $06, $AC, $01, $AB, $06, $AC, $01, $AB, $06
	.byte $AC, $01, $AB, $06, $AC, $01, $AB, $06, $AC, $01, $AB, $06, $AC, $01, $AB, $06
	.byte $AC, $01, $AB, $06, $AC, $01, $AB, $06, $AC, $01, $AB, $06, $AC, $01, $AB, $06
	.byte $AC, $01, $AB, $06, $AC, $01, $A2, $06, $A8, $01, $00

Aladdin_2:
	.byte $80, $42, $81, $38, $80, $2A, $82, $38, $80, $36, $38, $30, $2A, $30, $83, $2E
	.byte $00
	.byte $80, $42, $81, $38, $80, $2A, $82, $38, $80, $36, $38, $30, $2A, $30, $83, $2E
Aladdin_Tri2:
	.byte $A1, $42, $7E, $38, $7E, $3A, $7E, $38, $A4, $7E
Aladdin_Nse2:
	.byte $A1, $06, $01, $A5, $06, $A6, $01, $A7, $06, $A8, $01, $A7, $06, $A8, $01, $A0
	.byte $06, $01, $A7, $06, $A8, $01, $A7, $06, $A8, $01, $A1, $06, $A6, $01, $00

Aladdin_3:
	.byte $80, $42, $81, $38, $80, $2A, $30, $34, $81, $30, $80, $38, $2A, $30, $3A, $82
	.byte $38, $83, $7E, $00
	.byte $80, $42, $81, $38, $80, $2A, $30, $34, $81, $30, $80, $38, $2A, $30, $3A, $82
	.byte $38, $83, $7E
Aladdin_Tri3:
	.byte $A1, $42, $7E, $38, $7E, $3A, $7E, $38, $A4, $7E
Aladdin_Nse3:
	.byte $A1, $06, $01, $A5, $06, $A6, $01, $A7, $06, $A8, $01, $A7, $06, $A8, $01, $A0
	.byte $06, $01, $A7, $06, $A8, $01, $A7, $06, $A8, $01, $A1, $06, $A3, $01, $00

Aladdin_4:
	.byte $A0, $3E, $3E, $3C, $3C, $3A, $3A, $A1, $7E, $A7, $38, $A8, $7E, $00
	.byte $A0, $3E, $3E, $3C, $3C, $3A, $3A, $A1, $7E, $A2, $38, $A3, $7E, $A4, $7E, $A1
	.byte $38, $2A, $30, $3A, $38, $2A, $30, $38, $A5, $7E, $A1, $30, $34, $A6, $36
Aladdin_Tri4:
	.byte $84, $58, $56, $54, $50, $4E, $83, $4C, $84, $4A, $46, $83, $44, $84, $42, $83
	.byte $40, $84, $58, $56, $54, $50, $4E, $83, $4C, $84, $4A, $46, $83, $44, $84, $42
	.byte $83, $40, $84, $58, $56, $54, $50, $4E, $83, $4C, $84, $4A, $46, $83, $44, $84
	.byte $42, $83, $40, $84, $58, $56, $54, $50, $4E, $83, $4C, $84, $4A, $46, $83, $44
	.byte $84, $42, $83, $40, $84, $58, $56, $54, $50, $4E, $83, $4C, $84, $4A, $46, $83
	.byte $44, $84, $42, $83, $40, $84, $58, $56, $54, $50, $4E, $83, $4C, $84, $4A, $46
	.byte $83, $44, $84, $42, $83, $40, $84, $58, $56, $54, $50, $4E, $83, $4C, $84, $58
	.byte $56, $54, $50, $4E, $83, $4C, $84, $4A, $46, $83, $44, $84, $42, $83, $40, $84
	.byte $3E, $86, $3C, $81, $38, $7E, $38, $80, $7E, $81, $30, $80, $34, $38, $89, $7E
Aladdin_Nse4:
	.byte $A1, $06, $01, $06, $01, $06, $01, $06, $01, $06, $01, $06, $01, $AA, $06, $AB
	.byte $01, $AC, $06, $AD, $01, $00

Aladdin_5:
	.byte $84, $60, $64, $85, $66, $86, $68, $84, $66, $81, $68, $84, $66, $81, $68, $84
	.byte $66, $81, $68, $84, $66, $81, $68, $84, $66, $81, $68, $84, $66, $5E, $62, $85
	.byte $64, $86, $66, $84, $64, $81, $66, $84, $64, $81, $66, $84, $64, $81, $66, $84
	.byte $64, $81, $66, $84, $64, $81, $66, $84, $64, $60, $64, $85, $66, $86, $68, $84
	.byte $66, $81, $68, $84, $66, $81, $68, $84, $66, $81, $68, $84, $66, $81, $68, $84
	.byte $66, $81, $68, $84, $66, $64, $68, $85, $6A, $87, $6C, $88, $6A, $89, $6C, $88
	.byte $6A, $89, $6C, $88, $6A, $89, $6C, $88, $6A, $89, $6C, $88, $6A, $89, $6C, $84
	.byte $6A, $00
	.byte $80, $38, $38, $81, $38, $82, $2A, $80, $38, $81, $34, $30, $34, $82, $38, $80
	.byte $38, $38, $81, $38, $80, $3E, $81, $38, $80, $3C, $81, $38, $34, $38, $83, $3C
Aladdin_Tri5:
	.byte $AA, $42, $40, $42, $AB, $46
Aladdin_Nse5:
	.byte $A1, $06, $01, $06, $01, $A8, $06, $AC, $01, $AD, $06, $AE, $01, $A1, $06, $01
	.byte $A8, $06, $AC, $01, $A8, $06, $AC, $01, $A8, $06, $AC, $01, $AD, $06, $AE, $01
	.byte $A1, $06, $01, $06, $01, $A8, $06, $AC, $01, $A1, $06, $01, $A8, $06, $AC, $01
	.byte $A1, $06, $01, $A8, $06, $AC, $01, $A8, $06, $AC, $01, $A8, $06, $AC, $01, $AD
	.byte $06, $A9, $01, $00

Aladdin_6:
	.byte $80, $56, $81, $58, $82, $7E, $81, $58, $83, $56, $80, $7E, $50, $81, $52, $52
	.byte $56, $56, $58, $58, $5E, $5E, $80, $4C, $81, $46, $80, $4C, $50, $81, $4A, $80
	.byte $50, $84, $54, $80, $7E, $38, $3E, $85, $40, $00
	.byte $80, $3E, $81, $40, $82, $7E, $81, $40, $83, $3E, $80, $7E, $38, $81, $3A, $3A
	.byte $3E, $3E, $40, $40, $46, $46, $80, $34, $81, $2E, $80, $34, $38, $81, $32, $80
	.byte $38, $84, $3C, $80, $7E, $20, $26, $85, $28
Aladdin_Tri6:
	.byte $A0, $3E, $A6, $34, $A7, $7E, $A0, $36, $38, $3C, $3E, $38, $A1, $46, $A0, $42
	.byte $46, $42, $3E, $38, $34, $A7, $58, $56, $54, $50, $4E, $A8, $4C, $A7, $4A, $46
	.byte $A8, $44, $A7, $42, $A8, $40, $A7, $58, $56, $54, $50, $4E, $A8, $4C, $A7, $4A
	.byte $46, $A8, $44, $A7, $42, $A8, $40, $A7, $58, $56, $54, $50, $4E, $A8, $4C, $A7
	.byte $4A, $46, $A8, $44, $A7, $42, $A8, $40, $A7, $58, $56, $54, $50, $4E, $A8, $4C
	.byte $A7, $4A, $46, $A8, $44, $A7, $42, $A8, $40, $A7, $58, $56, $54, $50, $4E, $A8
	.byte $4C, $A7, $4A, $46, $A8, $44, $A7, $42, $A8, $40, $A7, $58, $56, $54, $50, $4E
	.byte $A8, $4C, $A7, $4A, $46, $A8, $44, $A7, $42, $A8, $40, $A7, $58, $56, $54, $50
	.byte $4E, $A8, $4C, $A7, $4A, $46, $A8, $44, $A7, $42, $A8, $40, $A7, $58, $56, $54
	.byte $50, $4E, $A8, $4C, $A7, $4A, $46, $A8, $44, $A7, $42, $A8, $40, $A9, $7E
Aladdin_Nse6:
	.byte $AA, $06, $AB, $01, $A1, $06, $A2, $01, $A0, $06, $01, $AC, $06, $AD, $01, $AA
	.byte $06, $AB, $01, $A0, $06, $01, $06, $01, $06, $01, $06, $01, $06, $01, $06, $01
	.byte $06, $01, $A1, $06, $AE, $01, $A7, $06, $A8, $01, $A7, $06, $A8, $01, $A7, $06
	.byte $A8, $01, $A7, $06, $A8, $01, $A7, $06, $AF, $01, $00
