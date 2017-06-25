        ;; hello.asm

        section .text

        global mystart

mystart:

        ;; 1 print 'hello, world!'

        ;; 1a prepare arguments for system call
        push dword mylen
        push dword mymsg
        push dword 1

        ;; 1b call system call to write
        mov eax, 0x4
        sub esp, 4
        int 0x80

        ;; 1c clean up stack
        add esp, 16

        ;; 2 exit program

        ;; 2a prepare arguments for sys call to exit
        push dword 0

        ;; 2b make the call to exit
        mov eax, 0x1
        sub esp, 4
        int 0x80

        section .data

        mymsg db "hello, world!", 0xa
        mylen equ $-mymsg
