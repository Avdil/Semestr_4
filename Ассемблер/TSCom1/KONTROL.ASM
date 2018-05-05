	.model small
	.stack 100h
	.286
	.data
	d db '120',10,13,'$'
	a db  '6',10,13,'$'
	.code
start:	mov ax,@data
	mov ds,ax
	mov dx,offset d
	mov ah,9h
	int 21h
	mov dx,offset a
	mov ah,9h
	int 21h	
	mov si,0
	sub si,5
	mov ah,4ch
	int 21h
	end start