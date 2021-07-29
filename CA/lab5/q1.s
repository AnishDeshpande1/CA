
.data

	enterMod: .asciiz "Enter modulus: "
	enterStr: .asciiz "Enter string of 12 decimal digits: "
	mod1: .asciiz " mod "
	mod2: .asciiz " = "
	continue: .asciiz "\nWish to continue?: "
	newline: .asciiz "\n"
	yes: .byte 'Y'
	.align 2
	buffer: .space 14
	char: .space 5

.text
main:
###########INPUT###########################
  rep:



    li $v0 4
	la $a0 enterMod			  #DISPLAYING "Enter modulus:"
	syscall

	li $v0 5
	syscall
	move $s0 $v0               #s0 stores modulus

	li $v0 4
	la $a0 enterStr		  #DISPLAYING "Enter string...:"
	syscall

	li $v0 8
	la $a0 buffer
	li $a1 14
	syscall
	sb $0 12($a0)

	la $a0 buffer		#Address of number
	move  $a1 $s0		#modulus
	li $a2 12			#Number of digits remaining in the number (from the left)
	jal modn

	move $a0 $v0
	jal print_val		#Pass a0 as answer parameter and print in the expected format

################CHECK IF WISH CONTINUE############
	la $a0 continue		
	li $v0 4
	syscall

	la $a0 char
	li $v0 8
	li $a1 4
	syscall

	lb $t0 0($a0)
	la $a0 yes
	lb $t1 0($a0)

	bne $t0 $t1 end

	j rep
#########################PRINT Function##############################

print_val:
	move $t0 $a0

	la $a0 buffer
	li $v0 4
	syscall

	la $a0 mod1
	li $v0 4
	syscall

	move $a0 $s0
	li $v0 1
	syscall 

	la $a0 mod2
	li $v0 4
	syscall

	move $a0 $t0
	li $v0 1
	syscall

	jr $ra 
###########################MODULO Function##################################
modn:
	
	li $t0 1
	move $t1 $a2			#Number of digits remaining from left
	addi $t1 $t1 -1			#Index of last digit of the remaining number
	add $a0 $a0 $t1			#go to that index
	lb $t3 0($a0)			#load that byte
	andi $t3 $t3 0x0F
	bne $a2 $t0 cont        #if it is the only digit left, find the remainder and exit
	rem $v0 $t3 $a1
	jr $ra

cont:
    rem $t4 $t3 $a1			#Find the remainder of that digit.
    addi $a2 $a2 -1			#Decrement num of digits left
    la $a0 buffer			#load initial number address
	addi $sp $sp -8
	sw $ra 0($sp)
	sw $t4 4($sp)
	jal modn				#Find modn of remaining MSBs 
	lw $ra 0($sp)
	lw $t4 4($sp)
	addi $sp $sp 8
	move $t5 $v0
	li $t6 10				
	mult $t5 $t6
	mflo $t5				#(10*remainder_all_MSBs + remainder of LSB)%n = final answer
	add $v0 $t4 $t5			
	rem $v0 $v0 $a1
	jr $ra

######FINISH##############
end:
	li $v0 10
	syscall

	

