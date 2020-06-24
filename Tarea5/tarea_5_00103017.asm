org 	100h

section .text

	call 	grafico	; Llamada a iniciar modo grafico 13h

	xor 	si, si
	xor 	di, di
	;;para - izq
	mov 	si, 25d ; X -> Columna
	mov 	di, 25d ; Y -> Fila
	call 	linea_h

	;para - medio
	mov 	si, 105d ; X -> Columna
	mov 	di, 105d ; Y -> Fila
	call 	linea_h2

	;para - derecha
	mov 	si, 185d ; X -> Columna
	mov 	di, 25d ; Y -> Fila
	call 	linea_h3

	;para \ externa
	mov	si, 25d ; X -> Columna
	mov 	di, 25d ; Y -> Fila
	call 	linea_d

	;para \ interna
	mov	si, 50d ; X -> Columna
	mov 	di, 25d ; Y -> Fila
	call 	linea_d2

	;para / externa
	mov	si, 210d ; X -> Columna
	mov 	di, 25d ; Y -> Fila
	call 	linea_d3
	
	;para / interna
	mov	si, 185d ; X -> Columna
	mov 	di, 25d ; Y -> Fila
	call 	linea_d4
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
	cmp 	si, 130d
	jne 	lupi_h2
	ret

linea_h3: 
lupi_h3:mov 	cx, 0d ; Columna 
	add 	cx, si
	mov	dx, di ; Fila
	call 	pixel
	inc 	si
	cmp 	si, 210d
	jne 	lupi_h3
	ret
;\ externa
linea_d:
lupi_d:	mov 	cx, si ; Columna 
	mov	dx, 0d ; Fila
	add 	dx, di
	call 	pixel
	inc 	di
	inc	si
	cmp 	di, 105d
	jne 	lupi_d
	ret

;\ interna
linea_d2:
lupi_d2:mov 	cx, si ; Columna 
	mov	dx, 0d ; Fila
	add 	dx, di
	call 	pixel
	inc 	di
	inc	si
	cmp 	di, 93d
	jne 	lupi_d2
	ret

;/ externa
linea_d3:
lupi_d3:mov 	cx, si ; Columna 
	mov	dx, 0d ; Fila
	add 	dx, di
	call 	pixel
	inc 	di
	sub	si, 1d
	cmp 	di, 106d
	jne 	lupi_d3
	ret
;/ interna
linea_d4:
lupi_d4:mov 	cx, si ; Columna 
	mov	dx, 0d ; Fila
	add 	dx, di
	call 	pixel
	inc 	di
	sub	si, 1d
	cmp 	di, 93d
	jne 	lupi_d4
	ret

kb: 	mov	ah, 00h
	int 	16h
	ret

section .data