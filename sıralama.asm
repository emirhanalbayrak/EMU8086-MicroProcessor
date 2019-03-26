; multi-segment executable file template.

data segment
    sayi db 5 dup(0)
    sayi4 db 0 
    sayi1 db 0
    num db 0 
   
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
    mov cx,5 
    lea si,sayi
    dongu: 
    call verial
    sub al,30h
    mov [si],al
    inc si
    inc sayi1
    loop dongu
    
    
   
    lea si,sayi
    lea di,sayi
    
    x:
    
    
    mov cx,0
    dec sayi1
    mov cl,sayi1
    cmp sayi1,0
    je bit
    
    mov dl,01h
    mov num,dl 
    dongu1:
    
    mov al,[si]
    mov bl,[di+num]
    cmp al,bl
    inc num
    ja git
    
   loop dongu1
   jmp x1
      git:
      
      mov [si],bl
      mov [di+num],al
      
   loop dongu1
      x1:  
    inc si
    inc di 
    
    
    
    jmp x
    bit:
    int 20h
ends
verial proc
    mov ah,00h
    int 16h
    ret
verial endp
sayiyaz proc
    mov cx,3
    dongu3:
    div sayi4
    push ax
    mov ah,0
    loop dongu3
    
    
    mov cx,3
    dongu2:
    pop ax
    mov dl,ah
    add dl,30h
    call karakteryaz
    loop dongu2
    ret
sayiyaz endp
karakteryaz proc
    mov ah,02h
    int 21h
    ret
karakteryaz endp    

end start ; set entry point and stop the assembler.
