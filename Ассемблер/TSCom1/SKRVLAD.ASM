	.model small
	.286
	.code
vivod macro;vivod probelov
	mov al,20h
	mov cx,1
	mov ah,09h
	mov bh,0
	int 10h
	endm
start:
	mov ah,00h
	mov al,03h
	int 10h
	mov di,0
	mov si,0
	mov dh,3
m1:	mov di,0
	inc dh
	mov dl,25
	mov bh,0
	mov ah,02h
	int 10h
k1:
	cmp dl,16
	je m1
	cmp si,7
	je k2
	cmp si,8
	je k2
	cmp si,9
	je k2
	cmp si,10
	je k2
	cmp si,13
	je k2
	cmp si,256
	
	
;vivdo simvolov
	mov ax,si
	mov cx,1
	mov ah,09h
	mov bh,0
	mov bl,21
	int 10h
	inc si
	inc di
	jmp k1
k2:
        vivod
	inc si
	inc dl
	jmp k1 
konec:
	mov ah,4ch
	int 21h
	end start
	