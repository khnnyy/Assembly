jmp start

menaloc label byte   
max_len db 50
act_len db ?
act_input db 50 dup('$') 

start:
    mov ah, 0Ah
    lea dx, menaloc
    int 21h
    mov cl, [act_len]
    lea bx, act_input
        
main:
    mov al, [bx]
    cmp al, '1'
    je bef
    cmp al, '2'
    je cef
    cmp al, '3'
    je def
    cmp al, '4'
    je eef
    cmp al, '5'
    je fef
    cmp al, '6'
    je gef
    cmp al, '7'
    je hef
    cmp al, '8'
    je ief
    cmp al, '9'
    je jef
    cmp al, '0'
    je kef
    jmp next

bef:
    mov [bx], '0'
    jmp next

cef:
    mov [bx], '9'
    jmp next
    
def:
    mov [bx], '8'
    jmp next

eef:
    mov [bx], '7'
    jmp next
fef:
    mov [bx], '6'
    jmp next

gef:
    mov [bx], '5'
    jmp next
hef:
    mov [bx], '4'
    jmp next

ief:
    mov [bx], '3'
    jmp next
jef:
    mov [bx], '2'
    jmp next

kef:
    mov [bx], '1'
    jmp next

next:
    inc bx
    dec cl
    jnz main
    
display:
    mov ah, 09
    lea dx, act_input
    int 21h
    ret
