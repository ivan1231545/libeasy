# libeasy
A lib to make ARM V7 ASM easier.

This is a static library for assembly code.
As known, assembly code is long in writing. For example, to write "Hello, World!\n" into stdout, you have to code:

```asm (pseudocode)
<...>
mov r7, #4
mov r0, #1
ldr r1, =msg_to_write
mov r2, #14
swi 0
mov r0, #0
mov r7, #1
swi 0

.data
msg_to_write: .asciz "Hello, World!\n"
```

And, with my library, this program can be much shorter:

```asm (pseudocode)
<...>
ldr r0, =msg_to_write
bl print
bl exit

.data
msg_to_write: .asciz "Hello, World!\n"
```

# Functions

This library, on the current moment, provides these functions:

- **print**: writes text ends with "\0" (.asciz) in the end and automatically adds "\n" at the end.
  - INPUT:   r0 - address to the .asciz string to write.
  - RETURNS: nothing.
  - REGISTERS USED: r0, r1, r2, r3.
- **exit**: exits from the program with status 0 (sucess).
  - INPUT:   nothing.
  - RETURNS: nothing.
- **countsym**: counts symbols of the string given.
  - INPUT:   r0 - address to the .asciz string to count symbols.
  - RETURNS: r0 - count of the symbols with \0
