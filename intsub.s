// Takes r0=a, r1=b, r2=cin

.global intsub
intsub:
    neg r1, r1 // negate second argument
    b intadd
