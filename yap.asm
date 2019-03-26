; multi-segment executable file template.

data segment
   sayi1 db 2 
   dizi db 3 dup(0)
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
    
    lea si,dizi
    mov cx,3
    dongu2:      
     call verial
     sub al,30h
     mov [si],al
     inc si
     loop dongu2
          
    
    lea si,dizi
    lea di,dizi
    inc di
    
    x:
    mov cx,0
    mov cl,sayi1
    
    dongu:
    mov al,[si]
    mov bl,[di]
    cmp al,bl
    ja git
    inc di
    loop dongu
    jmp atla 
     git:
     mov [si],bl
     mov [di],al
     inc di
    loop dongu
    atla:      
    dec sayi1      
    cmp sayi1,0
    lea si,dizi
    lea di,dizi
    inc si
    add si,2
    jne x      
          
   int 21h   
ends
verial proc
    mov ah,00h
    int 16h
    ret
verial endp    

end start ; set entry point and stop the assembler.
