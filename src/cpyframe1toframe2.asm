.globl f_cpyframe1toframe2
f_cpyframe1toframe2:
	# tem tres loops porque dai a animação de apagar
	# parece mais rapida, o primeiro apaga o que tinha
	# no frame 2 o segundo loop só copia pro
	# frame 2 e o terceiro só apaga do frame 1
	li $t6, 0	# contador
	lw $t7, 4($a0)	# frame2addr pro loop1
	lw $t0, 0($a0)	# frame1addr pro loop2
	lw $t1, 4($a0)	# frame2addr pro loop3
	lh $t2, 12($a0)	# tamanho
	li $t3, 0	# contador2
	li $t4, 0	# contador3
	lw $t5, 0($a0)	# frame1addr pro loop3
	
loop1:
	beq $t6, $t2, loop2
	
	sw $zero, 0($t7)
	addi $t7, $t7, 4
	addi $t6, $t6, 1
	j loop1

loop2:
	beq $t3, $t2, loop3
	
	# Carrega um pixel na memoria,
	# escreve ele no frame2 e adiciona o ponteiro dos frames
	lw $t9, 0($t0)
	sw $t9, 0($t1)
	addi $t0, $t0, 4
	addi $t1, $t1, 4
	addi $t3, $t3, 1
	j loop2

loop3:
	beq $t4, $t2, end
	
	sw $zero, 0($t5)
	addi $t5, $t5, 4
	addi $t4, $t4, 1
	j loop3

end:
	jr $ra