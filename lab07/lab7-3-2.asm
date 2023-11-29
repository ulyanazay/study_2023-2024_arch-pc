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
mov eax,msgx
call sprint
mov ecx,x
mov edx, 80
call sread
mov eax,x
call atoi
mov [x], eax

mov eax,msga
call sprint

mov ecx,a
mov edx, 80
call sread
mov eax,a
call atoi
mov [a],eax

mov ecx,[a]
cmp ecx, 8
je _men
jne _bol

_men:
mov eax,[a]
mov ebx,8
add eax,ebx
mov [res],eax
jmp _fin

_bol:
mov eax, [a]
mov ebx,x
imul eax,ebx
mov [res],eax
jmp _fin

_fin:
mov eax, msgf
call sprint
mov eax, [res]
call iprintLF
call quit




