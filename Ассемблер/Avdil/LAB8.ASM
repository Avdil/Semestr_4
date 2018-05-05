	.model small
	.286
	.data
los	db	'Eto put zapuska programmy:   ', 10,13.'$'
	.code
Start:
	mov bx, [ds:2ch]
	mov cx, @data
	mov ds, cx
	mov dx, offset los
	mov ah, 9h
	int 21h
	mov ds, bx
	mov si, 0
a1:	mov dl, [ds:si]
	inc si
	cmp dl, 0
	jne a1
	mov dl, [ds:si]
	inc si
	cmp dl, 0
	jne a1
	add si, 2
a2:	mov dl, [ds:si]
	cmp dl, 0
	je a3
	mov ah, 2h
	int 21h
	inc si
	jmp a2
a3:	mov ah, 4ch
	int 21h
	end start