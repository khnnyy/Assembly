
org 100h

jmp start


reversed db 055Hdup("$")

msg db "$$$$$$$$$$$$" 

exit_msg db 'press any key to exit!','$'

    

memory label byte
max_len db   055H
act_len db     ?
act_strng db 055Hdup("$")  



start: 

    mov ah,0ah
    lea dx,memory
    int 21h       

    call nxtline
 
    mov cl,[act_len]

line:
    mov ah,02
    mov dl,'-'
    int 21h
    loop line


    call nxtline

;solution 1
    mov bx,0
    mov cx,0
    mov cl,[act_len]
    inc cl

here:
    mov ah,02  
    mov dl,[act_strng + bx]
    inc bx
    dec cl
    jnz find
    ret   


    call nxtline  
    call nxtline
    
find:
    cmp dl, 41h
    jb here
    cmp dl, 5Ah
    ja there
    int 21H
    add dl, 20H
    jmp here
    
there:
    cmp dl, 61h
    jb here
    cmp dl, 7Ah
    ja here
    int 21H 
    sub dl, 20H
    jmp here
     

nxtline:
    mov ah,02  
    mov dl,0Dh
    int 21h
    mov dl,0Ah
    int 21h

    ret
