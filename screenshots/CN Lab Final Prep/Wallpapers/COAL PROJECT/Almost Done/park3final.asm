org 100h

jmp start

amount: dw 0

count: db  0

 num:db 0                       
trk: dw 0
bke: dw 0
c: db 0
b: db 0
cyc: db 0 

data : db 'Enter 1 if Motor Bike Parks'
msg1end:

data2 : db 'Enter 2 if Car Parks'
msg2end:

data3 : db 'Enter 3 if Bus Parks'
msg3end:

data4 : db 'Enter 4 if Cycle Parks'
msg4end:

data5 : db 'Enter 5 if Truck Parks'
msg5end:

data6 : db 'Enter 6 to Check all Your Previous records'
msg6end:

data7 : db 'Enter 7 to remove 01 Bike from your Parking'
msg7end:
data8 : db 'Enter 8 to remove 01 Car from your Parking '
msg8end:
data9 : db 'Enter 9 to remove 01 Bus from your Parking '
msg9end:
data10 : db 'Enter 10 to remove 01 Cycle from your Parking'
msg10end:
data11 : db 'Enter 11 to remove 01 Truck from your Parking'
msg11end:
data12 : db 'Enter 12 to remove everything from your Parking'
msg12end:
data13 : db 'Press 13 to exit'
msg13end:
data14 : db 'Note:In your Parking area maximum of 12 Vehicals will be parked at a time'
msg14end:

msgg1 db ' Key Entered : 1$'
msgg2 db ' Key Entered : 2$'
msgg3 db ' Key Entered : 3$'
msgg4 db ' Key Entered : 4$'
msgg5 db ' Key Entered : 5$'
msgg6 db ' Key Entered : 6$'
msgg7 db ' Key Entered : 7$'
msgg8 db ' Key Entered : 8$'
msgg9 db ' Key Entered : 9$'
msgg10 db ' Key Entered : A$'
msgg11 db ' Key Entered : B$'
msgg12 db ' Key Entered : C$'
msgg13 db ' Key Entered : q$'
 

msg1 db 'Parking Is Full$'
msg2 db 'Sorry but You have Entered a Wrong Input$'


msg7 db 'the total amount is =$'
msg8 db 'the total numbers of vehicles parked = $'
msg9 db 'the total number of Motor Bike parked = $'
msg10 db 'the total number of cars parked = $'
msg11 db 'the total number of buses parked = $'
msg12 db 'Record deleted successfully*$'
msg13 db 'the total number of Cycle parked $' 
msg14 db 'the total number of Truck parked $'
msg15 db 10,' Bike is Successfully  removed from you parking  $'
msg16 db 10,' Car is Successfully  removed from you parking $'
msg17 db 10, ' Bus is Successfully  removed from you parking $ ' 
msg18 db 10,' Cycle is Successfully  removed from you parking $'
msg19 db 10,' Truck is Successfully  removed from you parking $'
msg20 db 10,' Bike Charges are: $'
msg21 db 10,' Car Charges are: $'  
msg22 db 10, ' Bus Charges are: $'
msg23 db 10, ' Cycle Charges are: $'
msg24 db 10, ' Truck Charges are: $'

ten db ' 10 $'
elven db ' 11 $'
twevle db ' 12 $'

clr:

mov ah ,06h
xor al,al
xor cx,cx
;mov dx ,192Ah  ;dh = row , dl = col
mov dh , 25
mov dl , 40
mov bh ,07h
int 10h

ret


set:
mov al ,03h
mov ah, 00h
int 10h

ret

setcursor:

mov dh ,24
mov dl ,0
mov bh, 0
mov ah ,02h
int 10h

ret

main_menu:
call printstr
call printstr2
call printstr3
call printstr4
call printstr5
call printstr6
call printstr7
call printstr8
call printstr9
call printstr10
call printstr11
call printstr12
call printstr13
call printstr14
call setcursor

inputt:

mov ah, 08h
int 21h
mov dl, al
int 21h
mov bl,al     ;to sort out the issue of new line because when new line code is written then ax value will
mov dx,10     ;be changed and previous value of al will be lost
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h

  ;now compare
mov al,bl 
mov ah,0

cmp ax,'1'
je bike                  
cmp ax,'2'
je car
cmp ax,'3'
je bus  
cmp ax,'4'
je cycle11
cmp ax,'5'
je truck
cmp ax,'6'
je rec  
cmp ax,'7'
je delB 
cmp ax,'8'
je delC
cmp ax,'9'
je delBs 
cmp ax,'a'
je delCy
cmp ax,'b'
je delTr
cmp ax,'c'
je del
cmp ax,'q'
je endd

mov dx,msg2
mov ah,9
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h
jmp inputt 

endd:
mov dx,msgg13
mov ah,9
int 21h
mov ax ,0x4c00
int 21h

delB:                                                       
call delbike  


delC:                                                       
call delcar    


delBs:                                                       
call delbus  


delCy:                                                       
call delCycle 


delTr:                                                       
call delTruck 


bike:
call bikeMo   


truck:
call trrk


car:
call caar
  
cycle11:
call cyycle                               


rec:
call recrd


del:
call delt


bus:
call buss

delCycle :
mov cx,[cyc]
dec cx
mov [cyc],cx
xor cx,cx

mov ax,30
sub [amount],ax
mov dx,[count]
dec dx
mov [count],dx
xor ax,ax
xor dx,dx
mov dx, msgg10                                               
mov ah,9
int 21h
mov dx, msg18                                                
mov ah,9
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h

xor ah, ah    ; ah = 0
int 16h       ; call BIOS function 16h


jmp inputt 

   
   
   


delTruck:
mov cx,[trk]
dec cx
mov [trk],cx

mov ax,450
sub [amount],dx
mov dx,[count]
dec dx
mov [count],dx
xor ax,ax
xor cx,cx
xor dx,dx
mov dx,msgg11                                                
mov ah,9
int 21h
mov dx,msg19                                                
mov ah,9
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h        

xor ah, ah    ; ah = 0
int 16h       ; call BIOS function 16h


jmp inputt
  
  
  
  
  
     
delcar:
mov cx ,[c]
dec cx
mov [c],cx
mov ax, 200
sub [amount],ax
mov dx,[count]
dec dx
mov [count],dx
xor dx,dx
mov dx,msgg8                                   
mov ah,9
int 21h
mov dx,msg16                                   
mov ah,9
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h
         
xor ah, ah    ; ah = 0
int 16h       ; call BIOS function 16h         
xor ax,ax
jmp inputt 


    
     
 
delbike :
mov cx,[bke]
dec cx
mov [bke],cx

mov ax, 60
sub [amount],ax
mov dx,[count]
dec dx
mov [count],dx
mov dx,msgg7                                    
mov ah,9
int 21h
mov dx,msg15                                    
mov ah,9
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h  

xor ah, ah    ; ah = 0
int 16h       ; call BIOS function 16h

xor ax,ax

jmp inputt 




delbus :
mov cx,[b]
dec cx
mov [b],cx

mov ax , 350
sub [amount],ax
mov dx,[count]
dec dx
mov [count],dx
mov dx,msgg9                                    
mov ah,9                                         
int 21h
mov dx,msg17                                    
mov ah,9                                         
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h   

xor ah, ah    ; ah = 0
int 16h       ; call BIOS function 16h

xor ax,ax
jmp inputt


     
     

trrk :
mov ax, 11
cmp [count],ax
jle trk1
mov dx, msg1
mov ah,9
int 21h
jmp inputt


trk1:

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h   
mov dx,msgg5        
mov ah,9
int 21h
mov dx,msg24        
mov ah,9
int 21h

mov ax,450
add [amount], ax
mov dx,0 ; remainder is 0
mov bx,10                                             
mov cx,0
lopp11:
        div bx
        push dx
        mov dx,0
        mov ah,0
        inc cx
        cmp ax,0
        jne lopp11
   
lopp33:
        pop dx
        add dx,48
        mov ah,2
        int 21h
loop lopp33
mov dx,1
add [count],dx
mov cx,1
add [trk],cx

xor ah, ah    ; ah = 0
int 16h       ; call BIOS function 16h                                                  

xor dx,dx
xor cx,cx

jmp inputt 
 
 
 
 
 
 

bikeMo :
mov ax, 11
cmp [count],ax
jle bike1
mov dx,msg1
mov ah,9
int 21h
jmp inputt


bike1:
mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h   
mov dx,msgg1        
mov ah,9
int 21h
mov dx,msg20        
mov ah,9
int 21h

mov ax,60
add [amount], ax
mov dx,0 ; remainder is 0
mov bx,10 
mov cx,0
l2:
        div bx
        push dx
        mov dx,0
        mov ah,0
        inc cx
        cmp ax,0
        jne l2
   
l3:
        pop dx
        add dx,48
        mov ah,2
        int 21h
loop l3
mov dx ,1
add [count],dx

;mov dx,[count]
;inc dx
mov cx,1
add [bke],cx
;inc cx

xor ah, ah    ; ah = 0
int 16h       ; call BIOS function 16h                                                   

xor dx,dx
xor cx,cx

jmp inputt



caar :
mov ax, 11
cmp [count],ax
jle car1
mov dx, msg1
mov ah,9
int 21h
jmp inputt


car1:
mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h  
mov dx,msgg2        
mov ah,9
int 21h 
mov dx,msg21        
mov ah,9
int 21h

mov ax,200
add [amount], ax
mov dx,0
mov bx,10
mov cx,0
l22:
        div bx
        push dx
        mov dx,0
        mov ah,0
        inc cx
        cmp ax,0
       jne l22
   
l33:
        pop dx
        add dx,48
        mov ah,2
        int 21h
loop l33

mov dx,1
add [count],dx
mov cx,1
add  [c],cx        

xor ah, ah    ; ah = 0
int 16h       ; call BIOS function 16h
xor dx,dx
xor cx,cx

jmp inputt


cyycle :
mov ax,11
cmp [count],ax
jle cyc1
mov dx, msg1                   ;update it
mov ah,9
int 21h
xor ax,ax
jmp inputt


cyc1: 

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h 
mov dx, msgg4        
mov ah,9
int 21h  
mov dx, msg23        
mov ah,9
int 21h

mov ax,30
add [amount], ax
mov dx,0
mov bx,10
mov cx,0
lopp2:
        div bx
        push dx
        mov dx,0
        mov ah,0
        inc cx
        cmp ax,0
       jne lopp2
   
lopp3:
        pop dx
        add dx,48
        mov ah,2
        int 21h
loop lopp3

mov dx,1
add [count],dx
mov cx,1
add [cyc],cx
      

xor ah, ah    ; ah = 0
int 16h       ; call BIOS function 16h
xor dx,dx
xor cx,cx
jmp inputt





buss :
mov ax, 11
cmp [count],ax
jle bus1
mov dx, msg1
mov ah,9
int 21h
xor ax,ax
jmp inputt


bus1:

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h  
mov dx,msgg3        
mov ah,9
int 21h 
mov dx,msg22        
mov ah,9
int 21h

mov ax,350
add [amount], ax
mov dx,0
mov bx,10
mov cx,0
lop2:
        div bx
        push dx
        mov dx,0
        mov ah,0
        inc cx
        cmp ax,0
       jne lop2
   
lop3:
        pop dx
        add dx,48
        mov ah,2
        int 21h
loop lop3

mov dx,1
add [count],dx
mov cx,1
add [b],cx

xor ah, ah    ; ah = 0
int 16h       ; call BIOS function 16h

xor dx,dx
xor cx,cx

jmp inputt



recrd:
mov dx,msg7
mov ah,9
int 21h



mov ax, [amount]

mov dx,0
mov bx,10
mov cx,0
totalpush:
        div bx
        push dx
        mov dx,0
     
        inc cx
        cmp ax,0
       jne totalpush
   
totalprint:
        pop dx
        add dx,48
        mov ah,2
        int 21h
loop totalprint




mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h



mov dx,msg8
mov ah,9
int 21h

mov dx,[count]
add dx,0x30
mov ah,2
int 21h



mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h


mov dx, msg9
mov ah,9
int 21h

mov dx,[bke]
add dx,0x30
mov ah,2
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h



mov dx, msg10
mov ah,9
int 21h


mov dl,[c]
add dx,0x30
mov ah,2
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h



mov dx, msg11
mov ah,9
int 21h

mov dl,[b]
add dx,0x30
mov ah,2
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h

 


mov dx, msg13
mov ah,9
int 21h

mov dl,[cyc]
add dx,0x30
mov ah,2
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h 



mov dx,msg14
mov ah,9
int 21h

mov dx,[trk]
add dx,0x30
mov ah,2
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h 

xor ah, ah    ; ah = 0
int 16h       ; call BIOS function 16h
        
jmp inputt 





delt:
xor bx,bx
mov [bke],bx
mov [c],bx
mov [b],bx
mov [trk],bx
mov [cyc],bx
mov [amount],bx
mov ax,0
sub [amount],ax
mov [count],bx
mov dx,msg12
mov ah,9
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h

xor ah, ah    ; ah = 0
int 16h       ; call BIOS function 16h





jmp inputt 



ret


printstr:
mov cx, msg1end - data
mov al ,1
mov bh , 0
 mov bl,07
mov dh,0
mov dl,0
push cs
pop es
mov bp ,data
mov ah ,13h
int 10h

ret

printstr2:
xor cx,cx
mov cx, msg2end - data2
mov al ,1
mov bh , 0
 mov bl,07
mov dh,1
mov dl,0
push cs
pop es
mov bp ,data2
mov ah ,13h
int 10h

ret

printstr3:
xor cx,cx
mov cx, msg3end - data3
mov al ,1
mov bh , 0
 mov bl,07
mov dh,2
mov dl,0
push cs
pop es
mov bp ,data3
mov ah ,13h
int 10h

ret

printstr4:
xor cx,cx
mov cx, msg4end - data4
mov al ,1
mov bh , 0
 mov bl,07
mov dh,3
mov dl,0
push cs
pop es
mov bp ,data4
mov ah ,13h
int 10h
ret

printstr5:
xor cx,cx
mov cx, msg5end - data5
mov al ,1
mov bh , 0
 mov bl,07
mov dh,4
mov dl,0
push cs
pop es
mov bp ,data5
mov ah ,13h
int 10h
ret

printstr6:
xor cx,cx
mov cx, msg6end - data6
mov al ,1
mov bh , 0
 mov bl,07
mov dh,5
mov dl,0
push cs
pop es
mov bp ,data6
mov ah ,13h
int 10h
ret

printstr7:

xor cx,cx
mov cx, msg7end - data7
mov al ,1
mov bh , 0
 mov bl,07
mov dh,6
mov dl,0
push cs
pop es
mov bp ,data7
mov ah ,13h
int 10h

ret

printstr8:

xor cx,cx
mov cx, msg8end - data8
mov al ,1
mov bh , 0
 mov bl,07
mov dh,7
mov dl,0
push cs
pop es
mov bp ,data8
mov ah ,13h
int 10h

ret

printstr9:

xor cx,cx
mov cx, msg9end - data9
mov al ,1
mov bh , 0
 mov bl,07
mov dh,8
mov dl,0
push cs
pop es
mov bp ,data9
mov ah ,13h
int 10h

ret


printstr10:

xor cx,cx
mov cx, msg10end - data10
mov al ,1
mov bh , 0
 mov bl,07
mov dh,9
mov dl,0
push cs
pop es
mov bp ,data10
mov ah ,13h
int 10h

ret


printstr11:

xor cx,cx
mov cx, msg11end - data11
mov al ,1
mov bh , 0
 mov bl,07
mov dh,10
mov dl,0
push cs
pop es
mov bp ,data11
mov ah ,13h
int 10h

ret

printstr12:

xor cx,cx
mov cx, msg12end - data12
mov al ,1
mov bh , 0
 mov bl,07
mov dh,11
mov dl,0
push cs
pop es
mov bp ,data12
mov ah ,13h
int 10h

ret


printstr13:

xor cx,cx
mov cx, msg13end - data13
mov al ,1
mov bh , 0
 mov bl,07
mov dh,12
mov dl,0
push cs
pop es
mov bp ,data13
mov ah ,13h
int 10h

ret

printstr14:

xor cx,cx
mov cx, msg14end - data14
mov al ,1
mov bh , 0
 mov bl,0x5f
mov dh,20
mov dl,2
push cs
pop es
mov bp ,data14
mov ah ,13h
int 10h

ret

start:
call clr

call main_menu



mov ah ,0x1
int 21h
end:
mov ax ,0x4c00
int 21h