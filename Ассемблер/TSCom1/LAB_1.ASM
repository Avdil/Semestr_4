		.model	small
		.286
		.stack	100h
		.data
Message		db	'Hello world',10,13,'$'
Nm		db	'Avdil Salie',10,13,'$'
Group		db	'i_2_15','$'
		.code
Start:		mov	ax, @data
		mov	ds,ax
		mov	dx, offset Message
		mov	ah,9h
		int	21h
		mov	dx, offset Nm
		mov	ah,9h
		int	21h
		mov	dx, offset Group
		mov	ah,9h
		int	21h	
		mov	ah,4ch
		int	21h
		end	Start