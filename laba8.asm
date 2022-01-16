MAS2 db 1, -11, -3,-8,7,9,-6,-1,2,-5
positive db 0
negative db 0    

mov cx,9
mov si,0
cycle:
cmp word ptr MAS2[si],0
jge pos_inc            ;Perehod k pos_inc esli 0 bolshe
     inc negative       ;Elsi net perehoda to menshe nula
     jmp end_cycle
pos_inc:
     inc positive
     jmp end_cycle 
end_cycle:
inc si
loop cycle    

mov al,negative
cmp positive,al
jge else
    mov dx,'n'  ;Esli otricatelnix bolshe vivodim n
    mov ah,2 
    int 21h 
    jmp end
else:
    mov dx,"p"
    mov ah,02h 
    int 21h       ;Esli polojitelnix bolshe vivodim p
    jmp end

end:
mov ah,00h
int 21h