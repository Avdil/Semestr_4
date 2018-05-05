	.model	Small
	.286
	.code

k1:	mov	dx, 10			;10 - код перехода на новую строку
	mov	ah, 02h
	int	21h
	int 21h
	int 21h
	int 21h				;переходим на 4ю строку
	mov	si, 0			;код выводимого символа
	mov	cx, 0			;для проверки конца строки
	jmp	n1

k4:	cmp	si, 7
	je	k2
	cmp	si, 8
	je	k2
	cmp	si, 9
	je	k2
	cmp	si, 10
	je	k2
	cmp	si, 13
	je	k2
	cmp	si, 27			;проверки на невыводимые символы)
	je	k2
	cmp	si, 256 		;проверка последнего сомвола
	je	j1
	cmp	cx, 16			;проверка конца строки
	je	k5
	
	mov	dx, si			
	mov	ah, 02h			;вывод символа
	int	21h
	mov	dx, 0
	mov	ah, 02h			;пробел между символами
	int	21h
	inc si
	inc cx
	jmp	k4

k2:	mov	dx, 0
	mov	ah, 02h			;вывод двух пробелов вместо невыводимых символов
	int 21h
	int 21h
	inc si
	inc cx
	jmp	k4
	
k5:	mov	dl, 179			;вертикальная рамка в конце и начале строки
	mov	ah, 02h
	int	21h

k6:	mov	dl, 10			;переход на новую строку
	mov	ah, 02h
	int	21h
	mov	dl, 13			;переход в начало строки
	mov	ah, 02h
	int	21h
	mov	cx, 0
	mov	bx, 0


k7:	mov	dl, 0			;переход на 25ю позицию
	mov	ah, 02h			;пробел
	int	21h
	inc	bx
	cmp	bx, 44
	jne	k7
	jmp	k8

j1:	mov	dl, 13			;переход в начало строки
	mov	ah, 02h
	int	21h
	mov	bx, 0
	jmp	n3

n1:	mov	dl, 0			;25 пробелов
	mov	ah, 02h
	int	21h
	inc	bx
	cmp	bx, 44			; пока не выведит 25 пробелов возвращаться в н1
	jne	n1
	mov	bx, 0
	mov	dl, 218			;рамка
	mov	ah, 02h
	int	21h
n2:	mov	dl, 196			;горизонтальная рамка 
	mov	ah, 02h
	int	21h
	inc	bx
	cmp	bx, 33			;повторять 33 раза
	jne	n2			;пока не будет равно
	mov	dl, 191			;уголок - рамка
	mov	ah, 02h
	int	21h
	mov	bx, 0

	mov	dl, 10			;новая строка
	mov	ah, 02h			
	int	21h
	mov	dl, 13
	mov	ah, 02h
	int	21h	
	jmp	k7


k8:	mov	dl, 179			;рамка
	mov	ah, 02h
	int	21h
	mov	dl, 0			;пробел
	mov	ah, 02h
	int	21h
	jmp	k4
	

n3:	mov	dl, 0			;вывод 25 пробелов
	mov	ah, 02h
	int	21h
	inc	bx
	cmp	bx, 44
	jne	n3			;если не равно 
	mov	dl, 192			;рамка
	mov	ah, 02h
	int	21h
	mov	bx, 0
n4:	mov	dl, 196			;рамка 
	mov	ah, 02h
	int	21h
	inc	bx
	cmp	bx, 33
	jne	n4
	mov	dl, 217			;рамка
	mov	ah, 02h
	int	21h
	mov 	dl, 10
	int 21h
	int 21h
	int 21h
	int 21h				;4 перехода на новую строку, чтобы табл была посередине
	mov	ah, 4ch
	int	21h
	end	k1