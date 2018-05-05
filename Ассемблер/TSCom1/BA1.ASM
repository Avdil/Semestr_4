	.model 	Small
;	.286												    	.286
     	.stack	100h
     	.data
Message	db	'Hello World',10,13,'$'
grupa   db     'I-3-14',10,13,'$'
fio     db     'Belyalov Arslanali',10,13,10,13,'$'
	.code	
st1:	mov	ax, @data
	mov	ds, ax
	mov	dx, offset Message
	mov	ah,9h
        int     21h
	mov     dx,offset grupa
       	int	21h
       	mov     dx,offset fio
       	mov     ah,9h
       	int     21h
       	mov     ah,4ch
       	int     21h
       	end	st1                 			