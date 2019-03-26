; multi-segment executable file template.

data segment
    mesaj1 db 'birgirdiniz$'
    mesaj2 db 'ikigirdiniz$'
    mesaj3 db 'ucgirdiniz$'
    mesaj4 db 'dortgirdiniz$'
    satir db 0h
    sutun db 0h
    
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
    sub al,30h
    cmp al,1
    je git
    jmp atla
    git:
        
        call imlec
        lea dx,mesaj1
        
        call karakteryazdir
        jmp x
               
    atla:
       cmp al,2       
       je git2
       jmp atla2
       git2:
          
          call imlec    
          lea dx,mesaj2
          
          call karakteryazdir 
          jmp x
    atla2:
       cmp al,3
       je git3
       jmp atla3
       
    git3:
        
        call imlec 
        lea dx,mesaj3
        
        call karakteryazdir
        jmp x
              
    atla3:
        cmp al,4
        je git4
        jmp atla4
     git4:
        
        call imlec 
        lea dx,mesaj4
        
        call karakteryazdir
        jmp x
     atla4:      
         cmp al,0
         je git5
         git5:  
    int 20h  
ends
    verial proc 
        
             mov ah,00h
             int 16h
             
             ret
        
    verial endp
    
    karakteryazdir proc
        
              mov ah,09h
              int 21h
              
              ret
              
    karakteryazdir endp
    imlec proc
           mov ah,02h
           mov bh,00h
           mov dh,satir    ;satir
           mov dl,sutun    ;sutun
           int 10h
           inc satir
          ret
    endp imlec
    ekransil proc
           
           mov ax,0600h
           mov bh,30h
           mov cx,0000h
           mov dx,284fh
           int 10h
           ret
        
        
    ekransil endp
       

end start ; set entry point and stop the assembler.
