; multi-segment executable file template.

data segment
    mesaj db '*'
    satir db 00h
    sutun db 00h
    char db 0
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
     git:
     call imlec
     mov cx,0
     mov cl,sutun
     dongu:
     lea si,mesaj
     mov dl,[si]
     call karakteryaz
     loop dongu
     
     cmp sutun,0eh
     jne git
     

int 20h
ends
  karakteryaz proc
        mov ah,02h
        int 21h
        ret
  karakteryaz endp
  imlec proc
            mov ah,02h
            mov bh,00h
            mov dh,satir
            mov dl,sutun
            inc sutun
            int 10h
            inc satir
            ret
    
  imlec endp  

end start ; set entry point and stop the assembler.
