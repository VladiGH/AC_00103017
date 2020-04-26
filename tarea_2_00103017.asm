    org 100h;promedio de primer parcial :2.2    CARNET: 103017 TOMAR EN CUENTA: 03017


section     .text
        mov     AL, 0d
        mov     BL, 3d
        ADD     AL, BL

        mov     BL, 0d
        ADD     AL, BL

        mov     BL, 1d
        ADD     AL, BL

        mov     BL, 7d
        ADD     AL, BL
        
        mov     [20Dh], AL ;hasta el momento se hace toda la suma y se guarda en [20Dh] solo para 
                            ; saber que ahí estará temporalmente
        mov     AX, [20Dh]  ;se guarda en el registro acumulador AX
        ;DIV     5d

        mov     di, 0d
        mov     cx, [len]

lupi:   mov     bl, [comnt+di]
        mov     [di+200h], bl
        inc     di
        loop    lupi

    int 20h

section     .data

comnt   db      "Aun se pasa"
len     equ     $-comnt
