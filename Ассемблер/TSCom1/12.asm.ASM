	.model small
	.stack 100h
	.286
	.data
	d db 10,13,'$'
	a db '                         ','$'
	b db ' ','$'
	.code
start:
	mov ax,@data
	mov ds,ax
	mov si,0
	mov di,0
l1:
	mov dx,offset d
	mov ah,09h
	int 21h
	inc si
	cmp si,4
	jne l1
	mov dx, offset a
	mov ah,09h
	int 21h
	mov si,0	
l2:	
	cmp si,256
	je l5
	cmp di,16
	je l6
	mov dx,si
	cmp si,13
	je l3
	cmp si,10
	je l3
	cmp si,9
	je l3
	cmp si,8
	je l3
	cmp si,7
	je l3
	mov ah,02h
	int 21h
	mov dx, offset b
	mov ah,09h
	int 21h
	inc si
	inc di
	jmp l2
l3:	mov dx,offset b
	mov ah,09h
	int 21h
	inc si
	inc di
	jmp l2
l6:	mov dx,offset d
	mov ah,09h
	int 21h
	mov dx, offset a
	int 21h
	mov di,0
	jmp l2
l5:	mov ah,4ch
	int 21h
	end Start