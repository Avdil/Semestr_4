	.model small
	.286
	.stack 100h
	.data
a 	db 	'asdfgsdg',10,13,'$'
	.code
start:
	mov ax,@data
	mov ds,ax
	mov si,0
	mov bx,0
	mov di,0
	
nachalo:	mov ax,bx
	mov bx,ax
cmp1:	mov ah,08h
	int 21h
	cmp al,0Dh
	je ok
	cmp al,29h
	jna cmp1
	cmp al,40h
	jnb cmp1
	cmp bx,65530
	je s
	cmp si,1
	je 0
num:	mov ah,02h
	mov dl,al
	int 21h
	sub al,30h
	mov ah,0
	add bx,ax
	
	
o3:	inc si
	cmp si,1
	je o1
	cmp si,4
	je s4
	cmp si,5
	jne nachalo
	jmp end
s4:	cmp bx,6553
	jna nachalo
	mov ah,08h
	int 21h
	imp end
	
s:	cmp al,35h
	jbe num
	jmp cmp1
ok:	mov ax,bx
	div mul
	mov bx,ax
	cmp si,0
	je nachalo
	jmp end
o:	cmp bx,0
	jne num
	mov si,0
	jmp num
o1:	cmp bx,0
	je end
	jmp o3
end:	mov ah,09h
	mov dx,offset a
	int 21h
end1:	dec si
	mov dx,0
	mov ax,bx
	div mul
	mov bx,ax
	add dx,30h
	mov [a+si],dl
	cmp si,0
	jne end1
	
	
	mov ah,										