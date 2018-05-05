	.model small
	.286
	.data
a	db 10,13,'$'
	.code
probel	macro ;vyvod probela
	mov dl,20h ; output ' '
	mov ah,02h
	int 21h
	endm ; function konca macrosa
	
start:	mov ax,@data; @2data-adres segmenta dannih
	mov ds,ax
	mov si,0 ; kod simvola
	mov cx,2
	
k1:	mov dx, offset a; dlya perehoda na 4 vniz
	mov ah,09h
	int 21h
	loop k1
	
m2:	mov dx, offset a; dlya perevoda v nachalo stroki
	mov ah,09h
	int 21h
	mov cx,24
	mov di, 0 ;schenchik simvolov v stroke
	
k2:	mov dl,20h ;dlya pechati 25 probelov
	mov ah,02h
	int 21h
	loop k2
	
k3:	cmp di, 16; proverka na 16 simvol stroki
	je m2
	cmp si,7
	je m1
	cmp si,8
	je m1
	cmp si,9
	je m1
	cmp si,10
	je m1
	cmp si,13
	je m1
	
	cmp si,256 ;proverka konca vyvoda
	je konec
	mov dx,si
	mov ah,02h
	int 21h
	inc si
	inc di
	jmp k3
	
m1:	probel ;vyvod probela
	inc si
	inc di
	jmp k3
	
konec:	mov ah,08h
	int 21h
	end start
	