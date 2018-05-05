	.model small
	.286
	.stack 100h
	.code
	mov ah, 0
	mov al, 3
	int 10h
	
	mov ax, 0b800h
	mov ds, ax
	
	mov si, 526
	mov dl, 'Ú'
	mov [ds:si], dl
	mov cx, 33
	mov dl, 'Ä'
	
Dashes: add si, 2
	mov [ds:si], dl
	loop Dashes
	
	mov dl, '¿'
	add si, 2
	mov [ds:si], dl
	
	add si, 92
	mov dl, '³'
	mov [ds:si], dl
	add si, 4
	
	mov dl, 0
	mov bl, 16
Print:	mov [ds:si], dl
	inc dl
	add si, 4
	cmp dl, 255
	je Exit
	mov ax, dx
	div bl
	cmp ah, 0
	jne Print
	push dx
	mov dl, '³'
	mov [ds:si], dl
	add si, 92
	mov dl, '³'
	mov [ds:si], dl
	add si, 4
	pop dx
	jmp Print
	
Exit:	add si, 4
	mov dl, '³'
	mov [ds:si], dl
	add si, 92
	mov dl, 'À'
	mov [ds:si], dl

	mov cx, 33
Loop:	mov dl, 'Ä'
	add si, 2
	mov [ds:si], dl
	loop Loop
	
	add si, 2
	mov dl, 'Ù'
	mov [ds:si], dl

	mov ah, 4ch
	int 21h
	end