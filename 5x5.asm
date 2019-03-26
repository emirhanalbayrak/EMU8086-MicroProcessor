.model small
.stack 64
.data
    char db "*" 
    sayi db 10 dup(" ")
    sat db 00h
    sut db 00h
.code
ana proc far
        mov ax,@data
        mov ds,ax  
        call ekrnsil
        mov bx,5
        
        yatay:
        call yazyatay
        add sat,5 
        dec bx
        cmp bx,0
        JNE yatay  
        
        mov sut,05h
        mov sat,00h
        
        mov bx,16
        
        dikey:
        call yazdikey
        add sut,5
        dec bx
        cmp bx,0
        JNE dikey
        
        
        
        mov ah,4ch
        int 21h
    
ana endp

cursor proc
    mov ah,02
    mov bh,0
    mov dh,sat
    mov dl,sut
    int 10h 
    ret
cursor endp

ekrnsil proc
    mov ax,0600h
    mov bh,07
    mov cx,0000h
    mov dx,284fh
    int 10h 
    ret
ekrnsil endp

yazyatay proc 
    
    mov cx,80
    dongu:  
    call cursor
    mov ah,02 
    mov dl,char offset
    int 21h
    inc sut 
    loop dongu
    mov sut,00h
    ret
yazyatay endp  

yazdikey proc
    
    mov cx,24 
    call cursor
    dongu2:
        call cursor
        mov ah,02
        mov dl,char offset
        int 21h
        inc sat
        loop dongu2
        mov sat,00h
     
    ret
yazdikey endp