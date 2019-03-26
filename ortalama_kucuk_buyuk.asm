; multi-segment executable file template.

data segment
    sayi db 5 dup(0)
    sayi2 db 0
    sayi3 db 2 
    sayi4 db 10
    enbuyuk db 0 
    enkucuk db 255
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax 
    
    lea si,sayi
    mov cx,5
    dongu:
         call verial
         sub al,30h
         mov [si],al
         inc si
    loop dongu
    
    mov cx,5
    lea si,sayi
    dongu1:
    mov al,[si]
    add sayi2,al
    inc si
    loop dongu1
    mov ah,0
    mov al,sayi2
    call sayiyaz
    
    mov al,sayi2
    mov bl,5
    mov ah,0
    div bl
    mov ah,0
    call sayiyaz
    
    lea si,sayi
    mov cx,5
    dondunya:
    mov al,[si]
    cmp al,enbuyuk
    ja git 
    inc si
    loop dondunya
    jmp x
    git:
    mov enbuyuk,al
    inc si
    loop dondunya
    x:
    mov ah,0
    mov al,enbuyuk
    call sayiyaz
    
    
    
    lea si,sayi
    mov cx,5
    dondunya1:
    mov al,[si]
    cmp al,enkucuk
    jb git1 
    inc si
    loop dondunya1
    jmp x1
    git1:
    mov enkucuk,al
    inc si
    loop dondunya1
    x1:
    mov ah,0
    mov al,enkucuk
    call sayiyaz
    
    int 20h
ends
verial proc
    mov ah,00h
    int 16h
    ret
verial endp
sayiyaz proc
    mov cx,3
    dongu3:
    div sayi4
    push ax
    mov ah,0
    loop dongu3
    
    
    mov cx,3
    dongu2:
    pop ax
    mov dl,ah
    add dl,30h
    call karakteryaz
    loop dongu2
    ret
sayiyaz endp
karakteryaz proc
    mov ah,02h
    int 21h
    ret
karakteryaz endp    

end start ; set entry point and stop the assembler.
