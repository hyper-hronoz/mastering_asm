.model   small
.stack   100h
.data
message1 db 'I dont care if u ruin me apart', 13, 10, '$'
message2 db 'My name is Moryakov WhatISLove', 13, 10, '$'
message3 db 'Group: IUK4-32B', 13, 10, '$'
perem_1 db 0ffh
perem_2 dw 3a7fh
perem_3 dd 0f54d567ah
mas      db 10 dup (' ')
pole_1 db 5 dup (?)
adr      dw perem_3
adr_full dd perem_3
numbers  db 11, 34, 56, 23
fin      db 'EOS', '$'

.code

start:
	mov ax, @data
	mov ds, ax ; data segmentation begins in this register
	mov ah, 09h ; string output funcation
	mov dx, offset message1
	int 21h
	mov dx, offset message2
	int 21h
	mov dx, offset message3
	int 21h
	mov ah, 7h ; pause
	int 21h
	mov ax, 4c00h ; enable exit
	int 21h
	end start
