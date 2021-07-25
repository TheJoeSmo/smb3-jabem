;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Identical to LoadLevel_TileMemNextRow from prg014
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LoadLevel_TileMemNextRow_40:
	; Y = TileAddr_Off

	TYA
    CLC
	ADC #16
	TAY		 ; Y += 16

	LDA <Map_Tile_AddrH
	ADC #$00
	STA <Map_Tile_AddrH
	RTS		 ; Return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Identical to LoadLevel_NextColumn from prg014
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LoadLevel_NextColumn_40:
    INY		 ; Y++
    TYA		 ; A = Y
    AND #$0f	 ; Check column
    BNE __PRG014_DFCC	 ; If on column 1-15, jump to PRG014_DFCC (RTS)

    ; Otherwise, need to move over to the next screen (+$1B0)
    LDA <Map_Tile_AddrL
    CLC
    ADC #$b0
    STA <Map_Tile_AddrL
    LDA <Map_Tile_AddrH
    ADC #$01
    STA <Map_Tile_AddrH

    ; Get TileAddr_Off and only keep the row, but clear 'Y' lower bits since
    ; we're going to column 0 on the same row, new screen...
    LDA TileAddr_Off
    AND #$f0
    TAY

__PRG014_DFCC:
    RTS		 ; Return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LoadLevel15_Generic_40:
    ;;; [ORANGE] This function handles loading the following custom
    ;;; tiles in TileSet 1 based on the value in PageCallVars:
    ;;; 0 = On block
    ;;; 1 = Off block
    LDA PageCallVars
    JSR DynJump
    .word LoadLevel_OnOffs_TS1
    .word LoadLevel_OnOffs_TS1

LoadLevel_OnOffs_TS1:
    ; Fall into LoadLevel_OnOffs_40

LoadLevel_OnOffs_40:
    ; PageCallVars contains our On/Off ID (0 or 1)
    LDA LL_ShapeDef
    AND #$0f
    STA <Temp_Var4			; Temp_Var4 = lower 4 bits of LL_ShapeDef (width of run)

    LDA Level_Tileset
    CMP #$06                    ; If this is a water tileset, we actually start our On/Off block IDs
                                ; at the previous tileset in order to support water and air on/offs
    BNE _post_water_sub
    SEC
    SBC #$01
_post_water_sub:
    SEC
    SBC #$01                    ; You actually can't use Level_TilesetIdx outside of gameplay context,
                                ; as it is set in Player_DoGameplay
    ASL A
    ASL A
    CLC
    ADC PageCallVars
    TAX
    LDA PageCallVars
    SEC
    SBC #$02                    ; If this was 2 or 3 (water tileset's air tiles), we need to add it again
                                ; to offset to the next tileset IDs rather than the off+ons
    BMI _post_id_offset
    INX
    INX
_post_id_offset:
    LDY TileAddr_Off		; Y = TileAddr_Off
_load_onoff_loop:
    LDA OnOffTileByTS,X		; One of our custom tiles
    STA (Map_Tile_AddrL),Y		; Store into tile mem
    JSR LoadLevel_NextColumn_40	; Next column
    DEC <Temp_Var4				; Temp_Var4--
    BPL _load_onoff_loop		; While Temp_Var4 >= 0, loop!
    RTS
