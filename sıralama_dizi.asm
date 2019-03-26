.model small
.stack 64
.data
dizi db 5 dup (" ")
.code
ana proc far
    mov ax,@data
    mov ds,ax
    lea si,dizi
    mov cx,5
    dongu:
    mov ah,00
    int 16h
    sub al,30h
    mov [si],al
    inc si
    loop dongu
    lea si,dizi
    mov bx,4
    mov cx,5
    dongu1:
        dongu2:
            mov al,[si]
            mov ah,[si+1]
            cmp al,ah
            jb git
            mov [si],ah
            mov [si+1],al
            git:
            dec bx
            inc si
            cmp bx,0
        jne dongu2        
         mov bx,4
         lea si,dizi  
            
            
    loop dongu1
    
    
    mov ah,4ch
    int 21h       
ana endp




end ana