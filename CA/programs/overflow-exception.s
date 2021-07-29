	

main:

	#########2 cases in which exception throw happens
	li $t1, 0x7fffffff
    li $t2, 0x00000001

	# li $t1, 0x8fffffff
    # li $t2, 0x80000001

    add $t3, $t1, $t2 

    ################Try this, it will not through exception##############

    #addu $t3, $t1, $t2    