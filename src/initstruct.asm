.globl f_initstruct
f_initstruct:
	# Carrega a "struct"
	lw $t1, 0($a0) # displayaddr
	lb $t2, 14($a0) # unitwidth
	lb $t3, 15($a0) # unitheight
	lh $t4, 16($a0) # displaywidth
	lh $t5, 18($a0) # displayheight
	sw $t1, 4($a0)	# inverte o endereço dos frames na memoria

	# Pega o tamanho real do grid
	div $t4, $t2
	mflo $t6
	div $t5, $t3
	mflo $t7
	mult $t6, $t7
	mflo $t8
	
	sh $t6, 20($a0) # Guarda o width real
	sh $t7, 22($a0) # Guarda o height real
	sh $t8, 12($a0) # Guard o tamanho do frame (width * height)
	
	# Calcula o endereço do segundo frame
	li $t6, 4 # Tamanho de um word, em bytes
	mult $t8, $t6
	mflo $t7
	add $t9, $t1, $t7
	sw $t9, 0($a0) # Guarda o endereço do segundo frame
	
	jr $ra
