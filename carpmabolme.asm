; multi-segment executable file template.

data segment
    sayi1 db 3
    sayi2 db 6 
    sonuc db ?
    sonuc1 db ?
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
    
    mov bl,sayi1
    mov cl,sayi2   
    mov dl,0
    carpma:
        add dl,bl
        cmp cl,1
        je son 
  
    loop carpma
               
    son:  
     mov dh,sayi1
     mov ch,sayi2
     mov bh,sayi2
     mov bl,0
    bolme:
         sub bh,dh
         cmp bh,sayi1
         inc bl
         jb git
         
   loop bolme
   git:           
           mov sonuc,dl
           mov sonuc1,bl
    
    
    
    
    
    
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
