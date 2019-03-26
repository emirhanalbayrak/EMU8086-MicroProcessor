; multi-segment executable file template.

data segment
    mesaj db 'bilgisayar'
    sut db 39h
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
    
            lea si,mesaj
            mov cx,10
    
    tekrar:
            mov bl,[si]
            mov char,bl
            call kurkon
            call yaz
            inc si
            inc sut
            
   loop tekrar
             call ekransil
  
   int 20h
     
ends
    kurkon proc
             mov ah,02h
             mov bh,00h
             mov dh,0dh    ;satir
             mov dl,sut    ;sutun
             int 10h
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
