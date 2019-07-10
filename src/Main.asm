.data
	#.space 1 == .byte
	#.space 2 == .half
	#.space 4 == .word
	frame1addr: .word 0x10040000 # lw 0(structaddr)
	frame2addr: .space 4         # lw 4(structaddr)
	cor: .word 0xffffff          # lw 8(structaddr)
	tam: .space 2                # lh 12(structaddr)
	pixelwidth: .byte 16         # lb 14(structaddr)
	pixelheight: .byte 16        # lb 15(structaddr)
	displaywidth: .half 512      # lh 16(structaddr)
	displayheight: .half 256     # lh 18(structaddr)
	realwidth: .space 2          # lh 20(structaddr)
	readheight: .space 2         # lh 22(structaddr)

.text
.globl main
main:
	jal f_menu
	la $a0, frame1addr
	jal f_initstruct
	jal f_randompopulate

loop:
	la $a0, frame1addr
		
	jal f_cpyframe1toframe2
	jal f_makenewframe
	
	# Se f_makenewframe fez um frame completamente morto
	# termina a execução
	#beq $a0, $zero, fim
	j loop

fim:
	# Terminar execução do programa
	li $v0, 10
	syscall
