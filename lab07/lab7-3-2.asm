%include 'in_out.asm'
section .data
msgx: db "Введите x: ",0
msga: db "Введите a: ",0
msgf: db "Результат: ",0
section .bss
x: resb 80
a: resb 80
res: resb 80
section .text
global _start
_start:

mov eax,msga
call sprint

mov ecx,a
mov edx, 80
call sread
mov eax,a
call atoi
cmp eax,8
jl _add_8
jmp _mul_a_x

_add_8:
mov eax,msgx
call sprint

mov ecx,x
mov edx, 80
call sread
mov eax,x
call atoi

add eax, 8
jmp _end

_mul_a_x:
mov edx, a
mov eax, x
mul edx

_end:
mov ecx, eax
mov eax, msgf
call sprint
mov eax, ecx
call iprintLF
call quit
