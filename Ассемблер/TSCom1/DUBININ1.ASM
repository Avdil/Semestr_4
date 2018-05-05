	.model small
	.286
	.data
a	db	10,13, 'Net stroki',10,13,'$'
	.code
;sreda okrucheniya	
start:	mov ax,[es:2ch]
	mov ds,ax
	mov di,0
	mov si,0
	mov bp,5	
; sravnenie iskomogo nomera stroki s tekyshim nomerom stroki	
k4:	inc di
	cmp di,bp
	je k3
k1:	mov dl,[ds:si]
	inc si
	cmp dl,0
	jne k1
	mov dl,[ds:si]
	inc si
	cmp dl,0
	jne k4
	jmp k2
; vivod stroki s iskomum nomerom	
k3:	mov ah,2h
	int 21h
	mov dl,[ds:si]
	cmp dl,0
	je k5
	inc si
	jmp k3
; net stroki	
k2:	mov	ax,@data
	mov	ds,ax
	mov	dx, offset a
	mov	ah, 9h
	int 	21h	
;exit
k5:	mov ah,4ch
	int 21h

	end start