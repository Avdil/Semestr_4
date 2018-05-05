	.model 	Small
	.286
	.stack	100h
     	.data
Message	db	'hello word',10,13,'$'

Start:	mov	ax, @data
	mov	ds, ax
	mov	dx, offset Message
	mov	ah,9h
	int	21h
       	mov     ah,9h 
       	mov     ah,9h 
       	int     21 h  
       	mov     ah,9h
       	int     21h  
       	mov     ah, 4ch
       	int     21h
       	end     start        			