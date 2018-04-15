# vim:ft=mips


# PRACTICA 4. PRINCIPIO DE COMPUTADORES.
# programa que imprime el perimetro de la mariz
# La matriz tiene dimension mxn

m = 4		# numero de filas de m1
n = 5		# numero de columnas de  m1
size = 4	# tamano de cada elemento


  # HAY QUE PONER UN ESPACIO DETRAS DE CADA COMA EN LA DEF DE VECTORES Y MATRICES
  .data

m1:			.word	1, 2, 3, 4, 5
	   		.word	1, 2, 3, 4, 5
        .word	1, 2, 3, 4, 5
        .word	1, 2, 3, 2, 5
            


# INTRODUCIR COMENTADO EL ALGORITMO PROPUESTO EN LENGUAJE DE ALTO NIVEL



main:
      #cargamos el vector a imprimir en $t0, que usaremos como puntero
      #y s0 que usaremos como back-up.
      lw $t0, m1
      lw $s0, m1

      #Calculamos en numero de elementos que mostraremos y los guardamos.
      add 
bucle:
      
      #Guardamos el valor actual en el puntero de pila.
      addi $sp, $sp, -size
      sw $t1, size($sp)

      #Incrementamos el puntero de la matriz.
      add $t0, $t0, 4 

      #Repetimos los pasos anteriores hasta que llegemos a n
      blt $t2, n




	    # salida del sistema
        li	$v0,10
        syscall
			
