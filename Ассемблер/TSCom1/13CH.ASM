	.model small
	.286
	.data
	.code
	
m1:	mov ah,00h
	mov al,03h
	;int 10h
	;mov cx,-1
	
	mov ax,0b800h
	mov ds,ax
	mov si,530
	
m2:	inc di
	cmp di,255
	je m5
	
	
m6:	mov ds:si,di
	inc si
	mov [ds:si],116
	inc si
	mov [si],' '
	inc si
	inc cx
	
	mov ax,cx
	div b
	cmp ah,20
	jne m2
	add si,97
	mov cx,-1
	jmp m2
	
m5:	mov ah,4ch
	int 21h
	end m1
