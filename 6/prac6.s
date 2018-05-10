# vim:ft=mips

#Practica 6.
#David Martin Martin / alu0101053318@ull.edu.es


#Las etiquetas escritas en mayuscula determinan funciones
#$t8 = tebla de saltos; $s0 = opcion del switch; $a1 y $a2 = valores introducidos por el usuario; $t0 = registro de cambio

.data
  menustr0:   .asciiz     "\t\tMenu\n"
  menustr1:   .asciiz     "1.- Cargar datos.\n"
  menustr2:   .asciiz     "2.- Calcular MCD.\n"
  menustr3:   .asciiz     "0.- Terminar programa.\n"
  chkstr0:    .asciiz     "La opcion introducida no es valida, pruebe otro numero.\n"
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

#Comprobamos que dicho entero se ajusta a las opciones del menu.
jal CHECKOPT

#Operamos con el entero recibido y la tabla de saltos para realizar el salto
#a la funcion seleccionada.
sll $s0, $s0, 2
add $s0, $s0, $t8
lw $s0, 0($s0)
jr $s0

L1: #case 1:
#Saltamos a la funcion LOADDATA que nos devolvera
#los datos introducidos por el usuario en $a1 y $a2.
jal LOADDATA 
j main2

L2: #case 2:
addi $sp, -16
jal EUCLIDES
addi $sp, 16
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


CHECKOPT:

  blt $s0, 0, notvalid 
  bgt $s0, 3, notvalid

  jr $ra
 
  notvalid:
  li $v0, 4
  la $a0, chkstr0
  syscall
  
  j main2


LOADDATA:

  li $v0, 1
  syscall
  move $a1, $v0

  li $v0, 1
  syscall
  move $a2, $v0

  jr $ra


EUCLIDES:
 
  bne $a2, $zero, mcd
  add $v0, $a1, $zero
  jr $ra

  mcd:
    addi $sp, -24
    sw $ra, 0($sp)
    sw $a1, 8($sp)
    sw $a2, 16($sp)
  
    move $t0, $a1
    div $a1, $a2
    move $a1, $a2
    mfhi $a2

    jal EUCLIDES
 
 
 jr $ra
