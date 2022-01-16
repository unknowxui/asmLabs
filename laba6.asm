MAS1 DB 1,2,3,4,5,6,7,8,9,10   
MAS2 DB 1,2,3,4,5,6,7,8,9,10 
    
mov si,0 
cycle:
test si,si
jne next
    mov dl,MASS1[si + 1]
    mov byte ptr MAS2[si],dl
    jmp end
next: 
test si,1  
jne null
       mov dl,MASS1[si - 1]
       mov byte ptr MAS2[si],dl
       jmp end
       
null:
mov byte ptr MAS2[si],0

end:
mov ax,word MAS2[si]  
add ax,30h
mov dx,ax
mov ah,2 
int 21h  
inc si
cmp si,9
jle cycle 

ret


 
       