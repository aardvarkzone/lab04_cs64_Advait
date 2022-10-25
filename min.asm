# min.asm program

.data

    # TODO: Complete these declarations / initializations

    num_prompt: .asciiz "Enter the next number:\n"
    min: .asciiz "Minimum: "
    newline: .asciiz "\n"

#Text Area (i.e. instructions)
.text

main:

    # TODO: Write your code here
    # You can have other labels expressed here, if you need to

    # print "Enter the next number:\n"
    li $v0 4
    la $a0 num_prompt
    syscall

    # store first int - x
    li $v0 5
    syscall
    move $t0 $v0

    # print "Enter the next number:\n"
    li $v0 4
    la $a0 num_prompt
    syscall

    # store second int - y
    li $v0 5
    syscall
    move $t1 $v0

    # print "Enter the next number:\n"
    li $v0 4
    la $a0 num_prompt
    syscall

    # store second int - z
    li $v0 5
    syscall
    move $t2 $v0

    # min 
        
    blt $t0 $t1 x_less_z
    # compare x and y with branch if less than (blt)
    # if x < y then jump to branch x_less_z, else continue

    blt $t1 $t2 print_y
    j print_z
    # compare y and z with branch if less than (blt)
    # if y < z then jump to print_y b/c y < x, z, else print_z

    x_less_z:
        blt $t0 $t2 print_x
        j print_z
    # check if x < z (given x < y); jump to print_x
    # else jump to print_z b/c z < x < y

    print_x: 
        li $v0 4
        la $a0 min
        syscall

        li $v0 1
        move $a0 $t0
        syscall

        li $v0 4
        la $a0 newline
        syscall

        j exit
    #prints "minumum: x\n" after checking x < y, z

    print_y: 
        li $v0 4
        la $a0 min
        syscall

        li $v0 1
        move $a0 $t1
        syscall

        li $v0 4
        la $a0 newline
        syscall

        j exit
    #prints "minumum: y\n" after checking y < x, z

    print_z: 
        li $v0 4
        la $a0 min
        syscall

        li $v0 1
        move $a0 $t2
        syscall

        li $v0 4
        la $a0 newline
        syscall

        j exit
    #prints "minumum: z\n" after checking z < y, x

exit:
    # TODO: Write code to properly exit a SPIM simulation
    li $v0, 10 
    syscall 
