
.data

	enterM: .asciiz "Enter m: "
	enterN: .asciiz "Enter n: "
	gcd1: .asciiz "gcd("
	gcd2: .asciiz ","
	gcd3: .asciiz ") = "
	continue: .asciiz "\nWish to continue?: "
	newline: .asciiz "\n"
	yes: .byte 'Y'
	.align 2
	buffer: .space 12

.text
main:
###########INPUT###########################
  rep:



    li $v0 4
	la $a0 enterM			  #DISPLAYING "Enter 'm':"
	syscall

	li $v0 5
	syscall
	move $s0 $v0               #s0 stores m

	li $v0 4
	la $a0 enterN		  #DISPLAYING "Enter 'n':"
	syscall

	li $v0 5
	syscall
	move $s1 $v0               #s1 stores n

########PARAMS TO a0,a1, call function######
	
	move $a0 $s0
	move $a1 $s1

	jal gcd
##########PRINT OUTPUT###################
	move $t0 $v0

	la $a0 gcd1
	li $v0 4
	syscall

	move $a0 $s0
	li $v0 1
	syscall

	la $a0 gcd2
	li $v0 4
	syscall

	move $a0 $s1
	li $v0 1
	syscall

	la $a0 gcd3
	li $v0 4
	syscall

	move $a0 $t0
	li $v0 1
	syscall 

	la $a0 continue
	li $v0 4
	syscall
######CHECK IF WISH CONTINUE#############
	la $a0 buffer
	li $v0 8
	li $a1 4
	syscall

	lb $t0 0($a0)
	la $a0 yes
	lb $t1 0($a0)

	bne $t0 $t1 end


	j rep
#############FINISH#####################
	end:
	li $v0 10
	syscall


####################################GCD##############################
gcd:
########BASECASES#########
	bne $a0 $a1 cont
	move $v0 $a0
	jr $ra

	cont:
	bne $a0 $0 cont1
	move $v0 $a1
	jr $ra

	cont1:
	bne $a1 $0 cont2
	move $v0 $a0
	jr $ra 

	cont2:
	bge $a0 $a1 skip			# ensure m > n
	move $t0 $a0
	move $a0 $a1
	move $a1 $t0
#######CHECK REMAINDER########
	skip:
	rem $t0 $a0 $a1
	bnez $t0 recall
	move $v0 $a1
	jr $ra
####RECURSIVE PART########
	recall:
	move $a0 $a1
	move $a1 $t0
	addi $sp $sp -4
	sw $ra 0($sp)
	jal gcd
	lw $ra 0($sp)
	addi $sp $sp 4
	jr $ra
