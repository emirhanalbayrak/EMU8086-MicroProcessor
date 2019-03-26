; multi-segment executable file template.

data segment
    dizi db 5 dup(0)
    sayi db 0
    sayi1 db 0
    sayi2 db 10
    char db 0 
    char2 db 5
    enkucuk db 0
    enbuyuk db 0
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
          ;;;;;;;;;;;;
          lea si,dizi
          mov cx,5
          dongu:
          call verial
          mov [si],al
          inc si
          mov sayi,0
          loop dongu 
          
        ;;;;;;;;;;;;;;;;;;;;;;;;;   
          lea si,dizi
          mov cx,5 
          mov ax,0
          
          toplam:
          add al,[si]
          inc si
          loop toplam
          
          add al,30h
          call karakteryaz
          ;;;;;;;;;;;;;;;;;;;;;
          
          sub al,30h
          mov ah,0
          div char2
          add al,30h
          call karakteryaz
          ;;;;;;;;;;;;;;;;;;;;;;;
          
          lea si,dizi
          mov al,[si]
          mov enkucuk,al
          inc si
          mov ax,0          
          mov cx,4
          enkucuk1:
             mov al,[si]
             cmp enkucuk,al
             ja kucuk
             inc si
          loop enkucuk1
          jmp son
            kucuk:
              mov enkucuk,al
            
          loop enkucuk1  
          
           son:
           mov al,enkucuk
           add al,30h
           call karakteryaz
           ;;;;;;;;;;;;;;;;;;;;;;;
           mov ax,0
           mov cx,4
           lea si,dizi
           mov al,[si]
           mov enbuyuk,al
           inc si
             buyuk:
               mov al,[si]
               cmp enbuyuk,al
               jb gitt
               inc si
             
             loop buyuk
             jmp son1
                gitt:
                mov enbuyuk,al
             loop buyuk
             son1:
               mov al,enbuyuk
               add al,30h
               call karakteryaz
                
    int 20h  
ends 
verial proc
        don:
         mov ah,00h
         int 16h              
         cmp ah,1ch
         je git
         push ax
         inc sayi
         jne don
         
         
         git:
           cmp sayi,1
           je bir
           jne iki
           bir:
           pop ax
           sub al,30h
           jmp x
           iki:
           pop ax
           sub al,30h
           mov sayi1,al
           pop ax
           sub al,30h
           mul sayi2
           add al,sayi1
           x:
           mov ah,0
           ret   
     verial endp
     karakteryaz proc
          mov ah,02h
          mov dl,al
          int 21h
          ret
        
        
     karakteryaz endp   

end start ; set entry point and stop the assembler.
