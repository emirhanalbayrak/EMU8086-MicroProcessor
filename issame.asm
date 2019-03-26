; multi-segment executable file template.

data segment
    string1 db 'alan turing' 
    string2 db 'alan turing'
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
          
     call issame     
          
          
          
          
   int 20h
   
   
   issame proc
         cld
         mov cx,11
         lea si,string1
         lea di,string2
         repe cmpsb ;esit oldugu surece
         jne go           ;karsilastir
         mov bh,1
          jmp atla
         go:
         mov bh,0
         atla:
         ret
    
   issame endp
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
