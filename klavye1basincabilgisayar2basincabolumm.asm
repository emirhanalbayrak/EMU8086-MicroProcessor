; multi-segment executable file template.

data segment
    mesaj1 db '1.Bilgisayar$'
    mesaj2 db 'A.Bolumu$'
    mesaj3 db 'Ctrl+F1.Cikis$'
    satir db 05h
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
     
     call ekransil
     x:
     call imlec
     
     call verial
     
     cmp al,'1'
     je git
     cmp al,61h
     je git2
     cmp ah,0fh
     je git3
     jmp x
     git:
      lea dx,mesaj1
      call kelimeyaz
     jmp x
     git2:
      lea dx,mesaj2
      call kelimeyaz
      jmp x
     git3:
       lea dx,mesaj3
       call kelimeyaz
       
    int 20h
    
      
ends
    verial proc
          mov ah,00h
          int 16h
          ret            
          
    verial endp
    
    kelimeyaz proc
          mov ah,09h
          int 21h
          ret 
    kelimeyaz endp
    
    ekransil proc
            mov ax,0600h
            mov bh,5ch
            mov cx,0514h
            mov dx,143ch
            int 10h
            ret
    ekransil endp
    
    imlec proc
              mov ah,02h
              mov bh,00h
              mov dh,satir
              mov dl,14h
              int 10h
              inc satir
              ret
        
    imlec endp    

end start ; set entry point and stop the assembler.
