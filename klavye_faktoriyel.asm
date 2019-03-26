; multi-segment executable file template.

data segment
    sayi1 db 100
    sayi2 db 10
    sayi db  0
    char db 0
    sayi5 db 10 dup(0)
    sayi7 db 0 
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
         sub al,30h
         cmp al,1
         je git
         mov bl,1
         mov sayi,al
         dongu:
         mul bl
         inc bl
         cmp sayi,bl
         jne dongu
         
         cmp al,10
         jb git
         mov cx,3
         
         dongu1:
         
         div sayi1
         
         
         mov char,al
         add char,30h
         push ax
         call karakteryaz         
         
         mov al,sayi1
         mov ah,0
         mov bl,10
         div bl
         mov sayi1,al
         
         pop ax
         mov al,ah
         mov ah,0
         
         
         
         
         loop dongu1
         jmp atla
         git:
         mov char,al
         add char,30h
         call karakteryaz 
         atla:
   int 20h 
ends 
         
         verial proc
            mov ah,00h
            int 16h
            ret
         verial endp   
    
         
         karakteryaz proc
            mov ah,02h
            mov dl,char
            int 21h
            ret
         karakteryaz endp   

end start ; set entry point and stop the assembler.
