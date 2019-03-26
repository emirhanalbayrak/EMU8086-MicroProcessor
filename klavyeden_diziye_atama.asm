; multi-segment executable file template.

data segment
    dizi db 5 dup(0)
    sayi db 0
    sayi1 db 0
    sayi2 db 10
    char db 0
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
          dongu:
          call verial
          mov [si],al
          inc si
          mov sayi,0
          loop dongu 
           
          lea si,dizi
          mov cx,3
          yaz:
          mov al,[si]
          add al,30h
          call karakteryaz
          inc si
          
          loop yaz
          
           
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
     karakteryaz proc
          mov ah,02h
          mov dl,al
          int 21h
          ret
        
        
     karakteryaz endp   

end start ; set entry point and stop the assembler.
