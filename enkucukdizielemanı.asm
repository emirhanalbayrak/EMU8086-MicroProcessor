; multi-segment executable file template.

data segment
    dizi db 2,4,6,8,10,12 
    enkucuk db ?
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
    ;en buyuk bulan kod
    lea si,dizi
    mov bl,[si]
    mov cx,5
    dongu:
    inc si
    cmp bl,[si]
    ja degis
    devam:
    loop dongu
    jmp son
    
    degis:
    mov bl,[si]
    jmp devam
    
    son:
    mov enkucuk,bl
    
    
    
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
