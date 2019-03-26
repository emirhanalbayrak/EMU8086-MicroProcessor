; multi-segment executable file template.

data segment
     dizi db 3 dup('') 
     char db 0
     char2 db 0
     sayi db 10
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
      mov dl,al
      mov bl,1
      dongu:
         mul bl
         inc bl
         cmp bl,dl
      jne dongu
      
      
      div sayi
      mov char,al
      add char,30h
      mov char2,ah
      add char2,30h
      call karakteryaz
      call karakteryaz1
      
    

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
   karakteryaz1 proc
    
         mov ah,02h 
         mov dl,char2
         
         int 21h
         ret
   karakteryaz1 endp

end start ; set entry point and stop the assembler.
