
	USER TEXT SEGMENT
[0x00400000]	0x3c020001  lui $2, 1                       ; 4: lui $v0, 1
[0x00400004]	0x20428000  addi $2, $2, -32768             ; 5: addi $v0, $v0, -32768
[0x00400008]	0x20428000  addi $2, $2, -32768             ; 6: addi $v0, $v0, -32768
[0x0040000c]	0x10020001  beq $0, $2, 4 [basic-0x0040000c]; 7: beq $zero, $v0, basic
[0x00400010]	0x10000035  beq $0, $0, 212 [incorrect-0x00400010]; 8: beq $zero, $zero, incorrect
[0x00400014]	0x34420001  ori $2, $2, 1                   ; 11: ori $v0, $v0, 0x1
[0x00400018]	0x346300ff  ori $3, $3, 255                 ; 12: ori $v1, $v1, 0xFF
[0x0040001c]	0x3484ffff  ori $4, $4, -1                  ; 13: ori $a0, $a0, 0xFFFF
[0x00400020]	0x3c0500ff  lui $5, 255                     ; 14: lui $a1, 0xFF
[0x00400024]	0x34a5ffff  ori $5, $5, -1                  ; 15: ori $a1, $a1, 0xFFFF
[0x00400028]	0x3c06ffff  lui $6, -1                      ; 16: lui $a2, 0xFFFF
[0x0040002c]	0x34c6ffff  ori $6, $6, -1                  ; 17: ori $a2, $a2, 0xFFFF
[0x00400030]	0x3c07ff00  lui $7, -256                    ; 18: lui $a3, 0xFF00
[0x00400034]	0x3c080ff0  lui $8, 4080                    ; 19: lui $t0, 0xFF0
[0x00400038]	0x3c0900ff  lui $9, 255                     ; 20: lui $t1, 0xFF
[0x0040003c]	0x3c0a00ff  lui $10, 255                    ; 21: lui $t2, 0xFF
[0x00400040]	0x354a0080  ori $10, $10, 128               ; 22: ori $t2, $t2, 0x80
[0x00400044]	0x3c0b0001  lui $11, 1                      ; 23: lui $t3, 0x1
[0x00400048]	0x356bff00  ori $11, $11, -256              ; 24: ori $t3, $t3, 0xFF00
[0x0040004c]	0x358c0ff0  ori $12, $12, 4080              ; 25: ori $t4, $t4, 0xFF0
[0x00400050]	0x35ad00ff  ori $13, $13, 255               ; 26: ori $t5, $t5, 0xFF
[0x00400054]	0x35ce0008  ori $14, $14, 8                 ; 27: ori $t6, $t6, 0x8
[0x00400058]	0x35ef0080  ori $15, $15, 128               ; 28: ori $t7, $t7, 0x80
[0x0040005c]	0x3c100001  lui $16, 1                      ; 31: lui $s0, 0x1
[0x00400060]	0x22108001  addi $16, $16, -32767           ; 32: addi $s0, $s0, -0x7FFF
[0x00400064]	0x221087ff  addi $16, $16, -30721           ; 33: addi $s0, $s0, -0x7801
[0x00400068]	0x3c110001  lui $17, 1                      ; 34: lui $s1, 0x1
[0x0040006c]	0x22318000  addi $17, $17, -32768           ; 35: addi $s1, $s1, -0x8000
[0x00400070]	0x3c120007  lui $18, 7                      ; 36: lui $s2, 0x7
[0x00400074]	0x22527fff  addi $18, $18, 32767            ; 37: addi $s2, $s2, 0x7FFF
[0x00400078]	0x22527fff  addi $18, $18, 32767            ; 38: addi $s2, $s2, 0x7FFF
[0x0040007c]	0x22520002  addi $18, $18, 2                ; 39: addi $s2, $s2, 0x2
[0x00400080]	0x3c13007f  lui $19, 127                    ; 40: lui $s3, 0x7F
[0x00400084]	0x22737fff  addi $19, $19, 32767            ; 41: addi $s3, $s3, 0x7FFF
[0x00400088]	0x22737fff  addi $19, $19, 32767            ; 42: addi $s3, $s3, 0x7FFF
[0x0040008c]	0x22730002  addi $19, $19, 2                ; 43: addi $s3, $s3, 0x2
[0x00400090]	0x3c1407ff  lui $20, 2047                   ; 44: lui $s4, 0x7FF
[0x00400094]	0x22947fff  addi $20, $20, 32767            ; 45: addi $s4, $s4, 0x7FFF
[0x00400098]	0x22947fff  addi $20, $20, 32767            ; 46: addi $s4, $s4, 0x7FFF
[0x0040009c]	0x22940002  addi $20, $20, 2                ; 47: addi $s4, $s4, 0x2
[0x004000a0]	0x3c157fff  lui $21, 32767                  ; 48: lui $s5, 0x7FFF
[0x004000a4]	0x22b57fff  addi $21, $21, 32767            ; 49: addi $s5, $s5, 0x7FFF
[0x004000a8]	0x22b57fff  addi $21, $21, 32767            ; 50: addi $s5, $s5, 0x7FFF
[0x004000ac]	0x22b50002  addi $21, $21, 2                ; 51: addi $s5, $s5, 0x2
[0x004000b0]	0x3c16ffff  lui $22, -1                     ; 52: lui $s6, 0xFFFF
[0x004000b4]	0x22d61000  addi $22, $22, 4096             ; 53: addi $s6, $s6, 4096
[0x004000b8]	0x3c1700ff  lui $23, 255                    ; 54: lui $s7, 0xFF
[0x004000bc]	0x22f77fff  addi $23, $23, 32767            ; 55: addi $s7, $s7, 0x7FFF
[0x004000c0]	0x22f77fff  addi $23, $23, 32767            ; 56: addi $s7, $s7, 0x7FFF
[0x004000c4]	0x22f70002  addi $23, $23, 2                ; 57: addi $s7, $s7, 0x2
[0x004000c8]	0x3c18007f  lui $24, 127                    ; 58: lui $t8, 0x7F
[0x004000cc]	0x3718ffff  ori $24, $24, -1                ; 59: ori $t8, $t8, 0xFFFF
[0x004000d0]	0x23180001  addi $24, $24, 1                ; 60: addi $t8, $t8, 0x1
[0x004000d4]	0x3c190040  lui $25, 64                     ; 61: lui $t9, 0x40
[0x004000d8]	0x0326c824  and $25, $25, $6                ; 62: and $t9, $t9, $a2
[0x004000dc]	0x0325c824  and $25, $25, $5                ; 63: and $t9, $t9, $a1
[0x004000e0]	0x0328c824  and $25, $25, $8                ; 64: and $t9, $t9, $t0
[0x004000e4]	0x10000018  beq $0, $0, 96 [exit-0x004000e4]; 65: beq $zero, $zero, exit
[0x004000e8]	0x00001024  and $2, $0, $0                  ; 68: and $v0, $zero, $zero
[0x004000ec]	0x00001824  and $3, $0, $0                  ; 69: and $v1, $zero, $zero
[0x004000f0]	0x00002024  and $4, $0, $0                  ; 70: and $a0, $zero, $zero
[0x004000f4]	0x00002824  and $5, $0, $0                  ; 71: and $a1, $zero, $zero
[0x004000f8]	0x00003024  and $6, $0, $0                  ; 72: and $a2, $zero, $zero
[0x004000fc]	0x00003824  and $7, $0, $0                  ; 73: and $a3, $zero, $zero
[0x00400100]	0x00004024  and $8, $0, $0                  ; 74: and $t0, $zero, $zero
[0x00400104]	0x00004824  and $9, $0, $0                  ; 75: and $t1, $zero, $zero
[0x00400108]	0x00005024  and $10, $0, $0                 ; 76: and $t2, $zero, $zero
[0x0040010c]	0x00005824  and $11, $0, $0                 ; 77: and $t3, $zero, $zero
[0x00400110]	0x00006024  and $12, $0, $0                 ; 78: and $t4, $zero, $zero
[0x00400114]	0x00006824  and $13, $0, $0                 ; 79: and $t5, $zero, $zero
[0x00400118]	0x00007024  and $14, $0, $0                 ; 80: and $t6, $zero, $zero
[0x0040011c]	0x00007824  and $15, $0, $0                 ; 81: and $t7, $zero, $zero
[0x00400120]	0x00008024  and $16, $0, $0                 ; 82: and $s0, $zero, $zero
[0x00400124]	0x00008824  and $17, $0, $0                 ; 83: and $s1, $zero, $zero
[0x00400128]	0x00009024  and $18, $0, $0                 ; 84: and $s2, $zero, $zero
[0x0040012c]	0x00009824  and $19, $0, $0                 ; 85: and $s3, $zero, $zero
[0x00400130]	0x0000a024  and $20, $0, $0                 ; 86: and $s4, $zero, $zero
[0x00400134]	0x0000a824  and $21, $0, $0                 ; 87: and $s5, $zero, $zero
[0x00400138]	0x0000b024  and $22, $0, $0                 ; 88: and $s6, $zero, $zero
[0x0040013c]	0x0000b824  and $23, $0, $0                 ; 89: and $s7, $zero, $zero
[0x00400140]	0x0000c024  and $24, $0, $0                 ; 90: and $t8, $zero, $zero
[0x00400144]	0x0000c824  and $25, $0, $0                 ; 91: and $t9, $zero, $zero
[0x00400148]	0x1000ffff  beq $0, $0, -4 [exit-0x00400148]; 94: beq $zero, $zero, exit
