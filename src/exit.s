.global exit
exit:
	pop { lr }
	mov r0, #0
	mov r7, #1
	svc #0
	push { pc }
