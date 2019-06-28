.data
	#.space 1 == .byte
	#.space 2 == .half
	#.space 4 == .word
	frame1addr: .word 0x10040000 # 0(struct)
	frame2addr: .space 4	     # 4(struct)
	cor: .word 0xffffff          # 8(struct)
	tam: .space 2		     # 12(struct)
	pixelwidth: .byte 8          # 14(struct)
	pixelheight: .byte 8         # 15(struct)
	displaywidth: .half 512      # 16(struct)
	displayheight: .half 256     # 18(struct)
	realwidth: .space 2          # 20(struct)
	readheight: .space 2         # 22(struct)

.text
.globl main
main:
	la $a0, frame1addr
	jal f_initstruct
	jal f_randompopulate
	
	
