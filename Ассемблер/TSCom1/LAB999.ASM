	.model small
	.286
	.data
message	db	'Eto pyt zapyska programmi:',10,13,'$'
	.code
start:	mov ax, [ds:2ch]; v ds adres psp, v nem so smesheniem 2ch nahoditsya adres segmenta sredi okr
	mov es, ax
	mov ax, @data
	mov ds, ax
;	mov ah,9h
;	int 21h
	mov si, 0 ;si-index stroki 
	mov ds,bx 
k1:	inc si
	mov dl,[ds:si]
	cmp dl,0
	jne k1
	inc si
	mov dl,[ds:si]
	cmp dl,0
	jne k1
	add si,3
	mov dl,[ds:si]
l1:	mov ah,02h
	int 21h
	inc si
	mov dl,[ds:si]
	cmp dl,0
	jne l1
	mov ah, 4ch
	int 21h
	end Start