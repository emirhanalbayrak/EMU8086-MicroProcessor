; multi-segment executable file template.

data segment
    string1 db 'karabuk universitesi'
    string2 db 20 dup('')
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
    
    mov cx,20 
    lea si,string1
    lea di,string2 
    rep movsb 
     
           
           
           
           
           
           
    int 20h
ends

end start ; set entry point and stop the assembler.
