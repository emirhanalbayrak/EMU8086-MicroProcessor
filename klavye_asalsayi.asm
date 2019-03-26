; multi-segment executable file template.

data segment
    sayi2 db 10
    sayi db 0
    sayi1 db 0
    char db 0
    char2 db 0
    asal db 'asal$'
    asaldegil db 'asal degil$'
    
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
          cmp al,1
          je git1
          cmp al,2
          je git1
          mov char,al
          mov char2,al
          mov cx,0
          sub char,2
          mov cl,char
          mov bl,2
          dongu:
          div bl
          cmp ah,0
          je gitme
          inc bl
          mov al,char2
          mov ah,0
          loop dongu
    
          git1:
          lea dx,asal
          call kelimeyaz
          jmp x1
          gitme:
          lea dx,asaldegil
          call kelimeyaz 
          
          x1:
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
