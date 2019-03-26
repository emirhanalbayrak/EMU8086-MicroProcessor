; multi-segment executable file template.

data segment
    dizi  db '#123*# #'
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
    
    call fonksiyon
    
    
    
    
    
   int 20h
     
ends
    fonksiyon proc
             mov al,'#'
             mov bl,'$'
             mov cx,8
             lea si,dizi
             x:
             cmp cx,0
             je git
             repne scasb
             jne git
             mov [si-1],bl
             jmp x
             
              
             git:
              
              ret
    fonksiyon endp






end start ; set entry point and stop the assembler.
