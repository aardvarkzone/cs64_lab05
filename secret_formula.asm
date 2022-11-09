.data

krabby: .word 1 2 3 4 5 6 7 8 9 10

carray: .word 0:10

marray: .word 0:10

encrypted: .asciiz "Encrypted: "

decrypted: .asciiz "Decrypted: "

newline: .asciiz "\n"

comma: .asciiz ", "

.text
main:
	la $a0, krabby # load address of array krabby in $a0
	li $a1, 10 # $a1 = length 

	la $a2, carray # load address of array carray in $a2
	la $a3, marray # load address of array marray in $a

	move $s0 $a0 # $s0 is krabby 
	move $s1 $a1 # $s1 is 10 
	move $s2 $a2 # $s0 is carray 
	move $s3 $a3 # $s0 is marray 
	li $s4 9

	#fill in your loop here
	#feel free to use 2 loops if you need to

	li $t0 0 # loop counter
	li $t1 0 # array iterator  
	li $t2 0 # array iterator ($t1) plus krabby
	li $t3 0 # array iterator ($t1) plus carray
	li $t4 0 # array iterator ($t1) plus marray
	li $t5 0 

	li $v0 4
	la $a0 encrypted
	syscall

	loop_c:
		beq $t0 $s1 print_int_1 # when length counter = 10 then print arrays
		sll $t1 $t0 2
		addu $t2 $t1 $s0
		lw $t2 0($t2)

		addu $t3 $t1 $s2
		addu $t4 $t1 $s3

		lw $t5 0($t3)
		
		li $a0 3 # a, x
		li $a1 11 # b, y 
		move $a2 $t2
		jal secret_formula_apply
		sw $v0 0($t3)

		li $a0 3 # a, x
		li $a1 11 # b, y 
		move $a2 $t5
		jal secret_formula_remove
		sw $v1 0($t4)

		addi $t0 $t0 1 # increment for loop 
		j loop_c

	print_int_1:
		li $t0 0
		li $t1 0
		li $t2 0
		li $t3 1 # loop counter
		j print_1

	print_1: 
		beq $t0 $s4 cont_1

		sll $t1 $t0 2
		addu $t2 $t1 $s2
		lw $t2 0($t2)

		li $v0 1
		move $a0 $t2
		syscall

		li $v0 4
		la $a0 comma
		syscall
	
		addi $t0 $t0 1
		j print_1

	cont_1:
		addiu $t2 $s2 36
		lw $t2 0($t2)
		li $v0 1
		move $a0 $t2
		syscall

		li $v0 4
        la $a0 newline
        syscall

		li $v0 4
		la $a0 decrypted
		syscall
		j print_int_2

	print_int_2:
		li $t0 0
		li $t1 0
		li $t2 0
		li $t3 1 # loop counter
		j print_2

	print_2: 
		beq $t0 $s4 cont_2

		sll $t1 $t0 2
		addu $t2 $t1 $s3
		lw $t2 0($t2)

		li $v0 1
		move $a0 $t2
		syscall

		li $v0 4
		la $a0 comma
		syscall
	
		addi $t0 $t0 1
		j print_2

	cont_2:	
		addiu $t2 $s3 36
		lw $t2 0($t2)
		li $v0 1
		move $a0 $t2
		syscall
		j exit


secret_formula_apply:
#fill stuff here thanks
	li $t6 7 # e

	mult $a0 $a1 
	mflo $t8 # n

	li $t5 1 # let $t5 store the output each iteration
	li $t9 1 # let $t6 be a counter for the loop

	loop: # branch to printout when $t3 < $t6 
		blt $t6 $t9 loop_2
		mult $t5 $a2
		mflo $t5 # stores mult result
		addi $t9 $t9 1 # counter++
		j loop

	loop_2: 
		blt $t5 $t8 end_func
		sub $t5 $t5 $t8 
		j loop_2

	end_func: 
		move $v0 $t5
		jr $ra

secret_formula_remove:
#fill more stuff here thanks
	li $t6 3 # e

	mult $a0 $a1 
	mflo $t8 # n

	li $t5 1 # let $t5 store the output each iteration
	li $t9 1 # let $t6 be a counter for the loop

	loop_r: # branch to printout when $t3 < $t6 
		blt $t6 $t9 loop_2_r
		mult $t5 $a2
		mflo $t5 # stores mult result
		addi $t9 $t9 1 # counter++
		j loop_r

	loop_2_r: 
		blt $t5 $t8 end_func_r
		sub $t5 $t5 $t8 
		j loop_2_r

	end_func_r: 
		move $v1 $t5
		jr $ra

exit:
	li $v0, 10
	syscall


