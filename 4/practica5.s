# vim:ft=mips

#Practica 5 de PC: Calculo de un numero exponencial.
#Por: Jesus Navarro; David Martin.

m = 2
n = 4


#Apartado de datos del programa.
.data

  titlestr:      .asciiz "Este programa calcula el valor de un numero exponencial"
  numstr:        .asciiz "Introduzca el numero: "
  expstr:        .asciiz "Introduzca el exponente: "


#Apartado de codigo.
.text
 main:


  li $a0, m
  li $a1, n
  li $s0, m

  jal recursiva
  
return:
#impresion del resultado
  li $v0, 1
  syscall
  
#salida del programa
  li $v0, 10
  syscall


recursiva:
  addi $sp, $sp, -12
  sw $ra, 8($sp)
  sw $a1, 4($sp)
  sw $a0, 0($sp)

  ble $a1, 1, return
  addi $a1, $a1, -1
  mul $a0, $a0, $s0

  jal recursiva


	
  
  
