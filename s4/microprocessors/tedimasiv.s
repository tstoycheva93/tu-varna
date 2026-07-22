.text
.global start

start:
    ldr r1, =a
    ldr r2, =n
    ldr r2, [r2]
    ldr r3, =br
    ldr r3, [r3]
    bl count
    ldr r1, =br
    str r3, [r1]
    swi 0x11

count:
    ldr r4, [r1]
    cmp r4, #30
    blt skip
    cmp r4, #55
    bgt skip
    adds r3, r3, #1
skip:
    adds r1, r1, #4
    subs r2, r2, #1
    bne count
    bx lr

.data
a:  .word 23, 34, 37, 38, 41, 44, 57, 61, 64, 72
br: .word 0
n:  .word 10

.end
