# pow.asm program
#

# C++ (NON-RECURSIVE) code snippet of pow(x,n):
#	int x, n, pow=1; 
#   cout << "Enter a number x:\n"; 
#   cin >> x;
#   cout << "Enter the exponent n:\n"; 
#   cin >> n; 
#   for (int i = 1; i <= n; i++) { 
#   	pow = pow * x; 
#   } 
#   cout << "Power(x,n) is:\n" << pow << "\n";
#
# Assembly (NON-RECURSIVE) code version of pow(x,n):
#
.data
	# TODO: Write your initializations here
	x_input: .asciiz "Enter a number x:\n"
	n_input: .asciiz "Enter the exponent n:\n"
	newline: .asciiz "\n"
	output: .asciiz "Power(x,n) is:\n"

#Text Area (i.e. instructions)
.text
main:
	# TODO: Write your code here
	# print x_input
	li $v0 4
	la $a0 x_input
	syscall

	# store x in $t0
	li $v0 5
	syscall
	move $t0 $v0

	# print n_input
	li $v0 4
	la $a0 n_input
	syscall

	# store x in $t1
	li $v0 5
	syscall
	move $t1 $v0
	
	li $t2 1 # let $t2 be a counter for the loop
	li $t3 1 # let $t3 store the output each iteration

	loop: # branch to printout when $t1 < $t2 
	blt $t1 $t2 printout
	mult $t3 $t0
	mflo $t3 # stores mult result
	addi $t2 $t2 1 # counter++
	j loop

	printout:
	# print "Power(x,n) is:"
	li $v0 4
	la $a0 output
	syscall

	# print $t3 
	li $v0 1
	move $a0 $t3
	syscall

	# print "\n"
	li $v0 4
	la $a0 newline
	syscall

	j exit

exit:
	# TODO: Write code to properly exit a SPIM simulation
	li $v0, 10 
    syscall 