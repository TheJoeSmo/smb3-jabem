; Provides a newly prepared object or does not return to caller

prepare_new_object_or_abort:
    LDX #$04      ; X = 4
-
    LDA objects_states, x
    BEQ +           ; If dead or unused, jump

    DEX
    BPL -           ; Look for another object

; No object slots available, abort
    PLA
    PLA

    LDX object_index
    RTS

+
    JSR prepare_new_object   ; Prepare this new object

    ; Set to normal state
    LDA #OBJSTATE_NORMAL
    STA objects_states, x

    RTS      ; Return
