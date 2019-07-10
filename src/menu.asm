.data
string: .asciiz "Menu jogo da vida:\n1.Jogar\n2.Regras do jogo\n3.Sair\n"
string1: .asciiz "Regras do jogo:\n1.Qualquer célula viva com menos de dois vizinhos vivos morre de solidão.\n2.Qualquer célula viva com mais de três vizinhos vivos morre de superpopulação.\n3.Qualquer célula morta com exatamente três vizinhos vivos se torna uma célula viva.\n4.Qualquer célula viva com dois ou três vizinhos vivos continua no mesmo estado para a próxima geração"	
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
	# Terminar execução do programa
	li $v0, 10
	syscall
	
	
