jmp start

menaloc label byte   
max_len db 50
act_len db ?
act_input db 50 dup('$') 

start:
    mov ah, 0Ah
    lea dx, menaloc
    int 21h
    int 20h