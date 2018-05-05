	.model small
	.286
	.data
churki	db	"Eto putb fayla progi: ", 10, 13, '$'	
	.code
start:
	mov di, [es:2ch]
	mov ax, @data
	mov ds, ax
	mov dx, offset churki
	mov ah, 9h
	int 21h

	mov ds, di
	mov si, 0
a1:	mov dl, [ds:si]
	inc si
	cmp dl,0
	jne a1
	mov dl, [ds:si]
	inc si
	cmp dl, 0
	jne a1
	add si, 2 
	
	
a2:	mov dl, [ds:si]
	cmp dl,0
	je a3
	mov ah, 2h
	int 21h
	inc si
	jmp a2
a3:	mov ah, 4ch
	int 21h
	end start
			
			