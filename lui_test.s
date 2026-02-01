.text

main:
	lui $v0, 1
	addi $v0, $v0, -32768
	addi $v0, $v0, -32768
	beq $zero, $v0, basic
	beq $zero, $zero, incorrect

basic:
	ori $v0, $v0, 0x1
	ori $v1, $v1, 0xFF
	ori $a0, $a0, 0xFFFF
	lui $a1, 0xFF
	ori $a1, $a1, 0xFFFF
	lui $a2, 0xFFFF
	ori $a2, $a2, 0xFFFF
	lui $a3, 0xFF00
	lui $t0, 0xFF0
	lui $t1, 0xFF
	lui $t2, 0xFF
	ori $t2, $t2, 0x80
	lui $t3, 0x1
	ori $t3, $t3, 0xFF00
	ori $t4, $t4, 0xFF0
	ori $t5, $t5, 0xFF
	ori $t6, $t6, 0x8
	ori $t7, $t7, 0x80

advanced:
	lui $s0, 0x1
	addi $s0, $s0, -0x7FFF
	addi $s0, $s0, -0x7801
	lui $s1, 0x1
	addi $s1, $s1, -0x8000
	lui $s2, 0x7
	addi $s2, $s2, 0x7FFF
	addi $s2, $s2, 0x7FFF
	addi $s2, $s2, 0x2
	lui $s3, 0x7F
	addi $s3, $s3, 0x7FFF
	addi $s3, $s3, 0x7FFF
	addi $s3, $s3, 0x2
	lui $s4, 0x7FF
	addi $s4, $s4, 0x7FFF
	addi $s4, $s4, 0x7FFF
	addi $s4, $s4, 0x2
	lui $s5, 0x7FFF
	addi $s5, $s5, 0x7FFF
	addi $s5, $s5, 0x7FFF
	addi $s5, $s5, 0x2
	lui $s6, 0xFFFF
	addi $s6, $s6, 4096
	lui $s7, 0xFF
	addi $s7, $s7, 0x7FFF
	addi $s7, $s7, 0x7FFF
	addi $s7, $s7, 0x2
	lui $t8, 0x7F
	ori $t8, $t8, 0xFFFF
	addi $t8, $t8, 0x1
	lui $t9, 0x40
	and $t9, $t9, $a2
	and $t9, $t9, $a1
	and $t9, $t9, $t0
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
# $v1 = 255
# $a0 = 65535
# $a1 = 16777215
# $a2 = 4294967295
# $a3 = 4278190080
# $t0 = 267386880
# $t1 = 16711680
# $t2 = 1044480
# $t3 = 65280
# $t4 = 4080
# $t5 = 255
# $t6 = 8
# $t7 = 128
# $s0 = 2048
# $s1 = 32768
# $s2 = 524288
# $s3 = 8388608
# $s4 = 134217728
# $s5 = 2147483648
# $s6 = 268435456
# $s7 = 16777216
# $t8 = 8388608
# $t9 = 4194304
# $k0 = ??
# $k1 = ??
# $gp = ??
# $sp = ??
# $fp = ??
# $ra = ??
