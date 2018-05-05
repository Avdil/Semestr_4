	.model	small
	.286
	.data
yanat	db	'ne syshestvuet',10,13,'$'
yanat1	db	10,13,'Iskomaya stroka  : ','$'
f	dw	5
	.code
;sreda okryjeniya
go:	mov	ax, @data
	mov	ds, ax
	mov	dl, 5
	add	dl, 30h
	mov	yanat1+[18], dl
	mov	bp, f
	mov	dx, offset yanat1
	mov	ah, 9h
	int	21h
	
	mov	ax, [es:2ch]
	mov	ds, ax
	mov	di, 0;tekushiy nomer stroki
	mov	si, 0;smeshenie v segmente sredy okryjeniya
	;mov	bp, 3;nomer iskomoy stroki
;sravnenie nomera iskomoy sroki s tekushim nomerom stroki
k4:	inc	di
	cmp	di, bp
	je	k3
k1:	mov	dl, [ds:si]
	inc	si
	cmp	dl, 0
	jne	k1
	mov	dl, [ds:si]
	inc	si
	cmp	dl, 0
	jne	k4
	jmp	k2
	
;vvod stroki s iskomym nomerom
k3:	;mov	ax, [es:2ch]
	;mov	ds, ax
	mov	ah, 02h
	int	21h
	mov	dl, 0
	mov	dl, [ds:si]
	cmp	dl, 0
	je	k5
	inc	si
	jmp	k3
;net stroki
k2:	mov	ax, @data
	mov	ds, ax
	mov	dx, offset yanat
	mov	ah, 9h
	int	21h
	
k5:	mov ah, 4ch
	int 21h
	end go