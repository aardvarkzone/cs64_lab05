.data

krabby: .word 1 2 3 4 5 6 7 8 9 10

carray: .word 0:10

marray: .word 0:10

.text
main:
	la $a0,krabby
	li $a1,10

	la $a2,carray
	la $a3,marray
	
	#fill in your loop here
	#feel free to use 2 loops if you need to

	j exit

secret_formula_apply:
#fill stuff here thanks

secret_formula_remove:
#fill more stuff here thanks

exit:
	li $v0, 10
	syscall


