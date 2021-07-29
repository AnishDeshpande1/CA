#################Data Structures##########

.data
my_array:
	.word 0 0 -1 2 0 2 -1 -1


#################Main Code################
.text
main:


	la $s0 complex
	lw $t0 16($s0)
	lw $t1 20($s0)

	add $t2 $t1 $t0

	li $v0 1
	move $a0 $t2
	syscall



##################Exiting#################
	li $v0 10
	syscall