.section .data
msg:    .ascii "Hello from GAS!\n"
len = . - msg

.section .text
.global _start
_start:
    movl $4, %eax        # sys_write (Systemaufruf 4)
    movl $1, %ebx        # file descriptor 1 = stdout
    movl $msg, %ecx      # Zeiger auf Nachricht
    movl $len, %edx      # Länge der Nachricht
    int $0x80            # Interrupt, um den Syscall auszuführen

    movl $1, %eax        # sys_exit (Systemaufruf 1)
    movl $0, %ebx        # Rückgabewert 0
    int $0x80
