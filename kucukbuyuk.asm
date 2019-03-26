.model small
.stack 64
.data
dizi db 10 dup (" ")
.code
ana proc far
    mov ax,@data
    mov ds,ax
    lea si,dizi
    mov cx,10
    dongu:
    mov ah,00
    int 16h
    sub ah,30h
    mov [si],al
    inc si
    loop dongu
    lea si,dizi
    mov bx,9
    mov cx,10
    dongu1:
        dongu2:
                    
            mov al,[si]
            cmp al,[si+1]
            JB devam
            mov al,[si]
            mov ah,[si+1]
            mov [si],ah
            mov [si+1],al
            devam:
            dec bx
            inc si
            cmp bx,0
            JNE dongu2
            lea si,dizi    
            mov bx,9
    loop dongu1
    
    
    mov ah,4ch
    int 21h       
ana endp




end ana