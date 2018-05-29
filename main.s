.syntax unified

 .arch armv7a
    .fpu vfp

.global main

main:
      push {r0-r6, lr}
      sub  sp, sp, #4
    @ driver function main lives here, modify this for your other functions
loop: 
      ldr r0, =number1  @ print first message
      bl printf
      ldr     r0, =scanint
      mov     r1, sp
      bl      scanf           @ Scan user's answer
      ldr     r4, [sp]        @ r4 holds first num
      ldr r0, =number2  @ print first message
      bl printf
      ldr     r0, =scanint
      mov     r1, sp
      bl      scanf           @ r5 holds second num
      ldr     r5, [sp]
      ldr r0, =operation  @ print first message
      bl printf
      ldr     r0, =scanchar
      mov     r1, sp
      bl      scanf
      ldrb     r6, [sp]        @ r6 holds operation char
      mov     r0, r4
      mov     r1, r5
      ldr     r2, =addit
      ldrb    r2, [r2]
      cmp     r6, r2
      beq     calladd
      ldr     r2, =subtract
      ldrb    r2, [r2]
      cmp     r6, r2
      beq     callsub
      ldr     r2, =mult
      ldrb    r2, [r2]
      cmp     r6, r2
      beq     callmult
      b       loop
calladd:
      bl      intadd
      b       end
callsub:
      bl      intsub
      b       end
callmult:
      bl      intmul
      b       end
    @ You'll need to scan characters for the operation and to determine
    @ if the program should repeat.
    @ To scan a character, and compare it to another, do the following
end: 
      mov     r1, r0
      ldr     r0, =result
      bl      printf
      ldr     r0, =again
      bl      printf
      ldr     r0, =scanchar
      mov     r1, sp          @ Save stack pointer to r1, you must create space
      bl      scanf           @ Scan user's answer
      ldr     r1, =yes        @ Put address of 'y' in r1
      ldrb    r1, [r1]        @ Load the actual character 'y' into r1
      ldrb    r0, [sp]        @ Put the user's value in r0
      cmp     r0, r1          @ Compare user's answer to char 'y'
      beq     loop            @ branch to appropriate location
      add     sp, sp, #4
      pop     {r0-r6, pc}
    @ this only works for character scans. You'll need a different
    @ format specifier for scanf for an integer ("%d"), and you'll
    @ need to use the ldr instruction instead of ldrb to load an int.
addit:
    .byte   '+'
mult:
    .byte   '*'
subtract:
    .byte   '-'
yes:
    .byte   'y'
scanint:
    .asciz  "%d"
scanchar:
    .asciz  " %c"
result:
    .asciz  "Result is: %d\n"
number1:
    .asciz  "Enter Number 1: "
number2:
    .asciz  "Enter Number 2: "
operation:
    .asciz  "Enter Operation: "
again:
    .asciz  "Again? "
