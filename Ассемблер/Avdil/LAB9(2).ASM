	.model small
	.286
	.data
msg	db	'Stroki s nomerom   ne sushestvuet!',10,13,'$'
	.code
	mov ds, [es:2ch]
	xor si, si
	mov di, 17
	mov cx, 1
	mov bx, 9
	mov ah, 2h
NextSymb:
	mov dl, [ds:si]
	cmp cx, bx
	je Print
	inc si
	cmp dl, 0
	jne NextSymb
	inc cx
	mov dl, [ds:si]
	cmp dl, 0
	je ShowMsg
	jne NextSymb
Print:
	int 21h
	inc si
	mov dl, [ds:si]
	cmp dl, 0
	jne Print
	mov dl, 10
	int 21h
	mov dl, 13
	int 21h
	jmp Exit
ShowMsg:
	mov ax, @data
	mov ds, ax
	mov ax, bx
	mov cl, 10
Divide:
	div cl
	add ah, 30h
	mov [msg+di], ah
	dec di
	xor ah, ah
	cmp al, 0
	jne Divide
	mov ah, 9h
	mov dx, offset msg
	int 21h
Exit:
	mov ah, 4ch
	int 21h
	end