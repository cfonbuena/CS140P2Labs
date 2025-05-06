.data
    i: .word 100
    jval: .word 100
    f: .word 0
    g: .word 10
    h: .word 5

.text
.globl main
main:
    lw $t0, f
    lw $t1, g
    lw $t2, h
    lw $t3, i
    lw $t4, jval

    slti $t5, $t3, 10
    beq $t5, $zero, false
    add $t0, $t1, $t2
    j exit 

false:
    lui $t5, 0xFFFF
    ori $t5, $t5, 0xFFFF
    xor $t2, $t2, $t5
    addi $t2, $t2, 1
    add $t0, $t1, $t2

exit:
    sw $t0, f

    li $v0, 1
    move $a0, $t0
    syscall

    li $v0, 10
    syscall