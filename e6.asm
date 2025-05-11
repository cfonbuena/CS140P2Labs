.data
    array: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
    size: .word 10
    # i: .word 0
    # sum: .word 0
    result: .word 0 
    # offset: .word 0
.text
.globl main
main:
    la $t0, array 
    lw $t1, size
    # lw $t2, i    
    # lw $t3, sum
    lw $t4, result
    # lw $t5, offset    
    sll $t5, $t2, 2
    add $t5, $t5, $t0 

loop:
    slt $t4, $t2, $t1     
    beq $t4, $zero, exit    
    lw $t6, 0($t5)          
    add $t3, $t3, $t6       

    addi $t2, $t2, 1       
    sll $t5, $t2, 2 
    add $t5, $t5, $t0       
    j loop
       

exit: 
    sw $t3, result    
    li $v0, 1          
    move $a0, $t3   
    syscall            

    li $v0, 10         
    syscall        
