.text:
.globl f_randompopulate
f_randompopulate:
	# Carrega a "struct"
	lw $t0, 8($a0) # cor
	lw $t1, 0($a0) # frame1addr
	lw $t2, 4($a0) # frame2addr (fim do loop)
	lh $t3, 12($a0) # quantidade de pixels
	li $t4, 0 # contador
	
	# Coisas para gerar numero aleatorio
	li $a1, 2
	li $v0, 42

loop:
	# se (endereçoatual == endereçodoframe2) acabe o loop
	beq $t4, $t3, end
	
	# gera um numero inteiro aleatorio no intervalo
	# [0, $(a1) ), ou seja [0, 1] nesse caso
	syscall
	
	# se o numero é 1 pinta o pixel, senão pula pro label continua
	beq $a0, $zero, continua
	sw $t0, 0($t1)
continua:
	addi $t1, $t1, 4
	addi $t4, $t4, 1
	j loop
	
end:
	jr $ra
