.const SCREEN = $0400
BasicUpstart2(main)
* = $01000

main:
jsr cls
rts

cls:
lda #3
ldx #0

cls_loop:
sta SCREEN, X
sta SCREEN + $0100, X
sta SCREEN + $0200, X
sta SCREEN + $02e8, X
dex
bne cls_loop
rts

hellotext:
    .encoding "screencode_mixed"
    .text "hello, world szo, szo!"
    .byte $0
    .const ofs = 0

mainz:
    ldy #0

hello:
    lda hellotext,y
    beq !loop+
    sta $400+ofs,y
    lda #1
    sta $d800+ofs,y
    iny
    jmp hello
!loop:
    rts
