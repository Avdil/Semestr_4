	.model small
	.286
	.data
los	db	'Eto put zapuska programmy:   '
a	db	10,13,'$'
	.code
Start:
	mov bx, [ds:2ch]
	mov cx, @data
	mov ds, cx
	mov ds, bx
	mov si, 0
k1:
	mov dl, [ds:si]
	inc si
	cmp dl, 0
	jne k1
	mov dl, [ds:si]
	inc si
	cmp dl, 0
	jne k1
	add si, 2
k3:
	mov dl, [ds:si]
	cmp dl, 0
	je k2
	mov ah, 2h
	int 21h
	inc si
	jmp k3
k2:
	mov ax, @data
	mov ds, ax
	mov dx, offset los
	mov ah, 9h
	int 21h
	mov ah, 4ch
	int 21h
	end start