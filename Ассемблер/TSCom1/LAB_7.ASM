	.model small
	.286
	.data
a	dw 65535
b	db '     ',10,13,'$'
c	dw 10
	.code

start:	mov ax, @data       
	mov ds, ax
	add a,-1
	mov si, 4
	mov ax, a
	mov dx,0

k1:	div c                
	add dx, 30h          
	mov [b+si],dl        
	dec si               
	mov dx, 0            
	cmp ax, 0            
	jne k1               
	mov dx,offset b
	mov ah, 9h
	int 21h
	mov ah, 4ch
	int 21h
	end start