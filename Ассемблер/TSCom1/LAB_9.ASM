	.model small
	.286
	.data
text1	db "Stroki #", 10, 13, '$'
text2	db " ne sushestvyet", 10, 13, '$'
nomer	dw 3
b 	db	'	', 10, 13, '$'
c 	db	10
	.code
start:	mov ax, [es:2ch]
	mov ds, ax
	mov di, 0 ;nomer tek stroki
	mov si, 0 ;simvol stroki
	mov ax, @data
	mov ds, ax
	mov bp, nomer
	mov ax, [es:2ch]
	mov ds, ax
	
k4:	inc di
	cmp di, bp
	je k3
	
k1:	mov dl, [ds:si]
	inc si
	cmp dl, 0
	jne k1
	mov dl, [ds:si]
	inc si
	cmp dl, 0
	jne k4
	jmp k2

k3:	mov ah, 2h
  	int 21h
  	mov dl, [ds:si]
  	cmp dl, 0
  	je k5
  	cmp dl, 0
  	je k5
  	inc si
  	jmp k3
  	
k2:	mov ax, @data
	mov ds, ax
	mov dx, offset text1
	mov ah, 9h
	int 21h
	mov si, 2
	mov ax, nomer
	
k6:	div c
	add ah, 30h
	mov [b+si], ah
	dec si
	mov ah, 0
	cmp al, 0
	jne k6
	mov dx, offset b
	mov ah, 9h
	int 21h
	mov dx, offset text2
	mov ah, 9h
	int 21h
	
k5:	mov ah, 4ch
	int 21h
	end start