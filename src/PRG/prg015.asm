; Super Mario Bros. 3 Full Disassembly by Southbird 2012
; For more info, see http://www.sonicepoch.com/sm3mix/
;
; PLEASE INCLUDE A CREDIT TO THE SOUTHBIRD DISASSEMBLY
; AND THE ABOVE LINK SOMEWHERE IN YOUR WORKS :)
;
; Original disassembler source generated by DCC6502 version v1.4
; (With labels, comments, and some syntax corrections for nesasm by Southbird)
; For more info about DCC6502, e-mail veilleux@ameth.org
;
; This source file last updated: 2012-01-04 18:16:37.846568139 -0600
; Distribution package date: Fri Apr  6 23:46:16 UTC 2012
;---------------------------------------------------------------------------
Tile_Layout_TS1:
    ; This defines the individual 8x8 blocks used to construct one of the tiles
    ; Referenced by Address_Per_Tileset, addressed by Level_Tileset
    ; Stored by upper left, then lower left, then upper right, then lower right

    ; Remember that palette is determined by the upper 2 bits of a TILE (not the PATTERN)
    ; I.e. tiles starting at index $00, $40, $80, $C0 are each on that respective palette

    ; Upper left 8x8 pattern per tile
    .byte $FC, $3B, $FF, $05, $05, $E8, $05, $03, $3C, $3C, $3C, $3D, $FC, $03, $3C, $FC ; Tiles $00 - $0F
    ; Removed background star at $12 (was $4C-$4F)
    .byte $44, $48, $FF, $40, $42, $5E, $FC, $FC, $FC, $FC, $FC, $22, $FC, $38, $21, $05 ; Tiles $10 - $1F
    .byte $28, $05, $05, $2D, $2F, $13, $00, $13, $FF, $FF, $FF, $FF, $10, $10, $B8, $B8 ; Tiles $20 - $2F
    .byte $B8, $B8, $BC, $FD, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; Tiles $30 - $3F
    .byte $DC, $05, $FC, $FC, $05, $05, $05, $03, $3C, $3C, $3C, $3D, $FC, $03, $3C, $FC ; Tiles $40 - $4F
    .byte $13, $00, $13, $01, $62, $0A, $66, $01, $62, $FF, $FF, $FF, $FF, $FF, $FF, $D8 ; Tiles $50 - $5F
    .byte $98, $98, $98, $98, $98, $98, $92, $B4, $B4, $B4, $B4, $B4, $B4, $B4, $B4, $B4 ; Tiles $60 - $6F
    .byte $B4, $B8, $C0, $C0, $C0, $C0, $A4, $EC, $E4, $C0, $D5, $B2, $FF, $FF, $FF, $FF ; Tiles $70 - $7F
    ; Add $82 TILE1_ON_INACTIVE
    .byte $05, $FF, $A0, $FF, $FF, $C4, $50, $03, $3C, $3C, $3C, $3D, $FC, $03, $3C, $FC ; Tiles $80 - $8F
    .byte $68, $6A, $1A, $1C, $6E, $0F, $6E, $0F, $0F, $FC, $FC, $FC, $FC, $0F, $FC, $FC ; Tiles $90 - $9F
    .byte $13, $00, $13, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $8C, $8E, $8C ; Tiles $A0 - $AF
    ; Added one-ways at $BD, $BE
    ; Add $BF TILE1_ON
    .byte $8E, $8C, $8E, $8C, $8E, $76, $76, $74, $70, $72, $AC, $AE, $B8, $30, $4C, $94 ; Tiles $B0 - $BF
    .byte $05, $05, $05, $27, $FC, $FC, $FC, $03, $3C, $3C, $3C, $3D, $FC, $03, $3C, $FC ; Tiles $C0 - $CF
    ; Changed "blank" $D0 block to use $FF instead of $30-$33
    ; Unsure of what this block is...
    ; Add $D2 TILE1_OFF_INACTIVE
    .byte $FF, $FF, $A0, $FF, $FF, $FF, $FF, $05, $B3, $CC, $FC, $C5, $C7, $D4, $FE, $FC ; Tiles $D0 - $DF
    .byte $AA, $AB, $13, $00, $13, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; Tiles $E0 - $EF
    ; Add $FB TILE1_OFF
    .byte $0E, $D7, $E0, $05, $01, $62, $0A, $66, $01, $62, $FF, $94, $FF, $FF, $FF, $FF ; Tiles $F0 - $FF

    ; Lower left 8x8 pattern per tile
    .byte $FC, $3A, $FF, $06, $D6, $E9, $14, $35, $37, $37, $16, $5B, $FC, $23, $16, $FC ; Tiles $00 - $0F
    .byte $45, $49, $FF, $5C, $FC, $5E, $FC, $FC, $38, $3F, $FC, $22, $FC, $FC, $FC, $06 ; Tiles $10 - $1F
    .byte $FD, $2B, $06, $06, $06, $18, $58, $18, $FF, $FF, $FF, $FF, $24, $24, $B9, $B9 ; Tiles $20 - $2F
    .byte $B9, $B9, $BD, $FD, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; Tiles $30 - $3F
    .byte $DD, $06, $FC, $FC, $06, $06, $06, $35, $37, $37, $16, $5B, $FC, $23, $16, $FC ; Tiles $40 - $4F
    .byte $18, $58, $18, $60, $62, $5A, $66, $60, $62, $FF, $FF, $FF, $FF, $FF, $FF, $D9 ; Tiles $50 - $5F
    .byte $99, $99, $99, $99, $99, $99, $93, $B5, $B5, $B5, $B5, $B5, $B5, $B5, $B5, $B5 ; Tiles $60 - $6F
    .byte $B5, $B9, $C1, $C1, $C1, $C1, $A5, $ED, $E4, $C1, $B2, $B2, $FF, $FF, $FF, $FF ; Tiles $70 - $7F
    .byte $06, $FF, $A1, $FF, $FF, $C4, $51, $35, $37, $37, $16, $5B, $FC, $23, $16, $FC ; Tiles $80 - $8F
    .byte $6C, $0F, $1E, $0F, $6E, $0F, $0F, $0F, $0F, $FC, $FC, $FC, $FC, $5B, $FC, $FC ; Tiles $90 - $9F
    .byte $18, $58, $18, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $9C, $9E, $9C ; Tiles $A0 - $AF
    .byte $9E, $9C, $9E, $9C, $9E, $77, $77, $75, $71, $73, $AC, $AE, $B9, $31, $4D, $95 ; Tiles $B0 - $BF
    .byte $5B, $06, $06, $06, $FC, $06, $FC, $35, $37, $37, $16, $5B, $FC, $23, $16, $FC ; Tiles $C0 - $CF
    .byte $FF, $FF, $A1, $FF, $FF, $FF, $FF, $E6, $CD, $CD, $CD, $FE, $FE, $FE, $FE, $FE ; Tiles $D0 - $DF
    .byte $AB, $AB, $18, $58, $18, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; Tiles $E0 - $EF
    .byte $64, $06, $E1, $06, $60, $62, $5A, $66, $60, $62, $FF, $95, $FF, $FF, $FF, $FF ; Tiles $F0 - $FF

    ; Upper right 8x8 pattern per tile
    .byte $FC, $FC, $FF, $07, $07, $EA, $07, $37, $04, $37, $37, $3D, $3D, $37, $04, $37 ; Tiles $00 - $0F
    .byte $46, $4A, $FF, $41, $43, $FC, $5F, $FC, $FC, $FC, $22, $FC, $20, $38, $FC, $07 ; Tiles $10 - $1F
    .byte $29, $07, $2C, $2E, $07, $12, $12, $02, $FF, $FF, $FF, $FF, $11, $11, $BA, $BA ; Tiles $20 - $2F
    .byte $BA, $BA, $BE, $FD, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; Tiles $30 - $3F
    .byte $DE, $07, $FC, $FC, $07, $07, $07, $37, $04, $37, $37, $3D, $3D, $37, $04, $37 ; Tiles $40 - $4F
    .byte $12, $12, $02, $01, $63, $01, $63, $0B, $0D, $FF, $FF, $FF, $FF, $FF, $FF, $DA ; Tiles $50 - $5F
    .byte $9A, $9A, $9A, $9A, $9A, $9A, $CA, $B6, $B6, $B6, $B6, $B6, $B6, $B6, $B6, $B6 ; Tiles $60 - $6F
    .byte $B6, $BA, $C2, $C2, $C2, $C2, $A6, $EE, $E5, $C2, $D5, $B2, $FF, $FF, $FF, $FF ; Tiles $70 - $7F
    .byte $07, $FF, $A2, $FF, $FF, $C6, $56, $37, $04, $37, $37, $3D, $3D, $37, $04, $37 ; Tiles $80 - $8F
    .byte $69, $6B, $1B, $1D, $0F, $6F, $0F, $6F, $0F, $69, $6B, $1B, $1D, $0F, $0F, $6F ; Tiles $90 - $9F
    .byte $12, $12, $02, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $8D, $8F, $8D ; Tiles $A0 - $AF
    .byte $8F, $8D, $8F, $8D, $8F, $7A, $7A, $78, $70, $72, $AD, $AF, $BA, $32, $4E, $96 ; Tiles $B0 - $BF
    .byte $07, $07, $26, $07, $07, $FC, $FC, $37, $04, $37, $37, $3D, $3D, $37, $04, $37 ; Tiles $C0 - $CF
    .byte $FF, $FF, $A2, $FF, $FF, $FF, $FF, $07, $B3, $CE, $FC, $C5, $C7, $D4, $FE, $FC ; Tiles $D0 - $DF
    .byte $AA, $AB, $12, $12, $02, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; Tiles $E0 - $EF
    .byte $67, $D7, $E2, $07, $01, $63, $01, $63, $0B, $0D, $FF, $96, $FF, $FF, $FF, $FF ; Tiles $F0 - $FF

    ; Lower right 8x8 pattern per tile
    .byte $FC, $FC, $FF, $08, $D6, $EB, $15, $3C, $36, $3C, $34, $3D, $3D, $34, $25, $34 ; Tiles $00 - $0F
    .byte $47, $4B, $FF, $FC, $5D, $FC, $5F, $3E, $38, $FC, $22, $FC, $FC, $FC, $FC, $2A ; Tiles $10 - $1F
    .byte $FD, $08, $08, $08, $08, $17, $19, $59, $FF, $FF, $FF, $FF, $39, $39, $BB, $BB ; Tiles $20 - $2F
    .byte $BB, $BB, $BF, $FD, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; Tiles $30 - $3F
    .byte $DF, $08, $FC, $FC, $08, $08, $08, $3C, $36, $3C, $34, $3D, $3D, $34, $25, $34 ; Tiles $40 - $4F
    .byte $17, $19, $59, $61, $63, $61, $63, $0C, $0D, $FF, $FF, $FF, $FF, $FF, $FF, $DB ; Tiles $50 - $5F
    .byte $9B, $9B, $9B, $9B, $9B, $9B, $CB, $B7, $B7, $B7, $B7, $B7, $B7, $B7, $B7, $B7 ; Tiles $60 - $6F
    .byte $B7, $BB, $C3, $C3, $C3, $C3, $A7, $EF, $E5, $C3, $B2, $B2, $FF, $FF, $FF, $FF ; Tiles $70 - $7F
    .byte $08, $FF, $A3, $FF, $FF, $C6, $57, $3C, $36, $3C, $34, $3D, $3D, $34, $25, $34 ; Tiles $80 - $8F
    .byte $0F, $6D, $0F, $1F, $0F, $6F, $0F, $0F, $0F, $0F, $6D, $0F, $1F, $0F, $0F, $6F ; Tiles $90 - $9F
    .byte $17, $19, $59, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $9D, $9F, $9D ; Tiles $A0 - $AF
    .byte $9F, $9D, $9F, $9D, $9F, $7B, $7B, $79, $71, $73, $AD, $AF, $BB, $33, $4F, $97 ; Tiles $B0 - $BF
    .byte $08, $08, $08, $08, $08, $08, $08, $3C, $36, $3C, $34, $3D, $3D, $34, $25, $34 ; Tiles $C0 - $CF
    .byte $FF, $FF, $A3, $FF, $FF, $FF, $FF, $E7, $CF, $CF, $CF, $FE, $FE, $FE, $FE, $FE ; Tiles $D0 - $DF
    .byte $AB, $AB, $17, $19, $59, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; Tiles $E0 - $EF
    .byte $65, $08, $E3, $08, $61, $63, $61, $63, $0C, $0D, $FF, $97, $FF, $FF, $FF, $FF ; Tiles $F0 - $FF

Tile_Attributes_TS1:
    .byte $25, $50, $A0, $E2, $2D, $53, $AD, $F0


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LevelLoad_TS1
;
; Entry point for loading level layout data for Level_Tileset = 1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LevelLoad_TS1:

    ; Clear Tile memory
    LDY #$00
PRG015_A40A:
    LDA #TILE1_SKY      ; Plains style just clears everything to sky
    JSR Tile_Mem_ClearB
    JSR Tile_Mem_ClearA
    CPY #$f0
    BNE PRG015_A40A

    JMP LevelLoad   ; Begin actual level loading!


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LoadLevel_Generator_TS1
;
; Based on the values in Temp_Var15 and LL_ShapeDef, chooses an
; appropriate generator function to builds this piece of the
; level.  Tedious, but saves space and is paper-design friendly.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
PRG015_A419:
    .byte 0, 15, 30, 45, 60, 75, 90, 105

LoadLevel_Generator_TS1:
    ; From level loader function:
    ; * Temp_Var15, Temp_Var16, and LL_ShapeDef are three bytes read from the data


    LDA Temp_Var15
    AND #%11100000
    LSR A
    LSR A
    LSR A
    LSR A
    LSR A
    TAX         ; X = upper 3 bits of Temp_Var15 (0-7) (selects a multiple of 15 as the base)

    LDA LL_ShapeDef
    LSR A
    LSR A
    LSR A
    LSR A           ; A = upper 4 bits of LL_ShapeDef shifted down
    CLC
    ADC PRG015_A419,X   ; Add multiple of 15
    TAX
    DEX
    TXA      ; A = ((LL_ShapeDef >> 4) + PRG015_A419[X]) - 1


    ; PRG015_A419 provides values well in excess of 45, but only 45
    ; addresses are defined here; reserved for expansion...

    JSR DynJump_LLGen_15

    ; THESE MUST FOLLOW DynJump FOR THE DYNAMIC JUMP TO WORK!!
    .word LoadLevel_GenerateBigBlock    ; 0 - White big blocks which auto generate to the ground
    .word LoadLevel_GenerateBigBlock    ; 1 - Orange big blocks which auto generate to the ground
    .word LoadLevel_GenerateBigBlock    ; 2 - Green big blocks which auto generate to the ground
    .word LoadLevel_GenerateBigBlock    ; 3 - Blue big blocks which auto generate to the ground
    .word LoadLevel_FloatingBigBlock    ; 4 - White big blocks which generate in the sky
    .word LoadLevel_FloatingBigBlock    ; 5 - Orange big blocks which generate in the sky
    .word LoadLevel_FloatingBigBlock    ; 6 - Green big blocks which generate in the sky
    .word LoadLevel_FloatingBigBlock    ; 7 - Blue big blocks which generate in the sky
    .word LoadLevel_LittleBushRun       ; 8 - Put in a run of those cute little bushes
    .word LoadLevel_Pitfall         ; 9 - Generate pitfall at the bottom of the level
    .word LoadLevel_LittleCloudRun      ; 10 - Put in a run of those little smiling Judgem's type clouds
    .word LoadLevel_GroundRun       ; 11 - Do a run of solid ground
    .word LoadLevel_GroundRun       ; 12 - Do a run of solid ground, underwater
    .word LoadLevel_CloudRun        ; 13 - Run of the clouds
    .word LoadLevel_PitfallW        ; 14 - Same as 9, except underwater ground tiles instead
    .word LoadLevel_BlockRun        ; 15 - Run of bricks
    .word LoadLevel_BlockRun        ; 16 - Run of '?' blocks with a coin
    .word LoadLevel_BlockRun        ; 17 - Run of bricks with a coin
    .word LoadLevel_BlockRun        ; 18 - Run of wood blocks
    .word LoadLevel_BlockRun        ; 19 - Run of green note blocks (?)
    .word LoadLevel_BlockRun        ; 20 - Run of note blocks
    .word LoadLevel_BlockRun        ; 21 - Run of bouncing wood blocks
    .word LoadLevel_BlockRun        ; 22 - Run of coins
    .word LoadLevel_VGroundPipeRun      ; 23 - Vertical ground pipe 1 (alt level)
    .word LoadLevel_VGroundPipeRun      ; 24 - Vertical ground pipe 2 (Big [?] area)
    .word LoadLevel_VGroundPipeRun      ; 25 - Vertical ground pipe 3 (no entrance)
    .word LoadLevel_VCeilingPipeRun     ; 26 - Vertical ceiling pipe 1 (alt level)
    .word LoadLevel_VCeilingPipeRun     ; 27 - Vertical ceiling pipe 2 (no entrance)
    .word LoadLevel_HRightWallPipeRun   ; 28 - Horizontal right-hand wall pipe (alt level)
    .word LoadLevel_HRightWallPipeRun   ; 29 - Horizontal right-hand wall pipe (no entrance)
    .word LoadLevel_HLeftWallPipeRun    ; 30 - Horizontal left-hand wall pipe (alt level)
    .word LoadLevel_HLeftWallPipeRun    ; 31 - Horizontal left-hand wall pipe (no entrance)
    .word LoadLevel_Cannon          ; 32 - Bullet bill cannon
    .word LoadLevel_CCBridge        ; 33 - Cheep-Cheep style 'oo' bridge
    .word LoadLevel_CCBridge        ; 34 - Would result in empty tiles?  (form of 33)
    .word LoadLevel_TopDecoBlocks       ; 35 - Top-Deco Rectangle Waterfall
    .word LoadLevel_TopDecoBlocks       ; 36 - Top-Deco Rectangle Left waving water pool
    .word LoadLevel_TopDecoBlocks       ; 37 - Top-Deco Rectangle No current waving water pool
    .word LoadLevel_TopDecoBlocks       ; 38 - Top-Deco Rectangle Right waving water pool
    .word LoadLevel_TopDecoBlocks       ; 39 - Top-Deco Rectangle Water wrong-way BG
    .word LoadLevel_TopDecoBlocks       ; 40 - Top-Deco Rectangle Diamond blocks (not really any deco on top)
    .word LoadLevel_TopDecoBlocks       ; 41 - Top-Deco Rectangle Sand ground
    .word LoadLevel_TopDecoBlocks       ; 42 - Top-Deco Rectangle orange block??
    .word LoadLevel_IceBricks       ; 43 - Run of ice bricks
    .word LoadLevel_VTransitPipeRun     ; 44 - Vertical in-level transit pipe
    .word LoadLevel_LittleCloudSolidRun ; 45 - Run of the all-solid Judgem's type clouds (BROKEN, check function def for notes)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LeveLoad_FixedSizeGen_TS1
;
; Much simpler generators that are fixed-size, commonly used for
; just single tile placement styles (although a couple relatively
; complex ones exist in here as well)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LeveLoad_FixedSizeGen_TS1:
    ; It is verified before calling this function that all of
    ; the upper 4 bits of LL_ShapeDef are ZERO

    ; So the upper 3 bits of Temp_Var15 serve as the most significant bits
    ; to a value where LL_ShapeDef provide the 4 least significant bits

    LDA Temp_Var15
    AND #%11100000
    LSR A
    CLC
    ADC LL_ShapeDef
    TAX         ; Resultant index is put into 'X'
    JSR DynJump

    ; THESE MUST FOLLOW DynJump FOR THE DYNAMIC JUMP TO WORK!!
    .word LoadLevel_MidSizeBush     ;  0 - Place a mid-sized large green bush
    .word LoadLevel_SmallSizeBush       ;  1 - Place a small sized large green bush
    .word LoadLevel_BigSizeBush     ;  2 - Place a big sized large green bush
    .word LoadLevel_RandomPUpClouds     ;  3 - Add 60 random "power up clouds"
    .word LoadLevel_Door2           ;  4 - Door style 2
    .word LoadLevel_Door1           ;  5 - Door style 1
    .word LoadLevel_VineToGround        ;  6 - Constructs a vine from the start down to next non-sky tile
    .word LoadLevel_PutLittleBGCloud    ;  7 - Adds a single little BG cloud
    .word $0000             ;  8 - NULL?
    .word $0000             ;  9 - NULL?
    .word $0000             ; 10 - NULL?
    .word $0000             ; 11 - NULL?
    .word $0000             ; 12 - NULL?
    .word $0000             ; 13 - NULL?
    .word $0000             ; 14 - NULL?
    .word $0000             ; 15 - NULL?
    .word LoadLevel_PowerBlock      ; 16 - ? block with flower
    .word LoadLevel_PowerBlock      ; 17 - ? block with leaf
    .word LoadLevel_PowerBlock      ; 18 - ? block with star
    .word LoadLevel_PowerBlock      ; 19 - ? block with coin OR star
    .word LoadLevel_PowerBlock      ; 20 - ? block with coin (??)
    .word LoadLevel_PowerBlock      ; 21 - Muncher Plant!
    .word LoadLevel_PowerBlock      ; 22 - Brick with flower
    .word LoadLevel_PowerBlock      ; 23 - Brick with leaf
    .word LoadLevel_PowerBlock      ; 24 - Brick with star
    .word LoadLevel_PowerBlock      ; 25 - Brick with coin OR star
    .word LoadLevel_PowerBlock      ; 26 - Brick with 10-coin
    .word LoadLevel_PowerBlock      ; 27 - Brick with 1-up
    .word LoadLevel_PowerBlock      ; 28 - Brick with vine
    .word LoadLevel_PowerBlock      ; 29 - Brick with P-Switch
    .word LoadLevel_PowerBlock      ; 30 - Invisible coin
    .word LoadLevel_PowerBlock      ; 31 - Invisible 1-up
    .word LoadLevel_PowerBlock      ; 32 - Invisible note
    .word LoadLevel_PowerBlock      ; 33 - Note block with flower
    .word LoadLevel_PowerBlock      ; 34 - Note block with leaf
    .word LoadLevel_PowerBlock      ; 35 - Note block with star
    .word LoadLevel_PowerBlock      ; 36 - Wood block with flower
    .word LoadLevel_PowerBlock      ; 37 - Wood block with leaf
    .word LoadLevel_PowerBlock      ; 38 - Wood block with star
    .word LoadLevel_PowerBlock      ; 39 - Invisible note to coin heaven
    .word LoadLevel_PowerBlock      ; 40 - P-Switch
    .word LoadLevel_EndGoal         ; 41 - The end goal

    ; Broken into another file for ease of integration in NoDice editor
    .include "PRG/levels/Plains.asm"

; Rest of ROM bank was empty

DynJump_LLGen_15:
    CMP #46
    BCC _j_DynJump15

    ; If we're generating our custom object, we need to JSR to DynJump with our new index
    SEC
    SBC #46
    STA PageCallVars	; save A
    PLA	; eat our current return address
    PLA	; eat our current return address
    ;;; Fall into LoadLevel15_Generic

LoadLevel15_Generic:
    PageCall 40, LoadLevel15_Generic_40
    RTS

_j_DynJump15:
    JMP DynJump