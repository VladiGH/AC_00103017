	org 	100h

section .text

	call 	texto	
	call 	cursor
	call 	phrase
        call    phrase2
	call	kbwait

	int 	20h

;Inicia el modo texto
texto:	mov 	ah, 00h
	mov	al, 03h
	int 	10h
	ret

;Permite modificar el cursor
cursor: mov	ah, 01h
	mov 	ch, 00000000b
	mov 	cl, 00001110b
		;   IRGB
	int 	10h
	ret

;Permite escribir un caracter con su respectico atributo
;en la pos actual del cursor
w_char:	mov 	ah, 09h
	mov 	al, cl
	mov 	bh, 0h
	mov 	bl, 00001111b
	mov 	cx, 1h
	int 	10h
	ret

kbwait: mov 	ax, 0000h
	int 	16h
	ret

;Establece la posicion del cursor
m_cursr:mov 	ah, 02h
	mov 	dx, di  ; columna
	mov 	dh, bh ; fila
	mov 	bh, 0h
	int 	10h
	ret

phrase:	mov 	di, 2d
lupi:	mov 	cl, [msg+di-2d]
        mov     bh, 3d
	call    m_cursr
	call 	w_char
	inc	di
	cmp 	di, len
	jbe	lupi
	ret

phrase2:mov 	di, 15d
lupi2:	mov 	cl, [msg2+di-15d]
        mov     bh, 10d
	call    m_cursr
	call 	w_char
	inc	di
	cmp 	di, len2
	jb	lupi2
	ret


section .data
msg	db 	"Baby quien tu eres? "
len 	equ	$-msg

msg2    db      "Tu bizcochito "
len2    equ     $-msg2+15d

