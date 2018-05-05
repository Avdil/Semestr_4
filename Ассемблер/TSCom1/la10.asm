.model small
.286
.data
a	db 'Stroki s zadanim simvolom ne sushestvuet!$'
b	dw  '!'


.code
; sreda okrujeniya
start:
	mov ax, @data
	mov ds, ax
	mov bp, b
	mov ax,[es:2ch]
	mov ds,ax
	mov di,0; tekushiy simvol stroki
	mov si,0; perviy simvol stroki

; sravneniye tekushego sroki s iskomim
k4:	cmp [ds:di], bp
	je k3
	inc di
	jmp k4

k1: 	mov di,si
	inc di
	cmp [ds:di], 0
	je k5
	jmp k4
	
k3:	mov dl,[ds+si]
	mov ah,2h
	int 21h
	mov dl, 0
	inc si
	cmp [ds+si], 0
	je k1
	jmp k3
	

;exit
k5:
mov ah,4ch
int 21h
end start