; multi-segment executable file template.

data segment
    sonuc dw 0
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

    mov cx,10
    
    mov bl,3
    
    dongu:
      mov ax,cx   
      div bl
      cmp ah,0
      je git
    
    
    
    loop dongu
    jmp son
       git:
       add sonuc,cx
    loop dongu
    son:
    
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
