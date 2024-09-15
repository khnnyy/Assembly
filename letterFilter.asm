here:
    mov ah, 08
    int 21H
    cmp al, 0Ah
    je exit
    cmp al, 41h
    jb here
    cmp al, 5Ah
    ja there
    
    mov ah, 02
    mov dl, al
    int 21H
    jmp here
    
    there:
    cmp al, 61h
    jb here
    cmp al, 7Ah
    ja here
    mov ah, 02
    mov dl, al
    int 21H
    jmp here
    

    exit:
    int 20H
    