.data
welcome_msg db "Want to buy a car? You are in the right place! $"
list_msg db "Cars List: $"
choice_msg db "Enter your choice: $"
msg1 db "Press 1 to display available cars: $"
msg2 db "Select your favourite car: $"
msg3 db "Enter quantity: $" 
invalid_msg db "Invalid Input, Please run the program again $"
total_price_msg db "Your total price is: $"      
msg4 db "1. Cars list: $"
exit_msg db "2. Exit: $"
usd_msg db "K - USD $"

audi_msg db "1. Audi $" 
tesla_msg db "2. Tesla $"
supercars_msg db "3. Super Cars $"

audi_a1_msg db "1. Audi A1 - 50K USD$"
audi_a3_msg db "2. Audi A3 - 50K USD$"
audi_a5_msg db "3. Audi A5 - 50K USD$"
audi_r1_msg db "4. Audi R1 - 50K USD$"
audi_r3_msg db "5. Audi R3 - 50K USD$"
audi_r5_msg db "6. Audi R5 - 50K USD$"

tesla_model_a_msg db "1. Tesla Model A - 100K USD $"
tesla_model_b_msg db "2. Tesla Model B - 100K USD $"
tesla_model_c_msg db "3. Tesla Model C - 100K USD $"
tesla_model_x_msg db "4. Tesla Model X - 100K USD $"
tesla_model_y_msg db "5. Tesla Model Y - 100K USD $"
tesla_model_z_msg db "6. Tesla Model Z - 100K USD $"   

supercar_ferrari_msg db "1. Ferrari SF90 - 200K USD $"
supercar_lambo_msg db "2. Lamborghini Avantador - 200K USD $"
supercar_mclaren_msg db "3. McLaren - 200K USD $"
supercar_bugatti_msg db "4. Bugatti Cheron - 200K USD $"
supercar_porsche_msg db "5. Porsche 911 - 200K USD $" 
supercar_pagani_msg db "6. Pagani Utopia - 200K USD $"          

.code 
nextline proc 
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah    
    int 21h 
    ret
    nextline endp
main proc

mov ax, @data
mov ds, ax

mov ah, 9
mov dx, offset welcome_msg
int 21h

call nextline

mov ah, 9
mov dx, offset msg1 
int 21h

mov ah, 1
int 21h
mov bh, al
sub bh, 48 

cmp bh, 1
je Cars_list
jmp Invalid

Cars_list:  
call nextline
mov ah, 9
mov dx, offset list_msg
int 21h

call nextline

mov ah, 9
mov dx, offset audi_msg
int 21h

call nextline

mov ah, 9
mov dx, offset tesla_msg
int 21h

call nextline

mov ah, 9
mov dx, offset supercars_msg
int 21h

call nextline

mov ah, 9
mov dx, offset choice_msg
int 21h

mov ah, 1
int 21h   
mov bh, al

sub bh, 48 

cmp bh, 1
je Audi

cmp bh, 2
je Tesla

cmp bh, 3
je Supercars

jmp Invalid

Audi:
call nextline

mov ah, 9
mov dx, offset audi_a1_msg
int 21h

call nextline

mov ah, 9
mov dx, offset audi_a3_msg
int 21h

call nextline

mov ah, 9
mov dx, offset audi_a5_msg
int 21h

call nextline

mov ah, 9
mov dx, offset audi_r1_msg
int 21h

call nextline

mov ah, 9
mov dx, offset audi_r3_msg
int 21h

call nextline

mov ah, 9
mov dx, offset audi_r5_msg
int 21h

call nextline

mov ah, 9
mov dx, offset msg2 
int 21h

mov ah, 1
int 21h   

mov bl , al
sub bl, 48 

cmp bl, 1
je Fifty_thousand

cmp bl, 2
je Fifty_thousand

cmp bl, 3
je Fifty_thousand

cmp bl, 4
je Fifty_thousand

cmp bl, 5
je Fifty_thousand

cmp bl, 6
je Fifty_thousand

jmp Invalid

Tesla:
call nextline

mov ah, 9
mov dx, offset tesla_model_a_msg
int 21h

call nextline 

mov ah, 9
mov dx, offset tesla_model_b_msg
int 21h

call nextline

mov ah, 9
mov dx, offset tesla_model_c_msg
int 21h

call nextline

mov ah, 9
mov dx, offset tesla_model_x_msg
int 21h

call nextline

mov ah, 9
mov dx, offset tesla_model_y_msg
int 21h

call nextline

mov ah, 9
mov dx, offset tesla_model_z_msg
int 21h

call nextline

mov ah, 9
mov dx, offset msg2 
int 21h

mov ah, 1
int 21h
mov bl, al

sub bl, 48

cmp bl, 1
je Hundered_thousand

cmp bl, 2
je Hundered_thousand

cmp bl, 3
je Hundered_thousand

cmp bl, 4
je Hundered_thousand

cmp bl, 5
je Hundered_thousand

cmp bl, 6
je Hundered_thousand

jmp Invalid 

call nextline

mov ah, 9 
mov dx, offset msg4 
int 21h

mov ah, 1
int 21h
mov bh, al

cmp bh, 1
jmp Exit

Supercars:
call nextline

mov ah, 9
mov dx, offset supercar_ferrari_msg
int 21h

call nextline 

mov ah, 9
mov dx, offset supercar_lambo_msg
int 21h

call nextline

mov ah, 9
mov dx, offset supercar_mclaren_msg
int 21h

call nextline

mov ah, 9
mov dx, offset supercar_bugatti_msg
int 21h

call nextline

mov ah, 9
mov dx, offset supercar_porsche_msg
int 21h

call nextline

mov ah, 9
mov dx, offset supercar_pagani_msg
int 21h

call nextline

mov ah, 9
mov dx, offset msg2 
int 21h

mov ah, 1
int 21h
mov bl, al
sub bl, 48

cmp bl, 1
je Two_Hundered_thousand

cmp bl, 2
je Two_Hundered_thousand

cmp bl, 3
je Two_Hundered_thousand

cmp bl, 4
je Two_Hundered_thousand

cmp bl, 5
je Two_Hundered_thousand

cmp bl, 6
je Two_Hundered_thousand

jmp Invalid 

Fifty_thousand:
call nextline
mov bl, 5          
mov ah,9
mov dx, offset msg3
int 21h

mov ah, 1
int 21h

sub al, 48

mul bl

aam

mov cx, ax
add ch, 48
add cl, 48

call nextline

mov ah, 9
mov dx, offset total_price_msg
int 21h

mov ah, 2
mov dl, ch
int 21h

mov dl, cl
int 21h

mov dl, '0'
int 21h

mov ah,9  
mov dx, offset usd_msg
int 21h

call nextline

mov ah, 9
mov dx, offset msg4
int 21h

call nextline

mov ah, 9
mov dx, offset exit_msg
int 21h

call nextline

mov ah, 9
mov dx, offset choice_msg
int 21h

mov ah, 1
int 21h

sub al, 48

cmp al, 1
je Cars_list

cmp al, 2
je Exit

jmp Invalid

Hundered_Thousand: 
call nextline
mov bl, 10         
mov ah,9
mov dx, offset msg3
int 21h

mov ah, 1
int 21h

sub al, 48

mul bl

aam

mov cx, ax
add ch, 48
add cl, 48

call nextline

mov ah, 9
mov dx, offset total_price_msg
int 21h

mov ah, 2
mov dl, ch
int 21h

mov dl, cl
int 21h

mov dl, '0'
int 21h

mov ah,9  
mov dx, offset usd_msg
int 21h

call nextline

mov ah, 9
mov dx, offset msg4
int 21h

call nextline

mov ah, 9
mov dx, offset exit_msg
int 21h

call nextline

mov ah, 9
mov dx, offset choice_msg
int 21h

call nextline

mov ah, 1
int 21h

sub al, 48

cmp al, 1
je Cars_list

cmp al, 2
je Exit

jmp Invalid

Two_Hundered_thousand:
call nextline
mov bl, 20          
mov ah,9
mov dx, offset msg3
int 21h

mov ah, 1
int 21h

sub al, 48

mul bl

aam

mov cx, ax
add ch, 48
add cl, 48

call nextline

mov ah, 9
mov dx, offset total_price_msg
int 21h

mov ah, 2
mov dl, ch
int 21h

mov dl, cl
int 21h

mov dl, '0'
int 21h

mov ah,9  
mov dx, offset usd_msg
int 21h

call nextline

mov ah, 9
mov dx, offset msg4
int 21h

call nextline

mov ah, 9
mov dx, offset exit_msg
int 21h

call nextline

mov ah, 9
mov dx, offset choice_msg
int 21h

call nextline

mov ah, 1
int 21h

sub al, 48

cmp al, 1
je Cars_list

cmp al, 2
je Exit

jmp Invalid

Invalid:
call nextline

mov ah, 9
mov dx, offset invalid_msg
int 21h

Exit:
main endp
end main