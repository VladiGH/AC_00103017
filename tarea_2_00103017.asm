    	org 100h;promedio de primer parcial :2.2    CARNET: 103017 TOMAR EN CUENTA: 03017


section     .text
;---------------TAREA 1----------------------------------------------------
        mov     AX, 0d
        mov     BX, 3d
        ADD     AX, BX ;AX = 3

        mov     BX, 0d
        ADD     AX, BX ;AX =3 

        mov     BX, 1d
        ADD     AX, BX ; AX = 4

        mov     BX, 7d
        ADD     AX, BX ; AX = 11
        
	mov 	DX, 0000h; limpiando dx
	mov 	BX, 5h ;guardando el el divior
	div	BX	; cociente queda en ax = 2 y residuo queda en DX = 1

	mov 	[210h], DX ;guardando temporalmente el residuo
	mov	[211h], AX ;guardando temporalmente el cociente
;---------------------------------------------------------------------------------------
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
