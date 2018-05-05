.model small
.286
.data
a	db 'Stroki s nomerom $'
b	db	' ne sushestvuet!$'
c	dw  1
w	db 10,13,'$'

  ;nomer stroki
d 	db 	'     ', '$'
e 	dw 	10

.code
; sreda okrujeniya
start:
	mov ax, @data
	mov ds, ax
	mov bp,c ;nomer iskomoy stroki
	mov dx, offset w
	mov ah, 9h
	int 21h
	mov ax,[es:2ch]
	mov ds,ax
	mov di,0; tekushiy nomer stroki
	mov si,0; smesheniy v segmente sredy okrujeniya 

; sravneniye nomera iskomoy stroki s tekushim nomerom stroki 
k4: 	inc di
	cmp di,bp
	je k3
k1: 
	mov dl,[ds:si]
	inc si
	cmp dl,0
	jne k1
	mov dl,[ds:si]
	inc si
	cmp dl,0
	jne k4
	jmp k2
;vyvod stroki s iskomym nomerom
k3:
	mov ah,2h
	int 21h
	mov	dl,0
	mov dl,[ds:si]
	cmp dl,0
	je k5
	inc si
	jmp k3
; net stroki
k2:	mov	ax, @data
	mov ds, ax
	mov si, 4
	mov ax, bp
	mov	dx, 0
	
k6:	div e
	add dl, 30h
	mov	[d+si], dl
	dec si
	mov	dx, 0
	cmp	ax, 0
	jne	k6
	mov	dx, offset a	
	mov	ah, 9h
	int	21h
	mov	dx, offset d	
	mov	ah, 9h
	int	21h
	mov	dx, offset b	
	mov	ah, 9h
	int	21h
	


;exit
k5:
	mov ah,4ch
	int 21h
	end start