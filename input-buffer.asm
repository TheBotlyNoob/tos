[org 0x7c00]

%define bufLen 10

buf:
    times bufLen db 0


mov bx, buf

main:
    mov ah, 0x00
    int 0x16
    mov [bx], al ; move char to buffer
    inc bx ; increment buffer pointer
    
    cmp bx, buf + bufLen ; check if buffer is full
    je done
    jmp main

done:
    sub bx, bufLen + 1
    mov cl, bufLen


l1:
    inc bx
    
    mov ah, 0x0e
    mov al, [bx]
    int 0x10
    
    dec cl
    jnz l1

times 510 - ($ - $$) db 0
db 0x55, 0xaa