.text 

main: 

######Alternate to li $t1 0x20000001
lui $t1 0x2000 
ori $t1 $t1 0x0001

######Alternate to li $t1 0x10000002
lui $t2 0x1000 
ori $t2 $t2 0x0002

add $t3 $t1 $t2
