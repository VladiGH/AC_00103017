org 	100h

section .text
;;;Imprime el primer mensaje
	mov 	dx, bien
	call 	print
;PIDE LOS 5 NUMEROS
	xor 	si, si 	;lo mimso que: mov si, 0000h
lupi:	call 	kb
	cmp 	al, "$"
	je	mostrar
	;sub	al, 30h
	mov	[300h+si], al ; CS:0300h en adelante
	
	inc 	si
	jmp 	lupi

mostrar:mov	byte [300h+si], "$"
	call 	w_strng
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	call 	kb	; solo detenemos la ejecución

	call 	prom 	;calculo promedio
	mov	byte [331h], "$"
	call 	w_strng3

	mov	al, 1
	cmp	[330h], al
	je	nota1

	mov	al, 2
	cmp	[330h], al
	je	nota2

	mov	al, 3
	cmp	[330h], al
	je	nota3

	mov	al, 4
	cmp	[330h], al
	je	nota4

	mov	al, 5
	cmp	[330h], al
	je	nota5

	mov	al, 6
	cmp	[330h], al
	je	nota6

	mov	al, 7
	cmp	[330h], al
	je	nota7

	mov	al, 8
	cmp	[330h], al
	je	nota8
		
	mov	al, 9
	cmp	[330h], al
	je	nota9

	mov	al, "A"
	cmp	[330h], al
	je	nota10


	int 	20h
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
texto:	mov 	ah, 00h
	mov	al, 03h
	int 	10h
	ret

kb: 	mov	ah, 7h
	int 	21h
	ret

w_strng:mov	ah, 09h
	mov 	dx, 300h
	int 	21h
	ret

w_strng2:mov	ah, 09h
	mov 	dx, 310h
	int 	21h
	ret

w_strng3:mov	ah, 09h
	mov 	dx, 330h
	int 	21h
	ret


print:	mov	ah, 09h
	int 	21h
	ret

prom:	mov 	ax, 0000h
	mov 	bx, 0000h
	mov	al, [300h]
	sub 	al, 30h
	mov	bl, [301h]
	sub 	bl,30h
	add	al, bl
	mov	bl, [302h]
	sub 	bl,30h
	add	al, bl
	mov	bl, [303h]
	sub 	bl,30h
	add	al, bl
	mov	bl, [304h]
	sub 	bl,30h
	add	al, bl
	mov	[310h], al
	mov 	DX, 0000h; limpiando dx
	mov 	BX, 5h ;guardando el el divior
	div	BX	; cociente queda en ax = 2 y residuo queda en DX = 1
	mov	[330h], al ;guardando temporalmente el cociente
	ret

nota1:	mov 	dx, msg1
        call	print
	ret

nota2:	mov 	dx, msg2
        call	print
	ret

nota3:	mov 	dx, not3
        call	print
	ret

nota4:	mov 	dx, msg4
        call	print
	ret

nota5:	mov 	dx, msg5
        call	print
	ret

nota6:	mov 	dx, msg6
        call	print
	ret

nota7:	mov 	dx, msg7
        call	print
	ret

nota8:	mov 	dx, msg8
        call	print
	ret

nota9:	mov 	dx, msg9
        call	print
	ret

nota10:	mov 	dx, msg10
        call	print
	ret

section .data

bien	db	"Ingresa 5 caracteres num-> $"

msg1     db 	" Solo necesito el 0$"

msg2     db 	" Aun se pasa$"

not3     db 	" Hay salud $"

msg4     db 	" Me recupero$"

msg5     db 	" En el segundo$"

msg6     db 	" Peor es nada$"

msg7     db 	" Muy bien$"

msg8     db 	" Colocho$"

msg9     db 	" Siempre me esfuerzo$"

msg10     db 	 " Perfecto solo Dios$"