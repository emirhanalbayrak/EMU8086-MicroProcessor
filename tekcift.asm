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
    ;tek mi çcift mi
     mov ax,0
     mov al,sayi
     mov cl,sayi
     mov bl,2
     div bl
     cmp ah,0
     je tek
     jmp cift
      tek:
      mov ciftsayi,cl
      jmp son
      cift:
      mov teksayi,cl
       son:
     
    
    
    
    
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
