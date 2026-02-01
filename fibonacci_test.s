.text

main:
	ori $t4, $zero, 4
	ori $t3, $zero, 0
	ori $s0, $zero, 0
	ori $s1, $zero, 1
	ori $t1, $zero, 1
	ori $t2, $zero, 2
	ori $t5, $zero, 48
	sw  $s0, 0($t3)
	add $t3, $t3, $t4
	sw  $s1, 0($t3)
	add $t3, $t3, $t4

loop:
	slt $t6, $t2, $t5
	beq $t6, $zero, limit
	add $t6, $s0, $s1
	add $s0, $s1, $zero
	add $s1, $t6, $zero
	sw  $s1, 0($t3)
	add $t3, $t3, $t4
	add $t2, $t2, $t1
	beq $zero, $zero, loop

limit:
	slt $t6, $t5, $t2
	beq $t6, $zero, exit
	beq $zero, $zero, exit

exit:
	beq $zero, $zero, exit

# ANSWER
# mem[0] = 0
# mem[4] = 1
# mem[8] = 1
# mem[12] = 2
# mem[16] = 3
# mem[20] = 5
# mem[24] = 8
# mem[28] = 13
# mem[32] = 21
# mem[36] = 34
# mem[40] = 55
# mem[44] = 89
# mem[48] = 144
# mem[52] = 233
# mem[56] = 377
# mem[60] = 610
# mem[64] = 987
# mem[68] = 1597
# mem[72] = 2584
# mem[76] = 4181
# mem[80] = 6765
# mem[84] = 10946
# mem[88] = 17711
# mem[92] = 28657
# mem[96] = 46368
# mem[100] = 75025
# mem[104] = 121393
# mem[108] = 196418
# mem[112] = 317811
# mem[116] = 514229
# mem[120] = 832040
# mem[124] = 1346269
# mem[128] = 2178309
# mem[132] = 3524578
# mem[136] = 5702887
# mem[140] = 9227465
# mem[144] = 14930352
# mem[148] = 24157817
# mem[152] = 39088169
# mem[156] = 63245986
# mem[160] = 102334155
# mem[164] = 165580141
# mem[168] = 267914296
# mem[172] = 433494437
# mem[176] = 701408733
# mem[180] = 1134903170
# mem[184] = 1836311903
# mem[188] = 2971215073
