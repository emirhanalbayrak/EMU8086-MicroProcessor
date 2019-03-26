; multi-segment executable file template.

data segment
   sayi db 10
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
              
         call verial

         sub al,30h
         mov ah,0
         mul al     
         mov cx,2     
         
         div sayi
         mov char,al
         add char,30h
         push ax
         call karakteryaz
         pop ax
         mov al,ah
         mov ah,0
         mov char,al
         add char,30h     
         call karakteryaz    
             
    
    
    int 20h 
ends    

     verial proc
        MOV AH,01 
        INT 21H 
        ret
     verial endp   
     karakteryaz proc
        mov ah,02h
        mov dl,char
        int 21h
        ret
     karakteryaz endp   

       
     
     
end start ; set entry point and stop the assembler.
