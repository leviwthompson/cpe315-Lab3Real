.global intadd
// Takes r0 = a, r1 = b, r2 = cin
// Executes a xor b xor cin
// Returns sum in r0 and cout in r1
// cout = (a and b) or (b and cin) or (a and cin)
intadd:
    push {r4, r5, r6, r7, lr} //r4=a, r5=b, r6=cin, r7=sum

    mov r4, r0
    mov r5, r1

    eor r0, r5 // a xor b
    mov r7, r0 // s=a xor b
loop:
    and r1, r4, r5
    lsl r1, r1, #1
    cmp r1, #0
    beq end

    mov r4, r7
    mov r5, r1

    mov r2, r4
    eor r2, r5 // a xor b
    mov r7, r2 // s=a xor b

    b loop
end:
    mov r0, r7
    pop {r4, r5, r6, r7, pc}
