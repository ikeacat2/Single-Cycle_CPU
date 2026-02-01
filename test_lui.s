.text
main:
    lui $t0, 0x1234      # $t0 = 0x12340000
    lui $t1, 0xFFFF      # $t1 = 0xFFFF0000
    beq $zero, $zero, main
