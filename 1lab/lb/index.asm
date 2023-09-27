.model   small
.stack   100h
.data
message1 db 'The first step is hard', '$'
message2 db 'Wish nevoskie', '$'
message3 db '116-27 y before Christ', '$'
sername  db 'Moryakov', '$'
group    db 'IUK4-32B', '$'
job      db 'IT', '$'
.code

start:
	mov ax, @data; moving data to ax register
	mov ds, ax; setting ax to data segment do begin work with it

	;   secreent cleaning
	mov ax, 0600h; clear screen request
	mov bh, 3fh
	mov cx, 0
	mov dx, 184Fh; screen filling
	int 10h; bios interrupt

	;   cursor centring
	mov ah, 2; set cursor position
	mov dh, 9; row - high register
	mov dl, 12; column - low register
	mov bh, 0; page number
	int 10h; bios interrupt mode selection confirmation

	;   message1 output
	mov ah, 9; write character and attribute at cursor position
	mov dx, offset message1
	int 21h; dos interrupt output from dx

	;   cursor centring
	mov ah, 2
	mov dh, 10
	mov dl, 12
	mov bh, 0
	int 10h

	;   message2 output
	mov ah, 9; write character and attribute at cursor position
	mov dx, offset message2; making offster from prev message 2byte probably
	int 21h

	;   cc
	mov ah, 2
	mov dh, 11
	mov dl, 12
	mov bh, 0
	int 10h

	;   m3o
	mov ah, 9
	mov dx, offset message3
	int 21h

	;   Левый верхний угол Курсор в угол
	mov ah, 2
	mov dh, 0
	mov dl, 0
	mov bh, 0
	int 10h

	;   mo
	mov ah, 9
	mov dx, offset sername
	int 21h

	;   cursor position
	mov ah, 2; setting cursor postion mode
	mov dh, 0; rows
	mov dl, 60; columns
	mov bh, 0; page again
	int 10h; run in this mode

	;   m.o.
	mov ah, 9; selecting text position by cursor
	mov dx, offset job
	int 21h

	;   cursor position
	mov ah, 2
	mov dh, 20
	mov dl, 0
	mov bh, 0
	int 10h

	;   m.o.
	mov ah, 9
	mov dx, offset group
	int 21h

	;   cursor position
	mov ah, 2
	mov dh, 20
	mov dl, 60
	mov bh, 0
	int 10h

	;   character fill
	mov ah, 9
	mov al, '!'
	mov bl, 00001100b; fill color 
	or bl, 10000000b; most significant bit enables blinking
	mov cx, 5; number of times to write char
	int 10h

	;   not required removes screen disabling
	mov ah, 7
	int 21h

	;   clearing trash
	mov ax, 4c00h
	int 21h
	end start
