; multi-segment executable file template.

data segment
        sayi1 db 6
        sayi2 db 2
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
    mov al,sayi1
    mov bl,sayi2 
    
    not bl
    add bl,1
    add al,bl
    
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
