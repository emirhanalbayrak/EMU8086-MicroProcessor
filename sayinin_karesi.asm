; multi-segment executable file template.

data segment
  sayi db 0
  sayi2 db 10
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
    
    call verial
    sub al,30h
    mul al
    mov cx,3
     
    dongu1:
    div sayi2
    push ax
    mov ah,0
    loop dongu1
    
    mov cx,3
    dongu2:
    pop ax
    mov dl,ah
    add dl,30h
    call karakteryaz
    loop dongu2
    
    int 20h  
ends

verial proc
    mov ah,00h
    int 16h
    ret
    
verial endp
karakteryaz proc
   ;char,dl
    mov ah,02h
    int 21h
    ret
karakteryaz endp    

end start ; set entry point and stop the assembler.
