; multi-segment executable file template.

data segment
    ; add your data here!
    pkey db "press any key...$"
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
     mov cx,21
   mov bl,3 
   mov ax,0
   dongu:
   mov ax,0    
   mov ax,cx
   div bl
   cmp ah,0    
   je topla
   loop dongu
     
    topla:
     add dx,cx
   loop dongu
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
