.text:
.globl f_randompopulate
f_randompopulate:
	# Carrega a "struct"
	lw $t0, 8($a0) # cor
	lw $t1, 0($a0) # frame1addr
	lw $t2, 4($a0) # frame2addr (fim do loop)
	lb $t3, 20($a0) # width
	lb $t4, 22($a0) # height

loop:
	# se (endereçoatual == endereçodoframe2) acabe o loop
	beq $t1, $t2, end
	
	# gera um numero inteiro aleatorio no intervalo
	# [0, $(a1) ), ou seja [0, 1] nesse caso
	li $a1, 2
	li $v0, 42
	syscall
	
	# se o numero é 1 pinta o pixel, senão pula pro label continua
	beq $a0, $zero, continua
	sw $t0, 0($t1)
continua:
	addi $t1, $t1, 4
	j loop
	
end:
	jr $ra
