; multi-segment executable file template.

data segment
   mesaj1 db 'normal tusa bastiniz$'
   mesaj2 db 'ascii kodu olmayan tusa bastiniz$' 
   satir db 05h 
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
    
    
    call ekransil
    x:
    call imlec
    call verial
    cmp al,00h
    
    je git:
    cmp ah,01h
    je son
    lea dx,mesaj1
    call kelimeyaz
    jmp x
    git:
    cmp ah,01h
    je son
    lea dx,mesaj2
    call kelimeyaz
    jmp x
    son: 
    int 20h  
ends
    verial proc
        
         mov ah,00h
         int 16h
         ret
        
    verial endp    
    
    kelimeyaz proc
        
          mov ah,09h
          int 21h
          ret
          
    kelimeyaz endp
    
    ekransil proc
        mov ax,0600h
        mov bh,30h
        mov cx,0514h
        mov dx,143ch
        int 10h
        ret
    ekransil endp
    
    imlec proc
        mov ah,02h
        mov bh,00h
        mov dh,satir
        mov dl,14h
        
        int 10h
        inc satir
        ret
    imlec endp    
end start ; set entry point and stop the assembler.
