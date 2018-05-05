	.model small
	.286	
	.data
a	db 'Stroki s zadannim simvolom ne sushestvuet $'
c	db "1"		
w	db 10,13,'$'

	.code
		
start:	mov ax, @data
	mov ds, ax 
	mov dx, offset w
	mov ah, 9h
	int 21h
	mov bl,c
	mov ax,[es:2ch]
	mov ds,ax
	mov di, 0;smeshenie v segmente sredi okrujeniya
	mov si, 0;nachalo stroki
	mov bh, 0

k4:	mov dl, [ds:di];ds-adres sredi okrujeniya
	inc di
 	cmp dl, bl
	je k3
	

k1: 	cmp dl,0
	jne k4
	mov dl,[ds:di]
	cmp dl,0
	je k2
	mov si, di
	jmp k4

k3:	mov bh, 1	
	mov dl,0
	mov dl,[ds:si]
	cmp dl,0
	je k8
	mov di, si
	mov ah, 2h
	int 21h
	inc si
	jmp k3
	
k8:	mov di, si
	mov ax, @data
	mov ds, ax
	mov dx, offset w
	mov ah, 9h
	int 21h	
	mov ax, [es:2ch]
	mov ds, ax
	jmp k4
		
k2:	cmp bh, 1
	je k5
	mov ax, @data
	mov ds, ax
	mov dx, offset a
	mov ah, 9h
	int 21h
	
k5:	mov ah,4ch
	int 21h
	end start

	