; multi-segment executable file template.

data segment
    
    sayi1 db 5
    sayi2 db 3
    sonuc db 0 
    sonuc2 db 0
    
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
    
    mov cx,0
    mov cl,sayi1
    mov bl,sayi2
    mov ax,0
    dongu:
     add al,bl
    loop dongu
 
        mov sonuc,al
        
   mov dl,sayi1
    bolme:
      inc sonuc2
      sub dl,sayi2
      cmp dl,sayi2
      jb son
    loop bolme
     son:
           
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
