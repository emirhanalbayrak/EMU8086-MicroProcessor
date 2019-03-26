; multi-segment executable file template.

data segment
    sayi db 15
    sonuc db 0
    
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
    
    mov al,sayi
   
    mov bl,00000001b
    mov cx,16
     
     dongu:
     mov dl,0
     mov dl,al
     and dl, bl
     shr al,1
     cmp dl,1
     
     je birler 
     
     loop dongu
      
      jmp son
      
     birler:
     inc sonuc
     loop dongu   
      son:
         
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
