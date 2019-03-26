; multi-segment executable file template.

data segment
    mesaj db 'bilgisayar'
    sut db 27h
    char db 0
    mesaj1 db 'emirhan$'
    
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
             mov ah,00
             mov al,03
             int 10h
    
;            lea si,mesaj
;            mov cx,10
    
    ;tekrar:
;            mov bl,[si]
;            mov char,bl
;            call kurkon
;            call karakteryaz
;            inc si
;            inc sut
;            
;   loop tekrar
              call ekransil
              call kurkon
              lea dx,mesaj1
              call kelimeyaz
  
   int 20h
     
ends
    kurkon proc
             mov ah,02h
             mov bh,00h
             mov dh,0ch    ;satir
             mov dl,sut    ;sutun
             int 10h
             ret
  
    kurkon endp
    
    karakteryaz proc
             mov ah,02h
             mov dl,char
             int 21h
             ret
    karakteryaz endp    
    
    ekransil proc
             mov ax,0600h
             mov bh,0F4h
             mov cx,0000h
             mov dx,284fh
             int 10h
             ret
    ekransil endp         
    
    kelimeyaz proc
             
             mov ah,09h
             int 21h
             ret
    kelimeyaz endp         




end start ; set entry point and stop the assembler.
