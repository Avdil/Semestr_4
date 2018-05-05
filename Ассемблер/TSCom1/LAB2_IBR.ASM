	.model small
	.286
	.data
a	dw	65535
	.code
start:	mov	ax,[ds:2ch]
	mov	ds,ax
	mov	si,0				
k1:	mov	dl,[ds:si]
	inc 	si
	cmp	dl,0
	jne	k1
	mov	dl,[ds:si]
	inc	si
	cmp	dl,0
	jne	k1
	add	si,2
k3:	mov	dl,[ds:si]
	cmp	dl,0
	jne	k2
	mov	ah,2h
	int	21h
	inc 	si
	jmp	k3
k2:	mov	ah,4ch
	int	21h
	end	start