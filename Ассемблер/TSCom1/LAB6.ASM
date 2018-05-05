	.model small
	.286
	.stack 100h
	.data
msg	db 'Hello World', 10, 13, '$'
sname	db 'Shemshedinov Osman', 10, 13, '$'	
group	db 'CS-1-15', 10, 13, '$'
	.code
	mov ax, @data
	mov ds, ax
	mov dx, offset msg
	mov ah, 9h
	int 21h
	mov dx, offset sname
	int 21h
	mov dx, offset group
	int 21h
	mov ah, 4ch
	int 21h
	end
	