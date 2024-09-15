jmp start

menaloc label byte
max_len db 255
act_len db ?
act_input db 50 dup('$')

start:
    mov ah, 0Ah
    lea dx, menaloc
    int 21h
    mov cl, [act_len]
    lea bx, act_input
    lea si, act_input
     
    add si, bx
    dec si
    
next:
    cmp bx, si
    jge display
    mov al, [bx]
    mov cl, [si]
    mov [bx], cl
    mov [si], al
    inc bx
    dec si
    jmp next 
    
 
display:
    mov ah, 09
    lea dx, act_input
    int 21h
    ret
