    .text

    @ Copy IVT to 0xA0000020
    ldr   r0, =0xA0000020
    ldr   r2, =0x12345678
    str   r2, [r0, #0]
    ldr   r2, =0xBAD0BEEF
    str   r2, [r0, #4]

    @ Update VTOR
    ldr   r0, =0xA0000020
    ldr   r1, =0xA0000000
    str   r0, [r1]

    @ Update SP
    ldr   r0, =0xA0000004
    ldr   r1, =0xA0000020
    ldr   r2, [r1]
    str   r2, [r0]

    @ Update PC
    ldr   r0, =0xA0000008
    ldr   r1, =0xA0000024
    ldr   r2, [r1]
    str   r2, [r0]
    
stop:   b stop               @ Infinite loop to stop execution
