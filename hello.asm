        ;; hello.asm

        section .text

        global mystart

mywrite:
        mov eax, 0x4
        int 0x80
        ret

myexit:
        mov eax, 0x1
        int 0x80
        
mystart:
        push dword mylen
        push dword mymsg
        push dword 1

        call mywrite

        add esp, 12

        ;; 2 exit program

        ;; 2a prepare arguments for sys call to exit
        push dword 0
        call myexit

        ;; 2b make the call to exit

        section .data

        mymsg db "hello, world!", 0xa
        mylen equ $-mymsg
