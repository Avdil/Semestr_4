	.model	Small
	.286
	.code

k1:	mov	dx, 10			;10 - ��� �������� �� ����� ������
	mov	ah, 02h
	int	21h
	int 21h
	int 21h
	int 21h				;��������� �� 4� ������
	mov	si, 0			;��� ���������� �������
	mov	cx, 0			;��� �������� ����� ������
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
	cmp	si, 27			;�������� �� ����������� �������)
	je	k2
	cmp	si, 256 		;�������� ���������� �������
	je	j1
	cmp	cx, 16			;�������� ����� ������
	je	k5
	
	mov	dx, si			
	mov	ah, 02h			;����� �������
	int	21h
	mov	dx, 0
	mov	ah, 02h			;������ ����� ���������
	int	21h
	inc si
	inc cx
	jmp	k4

k2:	mov	dx, 0
	mov	ah, 02h			;����� ���� �������� ������ ����������� ��������
	int 21h
	int 21h
	inc si
	inc cx
	jmp	k4
	
k5:	mov	dl, 179			;������������ ����� � ����� � ������ ������
	mov	ah, 02h
	int	21h

k6:	mov	dl, 10			;������� �� ����� ������
	mov	ah, 02h
	int	21h
	mov	dl, 13			;������� � ������ ������
	mov	ah, 02h
	int	21h
	mov	cx, 0
	mov	bx, 0


k7:	mov	dl, 0			;������� �� 25� �������
	mov	ah, 02h			;������
	int	21h
	inc	bx
	cmp	bx, 44
	jne	k7
	jmp	k8

j1:	mov	dl, 13			;������� � ������ ������
	mov	ah, 02h
	int	21h
	mov	bx, 0
	jmp	n3

n1:	mov	dl, 0			;25 ��������
	mov	ah, 02h
	int	21h
	inc	bx
	cmp	bx, 44			; ���� �� ������� 25 �������� ������������ � �1
	jne	n1
	mov	bx, 0
	mov	dl, 218			;�����
	mov	ah, 02h
	int	21h
n2:	mov	dl, 196			;�������������� ����� 
	mov	ah, 02h
	int	21h
	inc	bx
	cmp	bx, 33			;��������� 33 ����
	jne	n2			;���� �� ����� �����
	mov	dl, 191			;������ - �����
	mov	ah, 02h
	int	21h
	mov	bx, 0

	mov	dl, 10			;����� ������
	mov	ah, 02h			
	int	21h
	mov	dl, 13
	mov	ah, 02h
	int	21h	
	jmp	k7


k8:	mov	dl, 179			;�����
	mov	ah, 02h
	int	21h
	mov	dl, 0			;������
	mov	ah, 02h
	int	21h
	jmp	k4
	

n3:	mov	dl, 0			;����� 25 ��������
	mov	ah, 02h
	int	21h
	inc	bx
	cmp	bx, 44
	jne	n3			;���� �� ����� 
	mov	dl, 192			;�����
	mov	ah, 02h
	int	21h
	mov	bx, 0
n4:	mov	dl, 196			;����� 
	mov	ah, 02h
	int	21h
	inc	bx
	cmp	bx, 33
	jne	n4
	mov	dl, 217			;�����
	mov	ah, 02h
	int	21h
	mov 	dl, 10
	int 21h
	int 21h
	int 21h
	int 21h				;4 �������� �� ����� ������, ����� ���� ���� ����������
	mov	ah, 4ch
	int	21h
	end	k1