.global write
.text
write:
	push { r4, r5, r6, lr }
	
	mov r4, #0
	mov r5, #0
	mov r6, #0

	mov r4, r0
	b count_loop

count_loop:
	ldrb r5, [r4, r6]
	cmp r5, #0
	beq done_loop
	add r6, r6, #1
	b count_loop

done_loop:
	mov r7, #4
	mov r0, #1
	mov r1, r4
	mov r2, r6
	svc #0

	pop { r4, r5, r6, pc }
