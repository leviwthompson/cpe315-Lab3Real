// Takes r0=multiplicand, r1=multiplier
// returns r0=product
.global intmul
intmul:
    push {r4, r5, r6, r7, lr} // r4,r5 = temp, r6 = counter, r7 = product
    mov r7, #0 // set product to 0
    mov r6, #0 // set counter to 0
    mov r4, r0 // store multiplicand in r4
    mov r5, r1 // store multiplier in r5
mulloop:
    cmp r6, #31
    beq return
    and r2, r5, #1
    cmp r2, #0 // check if multiplier is 0
    beq afterop
    mov r0, r7
    mov r1, r4
    bl intadd
    mov r7, r0
afterop:
    lsl r4, r4, #1
    lsr r5, r5, #1
    // Increment count
    mov r0, r6
    mov r1, #1
    bl intadd
    mov r6, r0
    b mulloop
return:
    mov r0, r7
    pop {r4, r5, r6, r7, pc}
