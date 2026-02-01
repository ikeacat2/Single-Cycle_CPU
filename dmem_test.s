.text

main:
	addi $k0, $zero, 0
	addi $k1, $k1, 256

init:
	addi $v0, $zero, 1
	sw $v0, 0($k0)
	addi $v1, $v0, 1
	sw $v1, 4($k0)
	addi $a0, $v1, 1
	sw $a0, 8($k0)
	addi $a1, $a0, 1
	sw $a1, 12($k0)
	addi $a2, $a1, 1
	sw $a2, 16($k0)
	addi $a3, $a2, 1
	sw $a3, 20($k0)
	addi $t0, $a3, 1
	sw $t0, 24($k0)
	addi $t1, $t0, 1
	sw $t1, 28($k0)

forward:
	addi $t2, $t1, 1
	sw $t2, 32($k0)
	addi $t3, $t2, 1
	sw $t3, 36($k0)
	addi $t4, $t3, 1
	sw $t4, 40($k0)
	addi $t5, $t4, 1
	sw $t5, 44($k0)
	addi $t6, $t5, 1
	sw $t6, 48($k0)
	addi $t7, $t6, 1
	sw $t7, 52($k0)
	addi $s0, $t7, 1
	sw $s0, 56($k0)

backward:
	addi $s1, $s0, 1
	sw $s1, -196($k1)
	addi $s2, $s1, 1
	sw $s2, -192($k1)
	addi $s3, $s2, 1
	sw $s3, -188($k1)
	addi $s4, $s3, 1
	sw $s4, -184($k1)
	addi $s5, $s4, 1
	sw $s5, -180($k1)
	addi $s6, $s5, 1
	sw $s6, -176($k1)
	addi $s7, $s6, 1
	sw $s7, -172($k1)
	addi $t8, $s7, 1
	sw $t8, -168($k1)
	addi $t9, $t8, 1
	sw $t9, -164($k1)

readback:
	lw $t9, 0($k0)
	lw $t8, 4($k0)
	lw $s7, 8($k0)
	lw $s6, 12($k0)
	lw $s5, 16($k0)
	lw $s4, 20($k0)
	lw $s3, 24($k0)
	lw $s2, 28($k0)
	lw $s1, 32($k0)
	lw $s0, 36($k0)
	lw $t7, 40($k0)
	lw $t6, 44($k0)
	lw $t5, 48($k0)
	lw $t4, 52($k0)
	lw $t3, 56($k0)
	lw $t2, -196($k1)
	lw $t1, -192($k1)
	lw $t0, -188($k1)
	lw $a3, -184($k1)
	lw $a2, -180($k1)
	lw $a1, -176($k1)
	lw $a0, -172($k1)
	lw $v1, -168($k1)
	lw $v0, -164($k1)

exit:
	beq $zero, $zero, exit

# ANSWER
# $zero = 0
# $at = ??
# $v0 = 24
# $v1 = 23
# $a0 = 22
# $a1 = 21
# $a2 = 20
# $a3 = 19
# $t0 = 18
# $t1 = 17
# $t2 = 16
# $t3 = 15
# $t4 = 14
# $t5 = 13
# $t6 = 12
# $t7 = 11
# $s0 = 10
# $s1 = 9
# $s2 = 8
# $s3 = 7
# $s4 = 6
# $s5 = 5
# $s6 = 4
# $s7 = 3
# $t8 = 2
# $t9 = 1
# $k0 = ??
# $k1 = ??
# $gp = ??
# $sp = ??
# $fp = ??
# $ra = ??
# mem[0] = 1
# mem[4] = 2
# mem[8] = 3
# mem[12] = 4
# mem[16] = 5
# mem[20] = 6
# mem[24] = 7
# mem[28] = 8
# mem[32] = 9
# mem[36] = 10
# mem[40] = 11
# mem[44] = 12
# mem[48] = 13
# mem[52] = 14
# mem[56] = 15
# mem[60] = 16
# mem[64] = 17
# mem[68] = 18
# mem[72] = 19
# mem[76] = 20
# mem[80] = 21
# mem[84] = 22
# mem[88] = 23
# mem[92] = 24
