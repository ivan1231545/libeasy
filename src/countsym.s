.global countsym
.text
countsym:
	push { r4, r5, r6, pc }
	mov r4, r0
	mov r5, #0
	mov r6, #0
count_loop:
     ldrb r5, [r4, r6]
     cmp r5, #0
     beq done_loop
     add r6, r6, #1
     b count_loop

done_loop:
	mov r0, r6

	pop { r4, r5, r6, pc }
