	.model 	Small
	.286
	.stack	100h
	.data
m	db	'Hello',10,13,'$'
	.code
Start:	mov	ax, @data
	mov	ds, ax
	mov 	dx,offset m
	mov	ah,9h
	int	 21h
	
;	mov ds,ax
;	mov bx, 5
;	mov ax,[bx]
;	mov cx,[bx+1]
;	mov ax,[bx+1]
;	mov cx,dx
;	inc bx
;	inc bx
	mov si,0
	mov dl,[m+si]
	mov bl,[m+si+1]
	mov [m+si],bl
	mov [m+si+1],dl
	mov dl,	[m+si+1]
	mov bl, [m+si+2]
	mov [m+si+1], bl
	mov [m+si+2],dl

	mov	ah, 4ch
	int	21h
	end	Start		