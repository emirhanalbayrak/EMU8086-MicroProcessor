; multi-segment executable file template.

data segment
    mesaj db '*'
    sut db 0
    satir db 0
    char db 0
    sayi db 13
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
    git:
            call kurkon
            add dh,1
            mov bh,dh
            lea si,mesaj
           
            
    tekrar:
            mov bl,[si]
            mov char,bl
            
            call yaz
            dec bh
            cmp bh,0
            
    jne tekrar
                   cmp satir,13
                   jne git 
            git1:
            call kurkon
            sub sayi,1
            mov bh,sayi
            lea si,mesaj        
          
           
           tekrar1:
            mov bl,[si]
            mov char,bl
            
            call yaz
            dec bh
            cmp bh,0
            
    jne tekrar1 
            cmp satir,24
            jne git1       
  
   int 20h
     
ends
    kurkon proc
             mov ah,02h
             mov bh,00h
             mov dh,satir    ;satir
             mov dl,sut    ;sutun
             int 10h
             
             inc satir
             ret
             
    kurkon endp
    
    yaz proc
             mov ah,02h
             mov dl,char
             int 21h
             ret
             
    yaz endp    
    
    ekransil proc
             mov ax,060Ah
             mov bh,30h
             mov cx,0c0ch
             mov dx,1428h
             int 10h
             ret
    ekransil endp         





end start ; set entry point and stop the assembler.
