	.model small
	.286
	.stack 100h
	.code
	mov ah, 0
	mov al, 3
	int 10h
	
	mov di, 21h
	
	mov ax, 0b800h
	mov ds, ax
	mov si, 526
	mov dl, 'Ú'
	mov [ds:si], dl
	inc si
	mov [ds:si], byte ptr di
	mov cx, 33
	mov dl, '-'
	
Dashes: inc si
	mov [ds:si], dl
	inc si
	mov [ds:si], byte ptr di
	loop Dashes
	
	mov dl, '¿'
	inc si
	mov [ds:si], dl
	inc si
	mov [ds:si], byte ptr di
	
	add si, 91
	mov dl, '/'
	mov [ds:si], dl
	inc si
	mov [ds:si], 21h
	inc si
	mov [ds:si], ' '
	inc si
	mov [ds:si], 21h
	inc si
	
	mov dl, 0
	mov bl, 16
Print:	mov [ds:si], dl
	inc dl
	inc si
 	mov [ds:si], byte ptr di
	inc si
	mov [ds:si], ' '
	inc si
	mov [ds:si], byte ptr di
	inc si
	cmp dl, 255
	je Exit
	mov ax, dx
	div bl
	cmp ah, 0
	jne Print
	push dx
	mov dl, '/'
	mov [ds:si], dl
	inc si
	mov [ds:si], 21h
	add si, 89
	mov dl, '/'
	mov [ds:si], dl
	inc si
	mov [ds:si], 21h
	inc si
	mov [ds:si], ' '
	inc si
	mov [ds:si], 21h
	inc si
	pop dx
	jmp Print
	
Exit:	mov [ds:si], ' '
	inc si
	mov [ds:si], 21h
	inc si
	mov [ds:si], ' '
	inc si
	mov [ds:si], 21h
	inc si
	mov dl, '/'
	mov [ds:si], dl
	inc si
	mov [ds:si], 21h
	inc si
	add si, 90
	mov dl, 'À'
	mov [ds:si], dl
	inc si
	mov [ds:si], 21h

	mov cx, 33
Loop:	mov dl, 'Ä'
	inc si
	mov [ds:si], dl
	inc si
	mov [ds:si], 21h
	loop Loop
	
	inc si
	mov dl, 'Ù'
	mov [ds:si], dl
	inc si
	mov [ds:si], 21h

	mov ah, 4ch
	int 21h
	end