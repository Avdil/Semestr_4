	.model small
	.286
	.data
	.code
;probel
probel macro
	mov [ds:si],' '  
	inc si  
	mov [ds:si],00011100b
	inc si
	mov [ds:si], ' '
	inc si
	mov [ds:si], 00011100b
	inc si
endm
start:	
	mov ah,00h
	mov al,03h
	int 10h
;zadanie na4alnogo polojeniya	
	mov ax,0b800h  
	mov ds,ax  
	mov si,1180
	mov bp,0
	
	mov [ds:si],218 ;ramka
	inc si  
	mov [ds:si],00011100b 
	inc si
;tcikl ramki	
	mov cx,48
qw:	mov [ds:si],196  
	inc si  
	mov [ds:si],00011100b
	inc si	
loop qw
;ramka
	mov [ds:si],191
	inc si  
	mov [ds:si],00011100b
	inc si

	add si,60 	;perehod na novuyu stroku	
	mov [ds:si],179  
	inc si  
	mov [ds:si],00011100b
	inc si
	
k1:	cmp di,16
	;proverka  ;nomer simvola v stroke
	jne k2
	mov di,0

	;ramka
	mov [ds:si],179  
	inc si  
	mov [ds:si],00011100b
	inc si
	add si,60	;novaya stroka
	mov [ds:si],179  
	inc si  
	mov [ds:si],00011100b
	inc si
k2:	cmp bp,256	;proverka poslednego elementa  ;nomer simvola
	je exit
	
	;vivod elementa
	probel

	mov [ds:si],bp  
	inc si  
	mov [ds:si],00011100b
	inc si 
	
	inc bp
	inc di
	jmp k1
;ramka	
exit:	
	add si,-2
	mov [ds:si],192  
	inc si  
	mov [ds:si],00011100b
	inc si
	mov cx,48
qw1:	mov [ds:si],196	  
	inc si  
	mov [ds:si],00011100b
	inc si
loop qw1
	mov [ds:si],217  
	inc si
	mov [ds:si], 00011100b
	inc  si
	mov ah,4ch ;vihod
	int 21h
end start