; multi-segment executable file template.

data segment
    str db 'karabuk'
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
    
    mov ax,0
    mov cx,7
    lea si,str
    
    dongu:
    mov al,[si]
    cmp al,97
    jae buyukyap
    inc si
    loop dongu
    jmp son
   
    
    buyukyap:
    sub al,32
    inc si
    loop dongu
    son:
      
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
