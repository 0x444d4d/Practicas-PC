# vim:ft=mips

#Practica 6.
#David Martin Martin / alu0101053318@ull.edu.es


#Las etiquetas escritas en mayuscula determinan funciones
#$t8 = tebla de saltos; $s0 = opcion del switch;

.data
  menustr0:   .asciiz     "\t\tMenu\n"
  menustr1:   .asciiz     "1.- Cargar datos.\n"
  menustr2:   .asciiz     "2.- Calcular mcm.\n"
  menustr3:   .asciiz     "0.- Terminar programa.\n"
  jumptable:  .word       L0, L1, L2, L3
  


.text
main:
la $t8, jumptable

main2:
jal PRINTMENU

#Pedimos al usuario un entero que nos servira para elegir la funcion.
li $v0, 5
syscall
move $s0, $v0

#Operamos con el entero recibido y la tabla de saltos para realizar el salto
#a la funcion seleccionada.
sll $s0, $s0, 2
add $s0, $s0, $t8
lw $s0, 0($s0)
jr $s0

L1: #case 1:
#Saltamos a la funcion LOADDATA que nos devolvera
#los datos introducidos por el usuario en $a0 y $a1.
jal LOADDATA 
j main2

L2: #case 2:
j main2

L3: #case 3:
j main2

L0: #case 0:

#Salida del programa
  li $v0, 10
  syscall



PRINTMENU:
  li $v0, 4
  la $a0, menustr0
  syscall

  li $v0, 4
  la $a0, menustr1
  syscall

  li $v0, 4
  la $a0, menustr2
  syscall

  li $v0, 4
  la $a0, menustr3
  syscall

  jr $ra


LOADDATA:

  li $v0, 1
  li $v0, 1
  jr $ra
