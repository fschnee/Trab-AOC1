.globl f_makenewframe
f_makenewframe:
	lw $t0, 0($a0)	# frame1addr
	lw $t1, 4($a0)	# frame2addr
	lh $t2, 20($a0)	# realwidth
	lh $t3, 22($a0)	# realheight
	lw $s0, 8($a0)  # cor
	
	li $t4, 0
	li $t5, 0
	li $t6, 0
	li $t7, 0
	li $t8, 0
	li $t9, 0
	li $a0, 0
	# x = $t4
	# y = $t5
	# vizinhosvivos = $t6
	# a1 (x) de pegapixel = $t7
	# a2 (y) de pegapixel = $t8
	# retorno de pegapixel = $t9
	# resultado de pegapixel = $a0
	
teste1:	# if (x = 0 && y = 0) pegar(x+1, x+1 e y+1, y+1)
	bnez $t4, teste2
	bnez $t5, teste2
	# pegar(x+1)
	li $t7, 1
	li $t8, 0
	la $t9, return11
	j pegapixel
return11:add $a1, $a0, $t1
	lw $a1, 0($a1)
	seq $a1, $a1, $s0
	add $t6, $t6, $a1
	# pegar(x+1 e y+1)
	li $t7, 1
	li $t8, 1
	la $t9, return12
	j pegapixel
return12:add $a1, $a0, $t1
	lw $a1, 0($a1)
	seq $a1, $a1, $s0
	add $t6, $t6, $a1
	# pegar(y+1)
	li $t7, 0
	li $t8, 1
	la $t9, return13
	j pegapixel
return13:add $a1, $a0, $t1
	lw $a1, 0($a1)
	seq $a1, $a1, $s0
	add $t6, $t6, $a1
	# pegar proprio pixel
	move $t7, $t4
	move $t8, $t5
	la $t9, return14
	j pegapixel
return14:add $a1, $a0, $t1
	add $a2, $a0, $t0
	lw $a1, 0($a1)
	beqz $a1, dead1
alive1:	beq $t6, 2, setA1
	beq $t6, 3, setA1
	j setD1
dead1:	beq $t6, 3, setA1
setD1:	sw $zero, 0($a2)
	j passoloop
setA1:	sw $s0, 0($a2)
	j passoloop
	

teste2:	# if (x = width && y = 0) pegar(x-1(y+1, y=0), y+1);skip = true
	bne $t4, $t2, teste3
	bnez $t5, teste3
	li $t6, 0
	# pegar(x-1 e y=0)
	addi $t7, $t4, -1
	li $t8, 0
	la $t9, return21
	j pegapixel
return21:add $a1, $a0, $t1
	lw $a1, 0($a1)
	seq $a1, $a1, $s0
	add $t6, $t6, $a1
	# pegar(x-1 e y+1)
	addi $t7, $t4, -1
	li $t8, 1
	la $t9, return22
	j pegapixel
return22:add $a1, $a0, $t1
	lw $a1, 0($a1)
	seq $a1, $a1, $s0
	add $t6, $t6, $a1
	# pegar(y+1)
	move $t7, $t4
	li $t8, 1
	la $t9, return23
	j pegapixel
return23:add $a1, $a0, $t1
	lw $a1, 0($a1)
	seq $a1, $a1, $s0
	add $t6, $t6, $a1
	# pegar proprio pixel
	move $t7, $t4
	move $t8, $t5
	la $t9, return24
	j pegapixel
return24:add $a1, $a0, $t1
	add $a2, $a0, $t0
	lw $a1, 0($a1)
	beqz $a1, dead2
alive2:	beq $t6, 2, setA2
	beq $t6, 3, setA2
	j setD1
dead2:	beq $t6, 3, setA2
setD2:	sw $zero, 0($a2)
	j passoloop
setA2:	sw $s0, 0($a2)
	j passoloop

teste3:	# if (x = 0 && y = height) pegarDiagonalCimaDireita;skip = true
	bnez $t4, teste4
	bne $t5, $t3, teste4
	# pegarpixel
	li $t7, 0
	addi $t8, $t5, -1
	la $t9, return31
	j pegapixel
return31:add $a1, $a0, $t1
	lw $a1, 0($a1)
	seq $a1, $a1, $s0
	add $t6, $t6, $a1
	# pegarpixel
	li $t7, 1
	addi $t8, $t5, -1
	la $t9, return32
	j pegapixel
return32:add $a1, $a0, $t1
	lw $a1, 0($a1)
	seq $a1, $a1, $s0
	add $t6, $t6, $a1
	# pegarpixel
	li $t7, 1
	move $t8, $t5
	la $t9, return33
	j pegapixel
return33:add $a1, $a0, $t1
	lw $a1, 0($a1)
	seq $a1, $a1, $s0
	add $t6, $t6, $a1
	# pegar proprio pixel
	move $t7, $t4
	move $t8, $t5
	la $t9, return34
	j pegapixel
return34:add $a1, $a0, $t1
	add $a2, $a0, $t0
	lw $a1, 0($a1)
	beqz $a1, dead3
alive3:	beq $t6, 2, setA3
	beq $t6, 3, setA3
	j setD3
dead3:	beq $t6, 3, setA3
setD3:	sw $zero, 0($a2)
	j passoloop
setA3:	sw $s0, 0($a2)
	j passoloop

teste4:	# if (x = width && y = height) pegarDiagonalCimaEsquerda;skip = true
	bne $t4, $t2, teste5
	bne $t5, $t3, teste5
	# pegarpixel
	addi $t7, $t4, -1
	move $t8, $t5
	la $t9, return41
	j pegapixel
return41:add $a1, $a0, $t1
	lw $a1, 0($a1)
	seq $a1, $a1, $s0
	add $t6, $t6, $a1
	# pegarpixel
	addi $t7, $t4, -1
	addi $t8, $t5, -1
	la $t9, return42
	j pegapixel
return42:add $a1, $a0, $t1
	lw $a1, 0($a1)
	seq $a1, $a1, $s0
	add $t6, $t6, $a1
	# pegarpixel
	addi $t7, $t4, -1
	move $t8, $t5
	la $t9, return43
	j pegapixel
return43:add $a1, $a0, $t1
	lw $a1, 0($a1)
	seq $a1, $a1, $s0
	add $t6, $t6, $a1
	# pegar proprio pixel
	move $t7, $t4
	move $t8, $t5
	la $t9, return44
	j pegapixel
return44:add $a1, $a0, $t1
	add $a2, $a0, $t0
	lw $a1, 0($a1)
	beqz $a1, dead4
alive4:	beq $t6, 2, setA4
	beq $t6, 3, setA4
	j setD4
dead4:	beq $t6, 3, setA4
setD4:	sw $zero, 0($a2)
	j passoloop
setA4:	sw $s0, 0($a2)
	j passoloop

teste5:	# if (paredeTopo) pegar(x-1, x+1, y+1(x,x-1,x+1));
	bnez $t5, teste6 
	# pegarpixel
	addi $t7, $t4, -1
	move $t8, $t5
	la $t9, return51
	j pegapixel
return51:add $a1, $a0, $t1
	lw $a1, 0($a1)
	seq $a1, $a1, $s0
	add $t6, $t6, $a1
	# pegarpixel
	addi $t7, $t4, 1
	move $t8, $t5
	la $t9, return52
	j pegapixel
return52:add $a1, $a0, $t1
	lw $a1, 0($a1)
	seq $a1, $a1, $s0
	add $t6, $t6, $a1
	# pegarpixel
	move $t7, $t4
	addi $t8, $t5, 1
	la $t9, return53
	j pegapixel
return53:add $a1, $a0, $t1
	lw $a1, 0($a1)
	seq $a1, $a1, $s0
	add $t6, $t6, $a1
	# pegarpixel
	addi $t7, $t4, -1
	addi $t8, $t5, 1
	la $t9, return54
	j pegapixel
return54:add $a1, $a0, $t1
	lw $a1, 0($a1)
	seq $a1, $a1, $s0
	add $t6, $t6, $a1
	# pegarpixel
	addi $t7, $t4, 1
	addi $t8, $t5, 1
	la $t9, return55
	j pegapixel
return55:add $a1, $a0, $t1
	lw $a1, 0($a1)
	seq $a1, $a1, $s0
	add $t6, $t6, $a1
	# pegar proprio pixel
	move $t7, $t4
	move $t8, $t5
	la $t9, return56
	j pegapixel
return56:add $a1, $a0, $t1
	add $a2, $a0, $t0
	lw $a1, 0($a1)
	beqz $a1, dead5
alive5:	beq $t6, 2, setA5
	beq $t6, 3, setA5
	j setD5
dead5:	beq $t6, 3, setA5
setD5:	sw $zero, 0($a2)
	j passoloop
setA5:	sw $s0, 0($a2)
	j passoloop

teste6:	# if (paredeEsquerda) pegar(y+1, x+1 y+1, x+1 y, x+1 y-1, y-1);
	bnez $t4, teste7
	# pegarpixel
	move $t7, $t4
	addi $t8, $t5, 1
	la $t9, return61
	j pegapixel
return61:add $a1, $a0, $t1
	lw $a1, 0($a1)
	seq $a1, $a1, $s0
	add $t6, $t6, $a1
	# pegarpixel
	addi $t7, $t4, 1
	addi $t8, $t5, 1
	la $t9, return62
	j pegapixel
return62:add $a1, $a0, $t1
	lw $a1, 0($a1)
	seq $a1, $a1, $s0
	add $t6, $t6, $a1
	# pegarpixel
	addi $t7, $t4, 1
	move $t8, $t5
	la $t9, return63
	j pegapixel
return63:add $a1, $a0, $t1
	lw $a1, 0($a1)
	seq $a1, $a1, $s0
	add $t6, $t6, $a1
	# pegarpixel
	addi $t7, $t4, 1
	addi $t8, $t5, -1
	la $t9, return64
	j pegapixel
return64:add $a1, $a0, $t1
	lw $a1, 0($a1)
	seq $a1, $a1, $s0
	add $t6, $t6, $a1
	# pegarpixel
	move $t7, $t4
	addi $t8, $t5, -1
	la $t9, return65
	j pegapixel
return65:add $a1, $a0, $t1
	lw $a1, 0($a1)
	seq $a1, $a1, $s0
	add $t6, $t6, $a1
	# pegar proprio pixel
	move $t7, $t4
	move $t8, $t5
	la $t9, return66
	j pegapixel
return66:add $a1, $a0, $t1
	add $a2, $a0, $t0
	lw $a1, 0($a1)
	beqz $a1, dead6
alive6:	beq $t6, 2, setA6
	beq $t6, 3, setA6
	j setD6
dead6:	beq $t6, 3, setA6
setD6:	sw $zero, 0($a2)
	j passoloop
setA6:	sw $s0, 0($a2)
	j passoloop

teste7:	# if (paredeDireita) pegar(y+1, y+1 x-1, x-1, y-1, y-1 x-1);
	bnez $t4, teste8
	# pegarpixel
	move $t7, $t4
	addi $t8, $t5, 1
	la $t9, return71
	j pegapixel
return71:add $a1, $a0, $t1
	lw $a1, 0($a1)
	seq $a1, $a1, $s0
	add $t6, $t6, $a1
	# pegarpixel
	addi $t7, $t4, -1
	addi $t8, $t5, 1
	la $t9, return72
	j pegapixel
return72:add $a1, $a0, $t1
	lw $a1, 0($a1)
	seq $a1, $a1, $s0
	add $t6, $t6, $a1
	# pegarpixel
	addi $t7, $t4, -1
	move $t8, $t5
	la $t9, return73
	j pegapixel
return73:add $a1, $a0, $t1
	lw $a1, 0($a1)
	seq $a1, $a1, $s0
	add $t6, $t6, $a1
	# pegarpixel
	move $t7, $t4
	addi $t8, $t5, -1
	la $t9, return74
	j pegapixel
return74:add $a1, $a0, $t1
	lw $a1, 0($a1)
	seq $a1, $a1, $s0
	add $t6, $t6, $a1
	# pegarpixel
	addi $t7, $t4, -1
	addi $t8, $t5, -1
	la $t9, return75
	j pegapixel
return75:add $a1, $a0, $t1
	lw $a1, 0($a1)
	seq $a1, $a1, $s0
	add $t6, $t6, $a1
	# pegar proprio pixel
	move $t7, $t4
	move $t8, $t5
	la $t9, return76
	j pegapixel
return76:add $a1, $a0, $t1
	add $a2, $a0, $t0
	lw $a1, 0($a1)
	beqz $a1, dead7
alive7:	beq $t6, 2, setA7
	beq $t6, 3, setA7
	j setD7
dead7:	beq $t6, 3, setA7
setD7:	sw $zero, 0($a2)
	j passoloop
setA7:	sw $s0, 0($a2)
	j passoloop

teste8:	# if (paredeBaixo) pegar(y-1 x-1, y-1 x, y-1 x+1, x-1 y, x+1 y);
	bnez $t4, teste9
	# pegarpixel
	addi $t7, $t4, -1
	addi $t8, $t5, -1
	la $t9, return81
	j pegapixel
return81:add $a1, $a0, $t1
	lw $a1, 0($a1)
	seq $a1, $a1, $s0
	add $t6, $t6, $a1
	# pegarpixel
	move $t7, $t4
	addi $t8, $t5, -1
	la $t9, return82
	j pegapixel
return82:add $a1, $a0, $t1
	lw $a1, 0($a1)
	seq $a1, $a1, $s0
	add $t6, $t6, $a1
	# pegarpixel
	addi $t7, $t4, 1
	addi $t8, $t5, -1
	la $t9, return83
	j pegapixel
return83:add $a1, $a0, $t1
	lw $a1, 0($a1)
	seq $a1, $a1, $s0
	add $t6, $t6, $a1
	# pegarpixel
	move $t7, $t4
	addi $t8, $t5, -1
	la $t9, return84
	j pegapixel
return84:add $a1, $a0, $t1
	lw $a1, 0($a1)
	seq $a1, $a1, $s0
	add $t6, $t6, $a1
	# pegarpixel
	addi $t7, $t4, 1
	move $t8, $t5
	la $t9, return85
	j pegapixel
return85:add $a1, $a0, $t1
	lw $a1, 0($a1)
	seq $a1, $a1, $s0
	add $t6, $t6, $a1
	# pegar proprio pixel
	move $t7, $t4
	move $t8, $t5
	la $t9, return86
	j pegapixel
return86:add $a1, $a0, $t1
	add $a2, $a0, $t0
	lw $a1, 0($a1)
	beqz $a1, dead8
alive8:	beq $t6, 2, setA8
	beq $t6, 3, setA8
	j setD8
dead8:	beq $t6, 3, setA8
setD8:	sw $zero, 0($a2)
	j passoloop
setA8:	sw $s0, 0($a2)
	j passoloop

teste9:	# pegarTodaVolta(x-1 y-1, x-1 y, x-1 y+1, x y-1, x y+1, x+1 y-1, x+1 y, x+1 y+1)
	# pegarpixel
	addi $t7, $t4, -1
	addi $t8, $t5, -1
	la $t9, return91
	j pegapixel
return91:add $a1, $a0, $t1
	lw $a1, 0($a1)
	seq $a1, $a1, $s0
	add $t6, $t6, $a1
	# pegarpixel
	addi $t7, $t4, -1
	move $t8, $t5
	la $t9, return92
	j pegapixel
return92:add $a1, $a0, $t1
	lw $a1, 0($a1)
	seq $a1, $a1, $s0
	add $t6, $t6, $a1
	# pegarpixel
	addi $t7, $t4, -1
	addi $t8, $t5, 1
	la $t9, return93
	j pegapixel
return93:add $a1, $a0, $t1
	lw $a1, 0($a1)
	seq $a1, $a1, $s0
	add $t6, $t6, $a1
	# pegarpixel
	move $t7, $t4
	addi $t8, $t5, -1
	la $t9, return94
	j pegapixel
return94:add $a1, $a0, $t1
	lw $a1, 0($a1)
	seq $a1, $a1, $s0
	add $t6, $t6, $a1
	# pegarpixel
	move $t7, $t4
	addi $t8, $t5, 1
	la $t9, return95
	j pegapixel
return95:add $a1, $a0, $t1
	lw $a1, 0($a1)
	seq $a1, $a1, $s0
	add $t6, $t6, $a1
	# pegarpixel
	addi $t7, $t4, 1
	addi $t8, $t5, -1
	la $t9, return96
	j pegapixel
return96:add $a1, $a0, $t1
	lw $a1, 0($a1)
	seq $a1, $a1, $s0
	add $t6, $t6, $a1
	# pegarpixel
	addi $t7, $t4, 1
	move $t8, $t5
	la $t9, return97
	j pegapixel
return97:add $a1, $a0, $t1
	lw $a1, 0($a1)
	seq $a1, $a1, $s0
	add $t6, $t6, $a1
	# pegarpixel
	addi $t7, $t4, 1
	addi $t8, $t5, 1
	la $t9, return98
	j pegapixel
return98:add $a1, $a0, $t1
	lw $a1, 0($a1)
	seq $a1, $a1, $s0
	add $t6, $t6, $a1
	# pegar proprio pixel
	move $t7, $t4
	move $t8, $t5
	la $t9, return99
	j pegapixel
return99:add $a1, $a0, $t1
	add $a2, $a0, $t0
	lw $a1, 0($a1)
	beqz $a1, dead9
alive9:	beq $t6, 2, setA9
	beq $t6, 3, setA9
	j setD9
dead9:	beq $t6, 3, setA9
setD9:	sw $zero, 0($a2)
	j passoloop
setA9:	sw $s0, 0($a2)
	j passoloop

passoloop:
	addi $t4, $t4, 1
	li $t6, 0
	beq $t4, $t2, adicionaY
	j teste1
adicionaY:
	li $t4, 0
	addi $t5, $t5, 1
	bne $t5, $t3 teste1
fim:	jr $ra
	
pegapixel:
	mult $t8, $t2
	mflo $a0
	sll $a0, $a0, 2
	sll $t7, $t7, 2
	add  $a0, $t7, $a0
	jr $t9
