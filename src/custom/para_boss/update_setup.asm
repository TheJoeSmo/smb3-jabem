

para_boss_update_setup:
	LDA PAGE_A000
	PHA

	LDA #$05
	STA objects_health, x

	LDA #30
	STA PAGE_A000
	JSR PRGROM_Change_A000

	JSR para_boss_update

	PLA
	STA PAGE_A000
	JMP PRGROM_Change_A000
