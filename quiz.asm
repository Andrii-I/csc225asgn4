# Andrii Ieroshenko, assignment 4
# Quiz

# jal t1, target          Jump and link : Set t1 to Program Counter (return address) then jump to statement at target address
# jalr t1, t2, -100       Jump and link register: Set t1 to Program Counter (return address) then jump to statement at t2 + immediate
 
.text 
b main # goto main to skip subroutine declaration space

# Subroutine/function to get the integer input (answer to question) from the user. 
# print input prompt, read input integer into a0, return from subcall 
.globl getAnswer
getAnswer:

# WERE SHOULD I SAVE a7? DO I NEED TO SAVE IT?

    li a7, 4 
    la a0, InputMsg
    ecall
    
    li a7, 5 
    ecall
    
    jr ra #also could use just "ret"

.globl main
main:
# print Quiz Q1 to the user and call getAnswer subroutine to get answer in a0
    la t0, QuestionTable
    lw a0, 0(t0)
    li a7, 4 
    ecall
    
    jal getAnswer
 
# in the end, loop back to the beginning
b main

