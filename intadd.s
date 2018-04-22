.global intadd
// Takes r0 = a, r1 = b, r2 = cin
// Executes a xor b xor cin
// Returns sum in r0 and cout in r1
// cout = (a and b) or (b and cin) or (a and cin)
intadd:
    push {r4, r5, r6, r7, lr} //r4=a, r5=b, r6=cin, r7=sum

    mov r4, r0  // Store a in r4
    mov r5, r1  // Store b in r5

    eor r0, r5 // a xor b
    mov r7, r0 // s=a xor b
loop:
    and r1, r4, r5 // and current a and b
    lsl r1, r1, #1 // shift result left
    cmp r1, #0 // if 0, done
    beq end

    mov r4, r7 // a = s
    mov r5, r1 // b = a&b  from above

    mov r2, r4
    eor r2, r5 // a xor b
    mov r7, r2 // s=a xor b

    b loop
end:
    mov r0, r7
    pop {r4, r5, r6, r7, pc}
