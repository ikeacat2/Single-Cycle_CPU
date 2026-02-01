.text

main:

zeroth:
	addi $v0, $zero, 1
	beq $v0, $zero, incorrect
	addi $v1, $v0, 1
	beq $v0, $v0, first
	beq $zero, $zero, incorrect

first:
	addi $a0, $v1, 1
	addi $a1, $a0, 1
	beq $a0, $a1, incorrect
	addi $a2, $a1, 1
	addi $a3, $a2, 1
	ori $t0, $a3, 1
	beq $t0, $a3, incorrect

second:
	addi $t1, $t0, 1
	addi $t2, $t1, 1
	beq $t1, $t2, incorrect
	addi $t3, $t2, 1
	beq $t3, $t3, third
	beq $zero, $zero, incorrect

third:
	addi $t4, $t3, 1
	ori $t5, $t4, 0
	addi $t5, $t5, 1
	add $t6, $t5, $v0
	addi $t7, $t6, 1
	slt $s0, $t6, $t7
	add $s0, $t7, $s0
	addi $s1, $s0, 1
	beq $s1, $s0, incorrect
	addi $s2, $s1, 1
	addi $s3, $s2, 1
	add $s4, $s3, $v0
	addi $s5, $s4, 1
	ori $s6, $s5, 0
	addi $s6, $s6, 1
	add $s7, $s6, $v0
	addi $t8, $s7, 1
	ori $t9, $t8, 0
	addi $t9, $t9, 1
	beq $zero, $zero, exit

incorrect:
	and $v0, $zero, $zero
	and $v1, $zero, $zero
	and $a0, $zero, $zero
	and $a1, $zero, $zero
	and $a2, $zero, $zero
	and $a3, $zero, $zero
	and $t0, $zero, $zero
	and $t1, $zero, $zero
	and $t2, $zero, $zero
	and $t3, $zero, $zero
	and $t4, $zero, $zero
	and $t5, $zero, $zero
	and $t6, $zero, $zero
	and $t7, $zero, $zero
	and $s0, $zero, $zero
	and $s1, $zero, $zero
	and $s2, $zero, $zero
	and $s3, $zero, $zero
	and $s4, $zero, $zero
	and $s5, $zero, $zero
	and $s6, $zero, $zero
	and $s7, $zero, $zero
	and $t8, $zero, $zero
	and $t9, $zero, $zero

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
