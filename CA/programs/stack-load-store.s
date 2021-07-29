##########################################
.text

STACKLOAD:
	####Load values from stack in $t0, $t1 and $t2
	####Write your code here

	lw $t2 0($sp)
	lw $t1 4($sp)
	lw $t0 8($sp)

	#########################

	##printing values
	li $v0 1
	move $a0 $t0
	syscall

	li $v0 1
	move $a0 $t1
	syscall

	li $v0 1
	move $a0 $t2
	syscall


	jr $ra






main:
	
	##Program Begins
	####Storing in stack
	addi $s0 $zero 1
	addi $s1 $zero 2
	addi $s2 $zero 3


	
	######### <--- Stack pointer
	#	s0	#
	#	s1	#
	#	s2	#
	######### <--- New Stack Pointer
	

	####write your code here#####
	addi $sp $sp -12
	sw $s2 0($sp)
	sw $s1 4($sp)
	sw $s0 8($sp)
	

	######################
	jal STACKLOAD


	# perform the exit syscall
	li $v0, 10
	syscall