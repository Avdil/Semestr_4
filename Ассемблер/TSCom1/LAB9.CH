  	.model small
 	 .286
  	.stack 100h
  	.data
r	db	'Eto put k zapusku programmi',10,13,'$'
  	.code
 start:
a: 	mov ax,[ds:2ch]
	mov ax, @data
	mov ds, ax
	mov dx, offset r
	mov ah, 9h
	int 21h	
	mov ds,ax	
 	mov si,0
b:	mov dl,[ds:si]
 	inc si
 	cmp dl,0
 	jne b
 	mov dl,[ds:si]
	inc si
	cmp dl,0
	jne b
	add si,2
c:	mov dl,[ds:si]
	cmp dl,0
	je d
	mov ah,2h
	int 21h
	inc si
	jmp c
d:	mov ah,4ch
	int 21h
	end a	