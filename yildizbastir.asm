; multi-segment executable file template.

data segment
    
    sut db 27h
    char db 0
    mesaj1 db 'tek$'
    mesaj2 db 'cift$'
    sayi db 1,2,3,4,5,6,7,8,9,10
    sat db 0h
    char2 db '*'
    sayi1 db 0
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
             mov ah,00  ;
             mov al,03  ;
             int 10h    ;
              
              
              
 ;hocam yukaridaki iki fonksiyondan herhangi
 ;birini cagirdigimda hata aliyorum
 ;sorunu bu sekilde cozdum
 ;oncesinde fonksiyon cagirmadim yani.
 ;sebebi ah'da kesmenin fonksiyon numarasi
 ;sabit kaldigi icin mi?
                  call kurkon
                  call ekransil
                  lea si,sayi
                  mov cx,10 
           dongu: 
                  mov ax,0
                  mov al,[si]           
                  mov bl,2
                  div bl
                  cmp ah,0
                  je git
                  mov al,[si]
                  mov sayi1,al
                  yildizbas:
                  lea di,char2
                  mov bx,0
                  mov bl,[di]
                  mov char,bl
                  call karakteryaz
                  dec sayi1
                  cmp sayi1,0
                  jne yildizbas
                  mov ax,0
                  mov bx,0
                  
                  mov dx,0
                  lea dx,mesaj1
                  jmp atla
                  
                  git:
                  
                  mov al,[si]
                  mov sayi1,al
                   yildizyaz:
                  lea di,char2
                  mov bx,0
                  mov bl,[di]
                  mov char,bl
                  call karakteryaz
                  dec sayi1
                  cmp sayi1,0
                  jne yildizyaz
                  mov ax,0
                  mov bx,0 
                  mov dx,0
                  lea dx,mesaj2
                  ;call kurkon;hata veriyor
                  
                  atla:
                  
                  call kelimeyaz
                  call kurkon
                  inc si
                  
                  
            loop dongu
   int 20h
     
ends
    kurkon proc
             mov ah,02h
             mov bh,00h
             mov dh,sat    ;satir
             mov dl,sut    ;sutun
             int 10h
             inc sat
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
             mov bh,0F3h
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
