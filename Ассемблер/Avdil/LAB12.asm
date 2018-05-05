	.model small
	.286
	.stack 100h
	.code
	
	mov ah, 0
	mov al, 3
	int 10h
	
	xor al, al
	mov bl, 101100b
	
	mov dh, 0
	mov dl, 44
	mov ah, 2h
	int 10h
	
	mov cx, 1
	mov ah, 9h
	mov al, 'Ú'
	int 10h
	mov ah, 2h
	inc dl
	int 10h
	
	mov ah, 9h
	mov cx, 33
	mov al, 'Ä'
	int 10h
	add dl, 33
	mov ah, 2h
	int 10h
	mov cx, 1
	mov ah, 9h
	mov al, '¿'
	int 10h
	
	mov dh, 1
	mov dl, 44
	mov ah, 2h
	int 10h
	
	mov ah, 9h
	mov al, '³'
	int 10h
	
	mov ah, 2h
	add dl, 2
	int 10h
	
	mov al, 0
	
Print:	mov ah, 9h
	int 10h
	push ax
	inc dl
	mov ah,02h
	int 10h
	mov al,' ' 
	mov ah,09h
	int 10h
	pop ax
	inc al
	inc dl
	mov ah, 2h
	int 10h
	cmp al, 255
	je Exit
	push ax
	mov ah, 4
	mov cl, 16
	div cl
	cmp ah, 0
	mov cl, 1
	pop ax
	jne Print
	add dl, 1
	mov ah, 2h
	int 10
	push ax
	mov al, '³'
	mov ah, 9h
	int 10h
	inc dh
	mov dl, 44
	mov ah, 2h
	int 10h
	mov ah, 9h
	mov al, '³'
	int 10h
	add dl, 2
	mov ah, 2h
	int 10h
	pop ax
	jmp Print
	
Exit:	mov ah, 9h
	int 10h
	add dl, 2
	mov ah, 2h
	int 10h
	mov ah, 9h
	mov al, '³'
	int 10h
	inc dh
	mov dl, 44
	mov ah, 2h
	int 10h
	mov ah, 9h
	mov al, 'À'
	int 10h
	
	inc dl
	mov ah, 2h
	int 10h
	mov ah, 9h
	mov al, 'Ä'
	mov cx, 33
	int 10h
	
	add dl, 33
	mov ah, 2h
	int 10h
	
	mov cx, 1
	mov ah, 9h
	mov al, 'Ù'
	int 10h
	
	mov ah, 4ch
	int 21h
	end