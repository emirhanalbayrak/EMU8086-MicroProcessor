; multi-segment executable file template.

data segment
    sayi2 db 10
    sayi db 0 
    sayi1 db 0
    cift db 'cift$'
    tek db 'tek$'
    bol db 2
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
    
          call verial
          div bol
          cmp ah,0
          je cift1
          lea dx,tek
          call kelimeyaz
          jmp long
          cift1:
          lea dx,cift
          call kelimeyaz 
    
          long:
    

    int 20h  
ends
     verial proc
        don:
         mov ah,00h
         int 16h              
         cmp ah,1ch
         je git
         push ax
         inc sayi
         jne don
         
         
         git:
           cmp sayi,1
           je bir
           jne iki
           bir:
           pop ax
           sub al,30h
           jmp x
           iki:
           pop ax
           sub al,30h
           mov sayi1,al
           pop ax
           sub al,30h
           mul sayi2
           add al,sayi1
           x:
           mov ah,0
           ret   
     verial endp
     kelimeyaz proc
             mov ah,09h
             int 21h
             ret
        
        
     kelimeyaz endp   
end start ; set entry point and stop the assembler.
