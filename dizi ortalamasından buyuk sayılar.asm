; multi-segment executable file template.

data segment
    sayi db 21,42,5,17,8,9,51,12,32,3
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
    
    lea si,sayi
    mov cx,10
    mov ax,0
    mov bl,10
     dongu:
     
     add al,[si]
     inc si
     loop dongu
     
     div bl
     
     mov cx,0
     mov cx,10
     lea si,sayi
     buyuk:
     cmp [si],al
     ja git
     inc si
     loop buyuk
      jmp son
     git:
     inc sonuc
     inc si
     loop buyuk
       son:
         
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
