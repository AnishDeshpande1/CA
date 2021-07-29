.data
arr:	.space 100

.text
.globl main
main:	li 	$t0, 0
li 	$t1, 0
li 	$t4, 0
li 	$t5, 4
li 	$s0, 1
li 	$s1, 1
li 	$s3, 6
sw 	$s1, arr($t1)
go: 	addi 	$t1, 4
sw 	$s1, arr($t1)
addi 	$t1, 4
sw 	$s1, arr($t1)
here: 	addi 	$t1, 4
lw 	$t6, arr($t4)
lw 	$t7, arr($t5)
L1: 	add 	$t6, $t6, $t7
sw 	$t6, arr($t1)
addi 	$t4, 4
addi 	$t5, 4
addi 	$t0, 1
bne 	$t0, $s0, here
L2: 	addi 	$s0, $s0, 1
addi 	$t4, 4
addi 	$t5, 4
li 	$t0, 0
bne 	$s0, $s3, go
j 	$ra