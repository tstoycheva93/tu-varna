.text
.global start
start:
    ldr r0, =NameSurname 
    mov r1, #0 
    mov r2, #0 

count_loop:
    ldrb r3, [r0], #1 
    cmp r3, #0
    beq end_count_loop
    cmp r3, #'a'
    bne not_a
    add r1, r1, #1 
not_a:
    b count_loop

end_count_loop:
    ; Now r1 holds the count of 'a' occurrences
    swi 0x11

.data
NameSurname: .Ascii "teodora stoycheva"
.end
