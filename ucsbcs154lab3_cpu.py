import pyrtl
#pyrtl.set_debug_mode()
# code setup: based on ucsbcs154lab3
# Copyright (c) 2023 Regents of the University of California

i_mem = pyrtl.MemBlock(bitwidth = 32, addrwidth=32, name ='i_mem')
d_mem = pyrtl.MemBlock(bitwidth=32, addrwidth=32, name='d_mem', asynchronous=True)
rf    = pyrtl.MemBlock(bitwidth=32, addrwidth=5, name='rf', asynchronous=True)
#program counter
PC = pyrtl.Register(bitwidth=32)
## DECODER
# decode the instruction
# read data stored in rom
instr = pyrtl.WireVector(bitwidth=32, name='data')
instr <<= i_mem[PC]

# output data
op = pyrtl.WireVector(bitwidth=6, name='op')
rs = pyrtl.WireVector(bitwidth=5, name='rs')
rt = pyrtl.WireVector(bitwidth=5, name='rt')
rd = pyrtl.WireVector(bitwidth=5, name='rd')
sh = pyrtl.WireVector(bitwidth=5, name='sh')
func = pyrtl.WireVector(bitwidth=6, name='func')
imm = pyrtl.WireVector(bitwidth=16, name='imm')

### INSTRUCTION DECODE LOGIC
op <<= instr[26:32]
rs <<= instr[21:26]
rt <<= instr[16:21]
rd <<= instr[11:16]
sh <<= instr[6:11]
func <<= instr[0:6]
imm <<= instr[0:16]
## CONTROLLER
# define control signals for the following instructions
# add, and, addi, lui, ori, slt, lw, sw, beq
control_signals = pyrtl.WireVector(bitwidth=10, name='control_signals')
with pyrtl.conditional_assignment:
    with op == 0: #r types
        with func == 0x20: #add
            control_signals |= 0b1010000000
        with func == 0x21: #addu
            control_signals 
        with func == 0x24: #and
            control_signals |= 0b1010000001
        with func == 0x08: #jr
            control_signals
        with func == 0x27: #nor
            control_signals
        with func == 0x25: #or
            control_signals
        with func == 0x2A: #slt
            control_signals |= 0b1010000100
        with func == 0x2b: #sltu
            control_signals
        with func == 0x00: #sll
            control_signals
        with func == 0x02: #srl
            control_signals
        with func == 0x22: #sub
            control_signals
        with func == 0x23: #subu
            control_signals
        with func == 0x1a: #div
            control_signals
        with func == 0x1b: #divu
            control_signals
        with func == 0x10: #mfhi
            control_signals
        with func == 0x12: #mflo
            control_signals
        #mfc0 ?
        with func == 0x18: #mult
            control_signals
        with func == 0x19: #multu
            control_signals
        with func == 0x3: #sra
            control_signals
    with op == 0x8: #addi
        control_signals |= 0b0010100000
    with op == 0x9: #addiu
        control_signals
    with op == 0xC: #andi
        control_signals
    with op == 0x4: #beq
        control_signals |= 0b0100000101
    with op == 0x5: #bne
        control_signals 
    with op == 0x2: #j
        control_signals
    with op == 0x3: #jal
        control_signals
    with op == 0x08: #jr
        control_signals
    with op == 0x24: #lbu
        control_signals
    with op == 0x25: #lhu
        control_signals
    with op == 0x30: #ll
        control_signals
    with op == 0xF: #lui
        control_signals |= 0b0010100010
    with op == 0x23: #lw
        control_signals |= 0b0010101000
    with op == 0xD: #ori
        control_signals |= 0b0011000011
    with op == 0xA: #slti
        control_signals
    with op == 0xB: #sltiu
        control_signals
    with op == 0x28: #sb
        control_signals
    with op == 0x38: #sc
        control_signals
    with op == 0x29:#sh
        control_signals
    with op == 0x2B: #sw
        control_signals |= 0b0000110000
    with op == 0x31: #lwcl
        control_signals
    with op == 0x35: #ldcl
        control_signals
    with op == 0x39: #swcl
        control_signals
    with op == 0x3D: #sdcl
        control_signals

#extract the control signals 
reg_dst = pyrtl.WireVector(bitwidth=1, name='reg_dst')
branch = pyrtl.WireVector(bitwidth=1, name='branch')
regwrite = pyrtl.WireVector(bitwidth=1, name='regwrite')
alu_src = pyrtl.WireVector(bitwidth=2, name='alu_src')
mem_write = pyrtl.WireVector(bitwidth=1, name='mem_write')
mem_to_reg = pyrtl.WireVector(bitwidth=1, name='mem_to_reg')
alu_op = pyrtl.WireVector(bitwidth=3, name='alu_op')
mem_read = pyrtl.WireVector(bitwidth=1, name='mem_read')
jump = pyrtl.WireVector(bitwidth=1, name='jump')
jump_reg = pyrtl.WireVector(bitwidth=1, name='jump_reg')
link = pyrtl.WireVector(bitwidth=1, name='link')
branch_NE = pyrtl.WireVector(bitwidth=1, name='branch_NE')

reg_dst <<= control_signals[9:10]
branch <<= control_signals[8:9]
regwrite <<= control_signals[7:8]
alu_src <<= control_signals[5:7]
mem_write <<= control_signals[4:5]
mem_to_reg <<= control_signals[3:4]
alu_op <<= control_signals[0:3]

## WRITE REGISTER mux
# create the mux to choose among rd and rt for the write register
write = pyrtl.WireVector(bitwidth=5, name='write')
with pyrtl.conditional_assignment:
    with reg_dst == 0:
        write |= rt
    with pyrtl.otherwise:
        write |= rd
## READ REGISTER VALUES from the register file
# read the values of rs and rt registers from the register file
rs_val = pyrtl.WireVector(bitwidth=32, name='rs_val')
rt_val = pyrtl.WireVector(bitwidth=32, name='rt_val')
rs_val <<= rf[rs]
rt_val <<= rf[rt]
## ALU INPUTS
# define the ALU inputs after reading values of rs and rt registers from
# the register file
# Hint: Think about ALU inputs for instructions that use immediate values 
alu_input2 = pyrtl.WireVector(bitwidth=32, name='alu_input2')
with pyrtl.conditional_assignment:
    with alu_src == 0: #register rt
        alu_input2 |= rt_val
    with alu_src == 0b01: #sign extend
        alu_input2 |= imm.sign_extended(32)
    with alu_src == 0b10: #0 extend
        alu_input2 |= imm.zero_extended(32)

## FIND ALU OUTPUT
# find what the ALU outputs are for the following instructions:
# add, and, addi, lui, ori, slt, lw, sw, beq
# Hint: you want to find both ALU result and zero. Refer the figure in the
# lab document
alu_result = pyrtl.WireVector(bitwidth=32, name='alu_result')
zero = pyrtl.WireVector(bitwidth=1, name='zero')

with pyrtl.conditional_assignment:
    with alu_op == 0b000: #ADD operation
        alu_result |= (rs_val + alu_input2)
        zero |= 0 #X
    with alu_op == 0b001: #AND operation
        alu_result |= (rs_val & alu_input2)
        zero |= 0 #X
    with alu_op == 0b101: #SUB operation, zero != x here
        alu_result |= (rs_val - alu_input2)
        with alu_result == 0:
            zero |= 1
        with pyrtl.otherwise: 
            zero |= 0
    with alu_op == 0b100: #SLT
        alu_result |= pyrtl.signed_lt(rs_val, alu_input2)
        zero |= 0 #X
    with alu_op == 0b010: #LUI
        alu_result |= pyrtl.concat(alu_input2[0:16], pyrtl.Const(0, bitwidth=16))
        zero |= 0 #X
    with alu_op == 0b011: #OR
        alu_result |= (rs_val | alu_input2)
        zero |= 0 #X
## DATA MEMORY WRITE
# perform the write operation in the data memory. Think about which 
# instructions will need to write to the data memory
with pyrtl.conditional_assignment:
    with mem_write == 1: #sw
        d_mem[alu_result] |=  rt_val
## REGISTER WRITEBACK
# Create the mux to select between ALU result and data memory read.
# Writeback the selected value to the register file in the 
# appropriate write register 
with pyrtl.conditional_assignment:
    with (regwrite == 1) & (write != 0):
        with mem_to_reg == 0b1: #lw
            rf[write] |= d_mem[alu_result]
        with pyrtl.otherwise:
            rf[write] |= alu_result
## PC UPDATE
# finally update the program counter. Pay special attention when updating 
# the PC in the case of a branch instruction. 

with pyrtl.conditional_assignment:
    with (branch == 1) & (zero == 1):
        PC.next |= PC + 1 + imm.sign_extended(32)
    with pyrtl.otherwise:
        PC.next |= PC + 1


if __name__ == '__main__':

    """

    Here is how you can test your code.
    This is very similar to how the autograder will test your code too.

    1. Write a MIPS program. It can do anything as long as it tests the
       instructions you want to test.

    2. Assemble your MIPS program to convert it to machine code. Save
       this machine code to the "i_mem_init.txt" file. You can use the 
       "mips_to_hex.sh" file provided to assemble your MIPS program to 
       corresponding hexadecimal instructions.  
       You do NOT want to use QtSPIM for this because QtSPIM sometimes
       assembles with errors. Another assembler you can use is the following:

       https://alanhogan.com/asu/assembler.php

    3. Initialize your i_mem (instruction memory).

    4. Run your simulation for N cycles. Your program may run for an unknown
       number of cycles, so you may want to pick a large number for N so you
       can be sure that all instructions of the program are executed.

    5. Test the values in the register file and memory to make sure they are
       what you expect them to be.

    6. (Optional) Debug. If your code didn't produce the values you thought
       they should, then you may want to call sim.render_trace() on a small
       number of cycles to see what's wrong. You can also inspect the memory
       and register file after every cycle if you wish.

    Some debugging tips:

        - Make sure your assembly program does what you think it does! You
          might want to run it in a simulator somewhere else (SPIM, etc)
          before debugging your PyRTL code.

        - Test incrementally. If your code doesn't work on the first try,
          test each instruction one at a time.

        - Make use of the render_trace() functionality. You can use this to
          print all named wires and registers, which is extremely helpful
          for knowing when values are wrong.

        - Test only a few cycles at a time. This way, you don't have a huge
          500 cycle trace to go through!

    """

    # Start a simulation trace
    sim_trace = pyrtl.SimulationTrace()

    # Initialize the i_mem with your instructions.
    i_mem_init = {}
    with open('i_mem_init.txt', 'r') as fin:
        i = 0
        for line in fin.readlines():
            i_mem_init[i] = int(line, 16)
            i += 1

    sim = pyrtl.Simulation(tracer=sim_trace, memory_value_map={
        i_mem : i_mem_init
    })

    # Run for an arbitrarily large number of cycles.
    for cycle in range(500):
        sim.step({})

    # Use render_trace() to debug if your code doesn't work.
    # sim_trace.render_trace()

    # You can also print out the register file or memory like so if you want to debug:
    print(sim.inspect_mem(d_mem))
    print(sim.inspect_mem(rf))
    # Perform some sanity checks to see if your program worked correctly
    #assert(sim.inspect_mem(d_mem)[0] == 10)
    #assert(sim.inspect_mem(rf)[8] == 10)   
    print('Passed!')
