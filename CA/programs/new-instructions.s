#################Main Code################
.text

main:
	
	li $t1 0x123
	li $t2 0x34500000

	sll $t3 $t2 4

	slt $t0 $t1 $t2

	mult $t1 $t2

	mflo $t4
	mfhi $t5

##################Exiting#################
	li $v0 10
	syscall