# vim:ft=mips
# Practica 4 de PC
# David Martín Martín. alu0101053318@ull.edu.es


m=3
n=3
size=4

.data

title:       .asciiz "Practica 4 de PC.\n\n"
perimstr:    .asciiz "El valor del perimetro es: "
cuadrada:    .asciiz "La matriz es cuadrada\n"
nocuadrada:  .asciiz "La matriz no es cuadrada\n"
newline:     .asciiz "\n"
perim:       .word   0

m1:          .word   1, 2, 3
             .word   1, 2, 3
             .word   1, 2, 3
             .word   1, 2, 3, 4, 5


.text
main:

li $v0, 4
la $a0, title
syscall

li $t7, m
li $t6, n
bne $t7, $t6, noteq

li $v0, 4
la $a0, cuadrada
syscall
j programa

noteq:
li $v0, 4
la $a0, nocuadrada
syscall


programa:

lw $t4 ,perim
la $t0, m1
li $t1, m # counter = m;

fila1:

  addi $t1, -1 #counter--;
  
  li $v0 1
  lw $a0, 0($t0)
  syscall

  lw $t5, 0($t0)	
  add $t4, $t4, $t5

  addi $t0, size  #matrix[++index];
  bne $t1, 1, fila1 # while counter <= m

  li $t1, m
  li $t2, size
  mul $t3, $t2, $t1 
  li $t1, n

columna2:
  
  add $t0, $t0, $t3 
  addi $t1, -1

  lw $t5, 0($t0)	
  add $t4, $t4, $t5

  li $v0 1
  lw $a0, 0($t0)
  syscall

  bne $t1, 1, columna2
  
  li $t1, m
 
fila2:

  li $v0 1
  lw $a0, 0($t0)
  syscall

  lw $t5, 0($t0)	
  add $t4, $t4, $t5

  sub $t0, size  #matrix[--index];
  addi $t1, -1 #counter--;

  bne $t1, 1, fila2 # while counter <= m
  
  li $t1, n
 
columna1:

  sub $t0, $t0, $t3 
  addi $t1, -1

  li $v0 1
  lw $a0, 0($t0)
  syscall

  lw $t5, 0($t0)	
  add $t4, $t4, $t5

  bne $t1, 1, columna1

#Fin de la impresion del perimetro.

  li $v0, 4
  la $a0, newline
  syscall

  li $v0, 4
  la $a0, perimstr
  syscall

  sw $t4, perim

  li $v0, 1
  lw $a0, perim
  syscall


li  $v0,10
syscall
