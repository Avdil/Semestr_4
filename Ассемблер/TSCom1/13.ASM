	.model small
	.286
	.data

b 	db 16
	.code
	
start:	mov ah,00h
	mov al,03h
	int 10h
	mov cx,-1
	
	
	mov ax,0b800h
	mov ds,ax
	mov si,690
	mov dl,0
	
m2:	inc di
	cmp di,255

	je m5	
	
	mov [ds:si],' '
	inc si
	mov [ds:si],116
	inc si
	mov [ds:si],20h
	inc si
	mov [ds:si],116
	
	mov ax,cx
	div b
	cmp ah,15
	jne m2
	add si,96
	mov cx,-1
	jmp m2
	
	mov ah,08h
	int 21h
	
m5:	mov ah, 4ch
	int 21h
	end start