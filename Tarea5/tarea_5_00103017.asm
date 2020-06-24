org 	100h

section .text

	call 	grafico	; Llamada a iniciar modo grafico 13h

	xor 	si, si
	xor 	di, di

	mov 	si, 25d ; X -> Columna
	mov 	di, 25d ; Y -> Fila
	call 	linea_h

	mov 	si, 75d ; X -> Columna
	mov 	di, 105d ; Y -> Fila
	call 	linea_h2

	mov 	si, 130d ; X -> Columna
	mov 	di, 25d ; Y -> Fila
	call 	linea_h3

	mov	si, 25d ; X -> Columna
	mov 	di, 25d ; Y -> Fila
	call 	linea_d

	;mov	si, 75d ; X -> Columna
	;mov 	di, 25d ; Y -> Fila
	;call 	linea_v

	call 	kb		; Utilizamos espera de alguna tecla

	int 	20h

grafico:mov	ah, 00h
	mov	al, 13h
	int 	10h
	ret

pixel:	mov	ah, 0Ch
	mov	al, 1010b
	int 	10h
	ret

linea_h: 
lupi_h:	mov 	cx, 0d ; Columna 
	add 	cx, si
	mov	dx, di ; Fila
	call 	pixel
	inc 	si
	cmp 	si, 50d
	jne 	lupi_h
	ret

linea_h2: 
lupi_h2:mov 	cx, 0d ; Columna 
	add 	cx, si
	mov	dx, di ; Fila
	call 	pixel
	inc 	si
	cmp 	si, 100d
	jne 	lupi_h2
	ret

linea_h3: 
lupi_h3:mov 	cx, 0d ; Columna 
	add 	cx, si
	mov	dx, di ; Fila
	call 	pixel
	inc 	si
	cmp 	si, 155d
	jne 	lupi_h3
	ret

linea_d:
lupi_d:	mov 	cx, si ; Columna 
	mov	dx, si ; Fila
	;add 	dx, di
	call 	pixel
	inc 	di
	cmp 	di, 75d
	jne 	lupi_d
	ret


kb: 	mov	ah, 00h
	int 	16h
	ret

section .data