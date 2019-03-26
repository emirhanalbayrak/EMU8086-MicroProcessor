; multi-segment executable file template.

data segment
    dizi db 1,2,3,4,5
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
    lea si,dizi
    mov cx,5
    dongu:
         add al,[si]
         inc si
    
    
    loop dongu
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
