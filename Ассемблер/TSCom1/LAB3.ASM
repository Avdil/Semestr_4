         .model Small
         .286
         .data
a        db 10,13,'Put zapuska: $'
         .code
Start:    mov ax,@data
         mov ds,ax
         mov dx,offset a 
         mov ah,9h
         int 21h
         mov ax,[es:2ch]
	 mov ds,ax
	 mov si,0
a2:      mov al,[ds:si]
         cmp al,0
         jne a1
         inc si
         mov al,[ds:si]
         cmp al,0
         jne a1
         jmp a3
a1:	 inc si
         jmp a2
a3:     
         add si,3
a5:
         mov al,[ds:si]  
         cmp al,0
         je a4
         mov ah,02h
         mov dl,al
         int 21h
         inc si
         jmp a5
         
a4:      
         mov ah,4ch
         int 21h
         end start
         
         