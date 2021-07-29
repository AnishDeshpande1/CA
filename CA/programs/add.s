.data

	message1: .asciiz "Enter 'n':\n"
	message2: .asciiz "Enter 'k':\n"
	arr: .space 200

.text


main:


li $v0 5
syscall
move $t0 $v0               #t0 stores n

li $v0 5
syscall
move $t1 $v0

add $a0 $t0 $t1
li $v0 1
syscall

li $v0 10
syscall


