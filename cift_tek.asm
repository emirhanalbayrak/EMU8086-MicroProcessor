; multi-segment executable file template.

data segment
    sayi db 0
   sayi1 db 0 
   TEXT db 3,?,2
   tek db 'tek$'
   cift db 'cift$'
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
     
     call sayiOku
     mov ax,0
     mov al,sayi
     mov bl,2
     div bl
     cmp ah,0
     je git
     lea dx,tek
     call kelimeyaz
      git:
      lea dx,cift
     call kelimeyaz
   int 20h   
ends
verial proc
    mov ah,00h
    int 16h
    ret
verial endp    
read proc    
       
       MOV AH,0Ah
       INT 21H
       ret   
read endp
   sayiOku proc 
        mov sayi,0
        LEA DX,TEXT
        MOV AH,0Ah
        INT 21H
        
        lea si,TEXT
        mov dl,[si+1]
        mov bl,1
         
        mov dh,0 
        add si,dx     
        inc si
        
        dongu5:
            mov al,[si]
            sub al,30h
            mul bl
            add sayi,al
            mov al,10
            mul bl
            mov bl,al
            dec si    
        
        dec dl
        jnz dongu5 
        ret 
    sayiOku endp
   kelimeyaz proc 
        MOV AH,09h 
        INT 21H
        ret  
   kelimeyaz endp
end start ; set entry point and stop the assembler.
