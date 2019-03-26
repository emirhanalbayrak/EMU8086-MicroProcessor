; multi-segment executable file template.

data segment
    sayi1 db 5
    sayi2 db 7 
    sonuc db ?
    sonuc1 db ?
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
    
    mov bl,sayi1
    add bl,sayi2
    
    mov bh,sayi2
    sub bh,sayi1
    
    mov al,sayi1
    mul sayi2
    mov dl,al
    
    mov ax,0 
    
    mov al,sayi2
    div sayi1
    mov dh,al
    
    mov cl,sayi1
    mov ch,sayi2
    
    cmp cl,ch
    jae bas
    jb  basma
    bas: 
    mov cl,sayi1 ;buyuk sayi 
    mov ch,sayi2 ;kucuk sayi
    mov dh,sayi1
    sub dh,sayi2
    jmp x
    basma:
    mov cl,sayi1  ;buyuk sayi
    mov ch,sayi2  ;kucuk sayi
    mov dh,sayi2
    sub dh,sayi1
       x:
       
    
    
   
     
   
   
   
   
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
