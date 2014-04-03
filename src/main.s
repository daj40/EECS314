	.text
	.globl main
main:
	# stick the resturn address on the stack
	addi $sp, $sp, -4
	sw $ra, 0($sp)

	li $v0, 4
	la $a0, splash_screen
	syscall

	li $v0, 12
	syscall

	li $v0, 4
	la $a0, clear_screen
	syscall

	jal read_command

	# restore the resturn address and return
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
	nop

read_command:
	li $s0, 0xA
	la $s1, input_string # start of the input buffer
	li $s3, 0x8
	li $s4, 0x7f

	# now loop reading characters until a newline is detected
read_command_loop:
	li $v0, 12
	syscall

	add $s2, $v0, $zero

	# check for backspace
	bne $s2, $s3, check_for_del
check_for_del:	
	bne $s2, $s4, append_char
	
remove_char:
	addi $s1, $s1, -1
	sb $zero, ($s1)
	j finish_str_update
	
append_char:	
	
	sb $v0, ($s1)
	addi $s1, $s1, 1
	sb $zero, ($s1) # terminate the string

finish_str_update:	
	# stick the resturn address on the stack
	addi $sp, $sp, -4
	sw $ra, 0($sp)

	la $a0, input_string
	add $a1, $s1, $zero
	jal refresh_screen

	# restore the resturn address and return
	lw $ra, 0($sp)
	addi $sp, $sp, 4

	bne $s2, $s0, read_command_loop

	j read_command
	jr $ra
	nop

refresh_screen:
	add $t2, $zero, $a0

	li $v0, 4
	la $a0, clear_screen
	syscall
	
	li $v0, 4
	la $a0, input_prompt
	syscall

	li $v0, 4
	add $a0, $t2, $zero
	syscall

	li $v0, 11
	li $a0, 0xA
	syscall

	# figure out the number of blanks line needed
	# to redraw the screen
	addi $t0, $zero, 30
	addi $t1, $zero, 50
	sub $t2, $a1, $t2
	div $t2, $t1
	mflo $t1
	sub $t0, $t0, $t1
	li $v0, 11
	la $a0, 0xA
blank_line_loop:
	syscall
	addi $t0, $t0, -1
	bne $t0, $zero, blank_line_loop
	
	jr $ra

.data
input_string: .space 100 # 99 char string
