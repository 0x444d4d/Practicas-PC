
m=5
n=4
size=4


.data

title:    .asciiz "Practica 4 de PC.\n"
newline:  .asciiz "\n"

m1:     .word 1, 2, 3, 4, 5
        .word 1, 2, 3, 4, 5 
        .word 1, 2, 3, 4, 5
        .word 1, 2, 3, 4, 5


.text
main:

li $v0, 4
la $a0, title
syscall

la $t0, m1
li $t1, m # counter = m;

fila1:

  addi $t1, -1 #counter--;
  
  #Print first element
  li $v0 1
  lw $a0, 0($t0)
  syscall

  addi $t0, size  #matrix[++index];
  bne $t1, 1, fila1 # while counter <= m

  li $t1, m
  li $t2, size
  mul $t3, $t2, $t1 
  li $t1, n

columna2:

  #li $v0, 4
  #la $a0, newline
  #syscall
  
  add $t0, $t0, $t3 
  addi $t1, -1

  li $v0 1
  lw $a0, 0($t0)
  syscall

  bne $t1, 1, columna2
  
  li $t1, m
 
fila2:

  #Print first element
  li $v0 1
  lw $a0, 0($t0)
  syscall

  sub $t0, size  #matrix[--index];
  addi $t1, -1 #counter--;

  bne $t1, 1, fila2 # while counter <= m
  
  li $t1, -1
  mul $t3, $t1, $t3 #$t2 = -1 * 20
  li $t1, n
 
columna1:

  #li $v0, 4
  #la $a0, newline
  #syscall
  
  add $t0, $t0, $t3 
  addi $t1, -1

  li $v0 1
  lw $a0, 0($t0)
  syscall

  bne $t1, 1, columna1


fin:
li  $v0,10
syscall

