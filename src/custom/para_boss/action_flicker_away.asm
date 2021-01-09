

    ; Defeated Koopaling vanishing air ship timer mask; smaller the timer,
    ; the smaller the mask, and the faster it flickers
para_flicker_effect: .byte $01, $02, $04, $08

para_boss_action_flicker_away:
    LDA Objects_Timer, x
    BNE +

    ; Timer expired!

    ; Play "King's Room" music (as Mario begins to fall)
    LDA #MUS2A_THRONEROOM
    STA Sound_QMusic2

    LDA #$ff
    STA Objects_Timer, x

    BEQ +

    INC Level_GetWandState
    INC para_state, x
    JMP para_boss_dirty_update

+
    CMP #$80
    BGE +   ; If timer < $80, jump to + (RTS)

; Divide timer by 16
    ASL A       
    ASL A       
    ROL A       
    ROL A
    AND #$03

    TAY
    LDA para_flicker_effect, y

; The "flicker away" effect just takes advantage of forcing the scroll
; to the absolute top or absolute bottom, back and forth
    LDY #$00
    AND Objects_Timer, x
    BEQ ++
    LDY #$EF 

++
    STY Vert_Scroll ; Set scroll as appropriate!

+
    RTS      ; Return
