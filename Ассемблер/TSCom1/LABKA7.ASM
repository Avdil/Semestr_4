	.model small
	.286
	.data
a	db	"stroka HOMEP ",10,13 '$'
b	db	"stroka ne syshectvyet",'$'
HOMEP	db	3	
	.code
	mov ax,[es:2ch]
	mov es,ax
	mov di,0
	mov ax,data
	mov ds,ax
	mov bp,HOMEP
k4:	
	inc di
	cmp di,bp
	je k3
k1:
	mov dl,[ds:di]