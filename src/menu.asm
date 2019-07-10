.data
string: .asciiz "Menu jogo da vida:\n1.Jogar\n2.Regras do jogo\n3.Sair\n"
string1: .asciiz "Regras do jogo:\n1.Qualquer c�lula viva com menos de dois vizinhos vivos morre de solid�o.\n2.Qualquer c�lula viva com mais de tr�s vizinhos vivos morre de superpopula��o.\n3.Qualquer c�lula morta com exatamente tr�s vizinhos vivos se torna uma c�lula viva.\n4.Qualquer c�lula viva com dois ou tr�s vizinhos vivos continua no mesmo estado para a pr�xima gera��o"	
.text
.globl f_menu

f_menu:
	ori, $t1, $zero, 1   #menu jogar
	ori $t2, $zero, 2   #menu regras
	ori $t3, $zero, 3   #menu sair

	li $v0, 4
	la $a0, string
	syscall
	li $v0, 5
	syscall
	or $t0, $v0, $zero
	beq $t0, $t1, jogar
	
	beq $t0, $t2, detail
	
	beq $t0, $t3, sair
	
	j f_menu
	
	
	detail: 
	li $v0, 4
	la $a0, string1
	syscall
	j f_menu
	jogar:
	
	jr $ra
	
	sair:
	# Terminar execu��o do programa
	li $v0, 10
	syscall
	
	
