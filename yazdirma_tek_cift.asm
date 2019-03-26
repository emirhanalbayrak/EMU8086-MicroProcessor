; multi-segment executable file template.

data segment
    mesaj db 'bilgisayar'
    sut db 27h
    char db 0
    mesaj1 db 'tek$'
    mesaj2 db 'cift$'
    sayi db 2,4,3,5,6,7,9
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
              
              call ekransil
              call kurkon
 ;hocam yukaridaki iki fonksiyondan herhangi
 ;birini cagirdigimda hata aliyorum
 ;sorunu bu sekilde cozdum
 ;oncesinde fonksiyon cagirmadim yani.
 ;sebebi ah'da kesmenin fonksiyon numarasi
 ;sabit kaldigi icin mi?
 
                  lea si,sayi
                  mov cx,7 
           dongu: 
                  mov ax,0
                  mov al,[si]           
                  mov bl,2
                  div bl
                  cmp ah,0
                  je git
                  lea dx,mesaj1
                  jmp atla
                  
                  git:
                  lea dx,mesaj2
                  
                  atla:
                  
                  ;call kurkon;hata veriyor
                  mov ax,0
                  call kelimeyaz
                  inc si
                  
                  add sut,2
            loop dongu
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
