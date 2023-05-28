.global _start
.align 2 // apple silicon - has to start on 64 bit boundry

_start:
    /* b _reboot */
    b _printf
    b _terminate
    
 _printf:
    mov X0, #1 // stdout
    adr X1, string // address of string
    mov X2, #15 // length of string
    mov X16, #4 // write
    svc 0 // syscall
 
 // in arm assembly apple silicon, first 7 registers of the x variety are for parameters.
_terminate:
    mov X0, #0 // return 0
    // terminate - Call linux service command
    // superviser call - Allow application code to call the OS
    mov X16, #1
    svc 0 // syscall

/* Careful running - Will reboot computer. */
/* 
_reboot:
    mov X0, #1 // instant reboot
    mov X16, #55 // reboot
    svc 0 // syscall
 */

string: .ascii "arm64 assembly\n"