; multi-segment executable file template.

data segment
    dizi db 'karabuk' 
    harf db 0
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
     
    mov cx,7 
    lea si,dizi
    
    dongu:
    mov al,[si]
    cmp al,61h
    je git
    inc si
    loop dongu
    jmp son 
    git:
    inc bl
    inc si  
    loop dongu  
    son: 
      
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
