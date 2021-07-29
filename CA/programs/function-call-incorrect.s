##########################################
.data

mcall: .asciiz "main subroutine "
fcall: .asciiz "first subroutine "
scall: .asciiz "second subroutine "
tcall: .asciiz "third subroutine "

#############################################
.text


third:
	
	li $v0 4
	la $a0 tcall
	syscall

	jr $ra

second:
	

	jal third

	li $v0 4
	la $a0 scall
	syscall

	jr $ra

first:

	

	jal second

	li $v0 4
	la $a0 fcall
	syscall
	
	# perform the exit syscall from first subroutine
	li $v0, 10
	syscall


main:

	li $v0 4
	la $a0 mcall
	syscall

	jal first
