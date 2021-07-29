.data

	message1: .asciiz "Enter No. of integers in list\n"
	message2: .asciiz "Enter list\n"
	message3: .asciiz "Enter k\n"
	.align 2
	arr: .space 200

.text
main:
############TAKING N INPUT###############
li $v0 4
la $a0 message1			  #DISPLAYING "Enter 'n':"
syscall

li $v0 5
syscall
move $t0 $v0               #t0 stores n
######TAKING ARRAY INPUT#################
li $v0 4
la $a0 message2			  #DISPLAYING "Enter the n-length array of integers, line separated:""
syscall
la $s2 arr 				  #s2 stores the address of the array's initial location
addi $t0 $t0 -1			  #t0 now stores n-1

li $s1 -1
loop: addi $s1 $s1 1	  #increment loop counter
	  sll $t2 $s1 2    	  #t2 stores the offset (multply counter by 4)
	  add $s3 $t2 $s2	  #s3 has relevant storage address
	  li $v0 5
	  syscall
	  move $t3 $v0
	  sw $t3 0($s3)	      #Store to array
	  bne $s1 $t0 loop
##########Enter k#########################
la $a0 message3
li $v0 4
syscall

li $v0 5
syscall
move $t1 $v0			  #t1 now holds k.

######INITIALISING REQUIRED VARIABLES#####
addi $t0 $t0 1				  #t0 now holds n
li $t8 -2147483648		  	  #INT MIN
li $t9 2147483647		      #INT MAX ($t9 will store FINAL ANSWER)
move $t7 $t8			      #t7 Will store each successive maximum
li $t6 0					  #A "FOUND" variable, checking whether a kth maximum is actually possible
							  # Eg: k = 2, lis = 5,5,5. (here t6=0, output = INTMIN)
##############LOOPING#####################
li $s0 0				#outer loop counter
loopk:
	li $s1 0	            #inner loop counter
	loopn:															#  max = INT_MAX, this_max = INT_MIN, found = 0
		sll $t2 $s1 2		#t2 holds the offset					#  for(j=1:j<=k;j++)
		add $s3 $t2 $s2     #s3 holds the relevant address			#		for(i=0;i<n;i++)
		lw $t3 0($s3)												#			if(a[i]<max)
																	#				if(a[i]>=this_max)
		bge $t3 $t9 end_inner										#					this_max=a[i]
																	#					found = 1
		blt $t3 $t7 end_inner										#		
		move $t7 $t3												#		max = this_max
		li $t6 1													#		this_max = INT_MIN
																	#		if(found == 0)	
																	#			print(INT_MIN)
		end_inner:													#			exit()
		addi $s1 $s1 1												#		found = 0
		bne $s1 $t0 loopn 											#  
																	#  print(max)
	move $t9 $t7													#
	move $t7 $t8													#
																	#
	beq $t6 $0 no_k_ending											#
	li $t6 0														#
																	#
	addi $s0 $s0 1													#
	bne $s0 $t1 loopk
######PRINTING FINAL OUTPUT#############
move $a0 $t9
li $v0 1
syscall
b end

no_k_ending:
move $a0 $t9
li $v0 1
syscall

end:
li $v0 10
syscall