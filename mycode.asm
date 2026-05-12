org 100h

section .data

MSG db "ASSEMBLY PROJECT",13,10
    db "Children Learning App",13,10
    db "Press any key to start...",13,10,'$'

TESTT db 13,10,"1.STUDY OR *.Exit$"

TESTT1 db 13,10,"STUDY",13,10
       db "Input Alphabet or Digit$"

FORMSG db " for $"

a db "Apple.$"
b db "Ball.$"
c db "Cat.$"

TNX db 13,10,"THANK YOU$"
INV db 13,10,"INVALID INPUT$"

newline db 13,10,'$'

section .text

start:

; show intro
mov ah,9
mov dx,MSG
int 21h

; wait key
mov ah,1
int 21h

top:

call print_newline

mov ah,9
mov dx,TESTT
int 21h

mov ah,1
int 21h

mov bl,al

cmp bl,'1'
je study

cmp bl,'*'
je exit_program

jmp top

study:

call print_newline

mov ah,9
mov dx,TESTT1
int 21h

main_loop:

call print_newline

mov ah,1
int 21h

mov bl,al

cmp bl,'*'
je exit_program

mov ah,9
mov dx,FORMSG
int 21h

cmp bl,'A'
je show_a

cmp bl,'a'
je show_a

cmp bl,'B'
je show_b

cmp bl,'b'
je show_b

cmp bl,'C'
je show_c

cmp bl,'c'
je show_c

mov ah,9
mov dx,INV
int 21h

jmp main_loop

show_a:
mov ah,9
mov dx,a
int 21h
jmp main_loop

show_b:
mov ah,9
mov dx,b
int 21h
jmp main_loop

show_c:
mov ah,9
mov dx,c
int 21h
jmp main_loop

exit_program:

call print_newline

mov ah,9
mov dx,TNX
int 21h

mov ah,4ch
int 21h

print_newline:
mov ah,9
mov dx,newline
int 21h
ret