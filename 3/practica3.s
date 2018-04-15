# vim:ft=mips


  .data
cadpres:    .asciiz "Introduzca una precision"
cadfin:     .asciiz "Numero e calculado:"

incremento: .word   1
 
  #f0, presicion indicada por el usuario.
  #f2, contador para el factorial, va incrementando de 1 en 1.
  #f4, valor del ultimo factorial. 
  #f6, variable que contrendra el resultado de 1/$f4.
  #f14, variable que contendra el valor de e.

  .text

main: 

  #Primero pedimos al usuario una presicion
  #para ello mostramos una cadena por pantalla.
  li $v0, 4
  la $a0, cadpres
  syscall

  #Y dejamos que el usuario intruduzca un valor
  #que quedara guardado en $f0.
  li $v0, 6 
  syscall 

  #Inicializamos $f2, el contador, a 0.
  lwc1 $f2, 0

  #y hacemos lo mismo con $f14, "e", y $f4, pero a 1;
  lwc1 $f14, 1
  lwc1 $f4, 1
  lwc1 $f8, 1

do:
  
  #Incrementamos el contador en 1;
  add.s $f2, $f2, $f8 

  #Multiplicamos contador por el factorial;
  mul.s $f4, $f2, $f4
 
  #Dividimos 1/$f4 y lo guardamos en $f6.
  div.s $f6, $f8, $f4

  #sumamos a $f14 el resultado de la anterior division.
  add.s $f14, $f14, $f6

  #Comprobamos que $f6 sea mayor que el error
  #y si se cumple saltamos a la etiqueta do:.
  c.lt.s $f0, $f6
  bc1t do

  #Por ultimo imprimimos el resultado.
  li $v0, 4
  la $a0, cadfin 
  syscall

  li $v0, 2
  mov.s $f12, $f14
  syscall
