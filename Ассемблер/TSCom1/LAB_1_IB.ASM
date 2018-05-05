	.model	Small
	.286
	.stack	100h
	.data
Message	db	'Hello world', 10, 13, '$'
Mess1	db	'Ibraimov A.G', 10, 13, '$'
Mess2	db	'Group I-1-15',10, 13, '$' 
	.code
Start:	mov	ax, @data
	mov	ds, ax
	mov	dx, offset Message
	mov	ah, 9h
	int	21h
	mov	dx, offset Mess1
	mov	ah, 9h
	int	21h
	mov	dx, offset Mess2
	mov	ah, 9h
	int	21h
	mov	ah, 4ch
	int	21h
	end	Start