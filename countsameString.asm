org 100h

jmp input1

    
memory label byte
max_len db   21
act_len db     ?
act_strng db 21 dup("$")
  
memory2 label byte
max_len2 db   4
act_len2 db     ?
act_strng2 db 4 dup("$")


input1: 

    mov ah,0ah
    lea dx,memory
    int 21h       

    call nxtline
 
        
input2:
    mov ah, 0ah
    lea dx,memory2
    int 21h
    
    call nxtline 
  
    
;initialize registers
    mov di,0
    mov cx,0
    mov ax,0
    mov si,0
    mov cl,[act_len]
    mov ch,[act_len2]
    inc cl
    jmp here
  
next:
    inc si
    dec ch
    cmp ch, 0
    je reset
  
  
here:  
    mov dl,[act_strng + di]
    mov al,[act_strng2 + si]
    inc di
    dec cl
    cmp cl, 0
    jne find
    jmp count   

    call nxtline
    
find:
    cmp dl, al
    je next
    jne here
   
   
reset:
    inc bp
    mov si, 0
    mov al,[act_strng2 + si]  
    mov ch, [act_len2]
    jmp here
   
        
count:
    call convert
     

nxtline:
    mov ah,02  
    mov dl,0Dh
    int 21h
    mov dl,0Ah
    int 21h

    ret

convert:
    mov ax, bp
    mov cx,0
    mov dx,0
    label1:
        cmp ax,0
        je print1      
        mov bx,10        
        div bx                  
        push dx              
        inc cx               
        xor dx,dx
        jmp label1
    print1:
        cmp cx,0
        je exit
        pop dx
        add dx,48
        mov ah,02h
        int 21h
        dec cx
        jmp print1
     
        
exit:
    ret