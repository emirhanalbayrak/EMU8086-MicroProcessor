; multi-segment executable file template.

data segment
    sayi db 3
    ciftsayi db ?
    teksayi db ?
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
    mov al,sayi
    mov bl,2
   
        div bl
        cmp ah,0
        je cift
        mov teksayi,al
        jmp son
    
    
    cift:
    mov ciftsayi,al 
    son:
      
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
