.text

main:

zerotov:
	lui $zero, 0xFF
	addi $v0, $zero, 1
	lui $v0, 0
	addi $v0, $v0, 1
	slt $v1, $zero, $v0
	add $v1, $v0, $v1

aandlowt:
	add $a0, $v0, $v1
	add $a0, $a0, $zero
	addi $a1, $zero, 5
	and $a1, $a0, $a1
	addi $a1, $a1, 4
	addi $a1, $a1, -1
	addi $a2, $a0, 2
	and $a2, $a2, $a2
	ori $a3, $v1, 4
	add $t0, $v1, $a2
	addi $t1, $a3, 2
	add $t2, $t1, $v0
	addi $t3, $t2, 1
	ori $t4, $t3, 0
	addi $t4, $t4, 1
	add $t5, $t4, $v0
	addi $t6, $t5, 1
	slt $t7, $zero, $t6
	add $t7, $t6, $t7

stohight:
	addi $s0, $t7, 3
	ori $s0, $s0, 1
	addi $s0, $s0, -2
	slt $s1, $s0, $t7
	add $s1, $s0, $s1
	addi $s1, $s1, 1
	ori $s2, $s1, 0
	addi $s2, $s2, 1
	add $s3, $s2, $v0
	and $s3, $s3, $s3
	ori $s4, $s3, 0
	addi $s4, $s4, 1
	add $s5, $s4, $v0
	slt $s6, $s5, $s4
	add $s6, $s5, $s6
	addi $s6, $s6, 1
	ori $s7, $s6, 0
	addi $s7, $s7, 1
	add $t8, $s7, $v0
	and $t8, $t8, $t8
	ori $t9, $t8, 0
	addi $t9, $t9, 1

exit:
	beq $zero, $zero, exit

# ANSWER
# $zero = 0
# $at = ??
# $v0 = 1
# $v1 = 2
# $a0 = 3
# $a1 = 4
# $a2 = 5
# $a3 = 6
# $t0 = 7
# $t1 = 8
# $t2 = 9
# $t3 = 10
# $t4 = 11
# $t5 = 12
# $t6 = 13
# $t7 = 14
# $s0 = 15
# $s1 = 16
# $s2 = 17
# $s3 = 18
# $s4 = 19
# $s5 = 20
# $s6 = 21
# $s7 = 22
# $t8 = 23
# $t9 = 24
# $k0 = ??
# $k1 = ??
# $gp = ??
# $sp = ??
# $fp = ??
# $ra = ??
