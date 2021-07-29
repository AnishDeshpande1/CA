##########################################
.text


main:
	
	addi $s0 $zero 1

LOOP:

	addi $sp $sp -4
	sw $s0 0($sp)
	lw $s1 0($sp)
	j LOOP

