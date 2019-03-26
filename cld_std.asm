; multi-segment executable file template.

data segment
    kelime db 'yazilim uzmani'
    kelime2 db 14 dup('')
    kelime3 db 14 dup('')
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
    
    
        call leftright
        call rightleft

    int 20h  
ends
  leftright proc
               cld
               mov cx,14
               lea si,kelime
               lea di,kelime2
               rep movsb 
               ret

  leftright endp  
  
  rightleft proc
              std
              mov cx,14
              lea si,kelime+14
              lea di,kelime3+14
              rep movsb 
              ret

 rightleft endp

end start ; set entry point and stop the assembler.
