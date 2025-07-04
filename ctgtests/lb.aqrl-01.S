
// -----------
// This file was generated by riscv_ctg (https://github.com/riscv-software-src/riscv-ctg)
// version   : 0.12.2
// timestamp : Thu May 15 07:39:12 2025 GMT
// usage     : riscv_ctg \
//                  -- cgf //                  --cgf /Users/brs/Documents/research/riscv-arch-test/coverage/dataset.cgf \
//                  --cgf /Users/brs/Documents/research/riscv-arch-test/coverage/zalasr/rv32zalasr.cgf \
 \
//                  -- xlen 32  \
//                  --randomize \
// -----------
//
// -----------
// Copyright (c) 2020. RISC-V International. All rights reserved.
// SPDX-License-Identifier: BSD-3-Clause
// -----------
//
// This assembly file tests the lb.aqrl instruction of the RISC-V RV32_Zalasr extension for the lb.aqrl covergroup.
// 
#include "model_test.h"
#include "arch_test.h"
RVTEST_ISA("RV32I_Zalasr")

.section .text.init
.globl rvtest_entry_point
rvtest_entry_point:
RVMODEL_BOOT
RVTEST_CODE_BEGIN

#ifdef TEST_CASE_1

RVTEST_CASE(0,"//check ISA:=regex(.*Zalasr.*);def TEST_CASE_1=True;",lb.aqrl)

RVTEST_SIGBASE(x1,signature_x1_1)

inst_0:// rs1 == rd, rs1==x25, rd==x25, ea_align == 3, 
// opcode:lb.aqrl op1:x25; dest:x25; align:3
TEST_LOAD(x1,x3,0,x25,x25,0,0*XLEN/8,lb.aqrl,3)

inst_1:// rs1 != rd, rs1==x4, rd==x10, ea_align == 2, 
// opcode:lb.aqrl op1:x4; dest:x10; align:2
TEST_LOAD(x1,x3,0,x4,x10,0,1*XLEN/8,lb.aqrl,2)

inst_2:// rs1==x19, rd==x14, ea_align == 1, 
// opcode:lb.aqrl op1:x19; dest:x14; align:1
TEST_LOAD(x1,x3,0,x19,x14,0,2*XLEN/8,lb.aqrl,1)

inst_3:// rs1==x7, rd==x24, ea_align == 0, 
// opcode:lb.aqrl op1:x7; dest:x24; align:0
TEST_LOAD(x1,x3,0,x7,x24,0,3*XLEN/8,lb.aqrl,0)

inst_4:// rs1==x21, rd==x27, 
// opcode:lb.aqrl op1:x21; dest:x27; align:0
TEST_LOAD(x1,x3,0,x21,x27,0,4*XLEN/8,lb.aqrl,0)

inst_5:// rs1==x27, rd==x11, 
// opcode:lb.aqrl op1:x27; dest:x11; align:0
TEST_LOAD(x1,x3,0,x27,x11,0,5*XLEN/8,lb.aqrl,0)

inst_6:// rs1==x13, rd==x26, 
// opcode:lb.aqrl op1:x13; dest:x26; align:0
TEST_LOAD(x1,x3,0,x13,x26,0,6*XLEN/8,lb.aqrl,0)

inst_7:// rs1==x2, rd==x22, 
// opcode:lb.aqrl op1:x2; dest:x22; align:0
TEST_LOAD(x1,x3,0,x2,x22,0,7*XLEN/8,lb.aqrl,0)

inst_8:// rs1==x12, rd==x21, 
// opcode:lb.aqrl op1:x12; dest:x21; align:0
TEST_LOAD(x1,x3,0,x12,x21,0,8*XLEN/8,lb.aqrl,0)

inst_9:// rs1==x23, rd==x17, 
// opcode:lb.aqrl op1:x23; dest:x17; align:0
TEST_LOAD(x1,x3,0,x23,x17,0,9*XLEN/8,lb.aqrl,0)

inst_10:// rs1==x11, rd==x8, 
// opcode:lb.aqrl op1:x11; dest:x8; align:0
TEST_LOAD(x1,x3,0,x11,x8,0,10*XLEN/8,lb.aqrl,0)

inst_11:// rs1==x29, rd==x4, 
// opcode:lb.aqrl op1:x29; dest:x4; align:0
TEST_LOAD(x1,x3,0,x29,x4,0,11*XLEN/8,lb.aqrl,0)

inst_12:// rs1==x17, rd==x5, 
// opcode:lb.aqrl op1:x17; dest:x5; align:0
TEST_LOAD(x1,x3,0,x17,x5,0,12*XLEN/8,lb.aqrl,0)

inst_13:// rs1==x30, rd==x13, 
// opcode:lb.aqrl op1:x30; dest:x13; align:0
TEST_LOAD(x1,x3,0,x30,x13,0,13*XLEN/8,lb.aqrl,0)

inst_14:// rs1==x26, rd==x9, 
// opcode:lb.aqrl op1:x26; dest:x9; align:0
TEST_LOAD(x1,x3,0,x26,x9,0,14*XLEN/8,lb.aqrl,0)

inst_15:// rs1==x24, rd==x6, 
// opcode:lb.aqrl op1:x24; dest:x6; align:0
TEST_LOAD(x1,x3,0,x24,x6,0,15*XLEN/8,lb.aqrl,0)

inst_16:// rs1==x10, rd==x12, 
// opcode:lb.aqrl op1:x10; dest:x12; align:0
TEST_LOAD(x1,x3,0,x10,x12,0,16*XLEN/8,lb.aqrl,0)

inst_17:// rs1==x22, rd==x28, 
// opcode:lb.aqrl op1:x22; dest:x28; align:0
TEST_LOAD(x1,x3,0,x22,x28,0,17*XLEN/8,lb.aqrl,0)

inst_18:// rs1==x5, rd==x30, 
// opcode:lb.aqrl op1:x5; dest:x30; align:0
TEST_LOAD(x1,x3,0,x5,x30,0,18*XLEN/8,lb.aqrl,0)

inst_19:// rs1==x14, rd==x16, 
// opcode:lb.aqrl op1:x14; dest:x16; align:0
TEST_LOAD(x1,x3,0,x14,x16,0,19*XLEN/8,lb.aqrl,0)

inst_20:// rs1==x16, rd==x29, 
// opcode:lb.aqrl op1:x16; dest:x29; align:0
TEST_LOAD(x1,x3,0,x16,x29,0,20*XLEN/8,lb.aqrl,0)

inst_21:// rs1==x18, rd==x31, 
// opcode:lb.aqrl op1:x18; dest:x31; align:0
TEST_LOAD(x1,x3,0,x18,x31,0,21*XLEN/8,lb.aqrl,0)
RVTEST_SIGBASE(x4,signature_x4_0)

inst_22:// rs1==x31, rd==x3, 
// opcode:lb.aqrl op1:x31; dest:x3; align:0
TEST_LOAD(x4,x5,0,x31,x3,0,0*XLEN/8,lb.aqrl,0)

inst_23:// rs1==x8, rd==x0, 
// opcode:lb.aqrl op1:x8; dest:x0; align:0
TEST_LOAD(x4,x5,0,x8,x0,0,1*XLEN/8,lb.aqrl,0)

inst_24:// rs1==x9, rd==x1, 
// opcode:lb.aqrl op1:x9; dest:x1; align:0
TEST_LOAD(x4,x5,0,x9,x1,0,2*XLEN/8,lb.aqrl,0)

inst_25:// rs1==x28, rd==x7, 
// opcode:lb.aqrl op1:x28; dest:x7; align:0
TEST_LOAD(x4,x5,0,x28,x7,0,3*XLEN/8,lb.aqrl,0)

inst_26:// rs1==x1, rd==x19, 
// opcode:lb.aqrl op1:x1; dest:x19; align:0
TEST_LOAD(x4,x5,0,x1,x19,0,4*XLEN/8,lb.aqrl,0)

inst_27:// rs1==x3, rd==x15, 
// opcode:lb.aqrl op1:x3; dest:x15; align:0
TEST_LOAD(x4,x5,0,x3,x15,0,5*XLEN/8,lb.aqrl,0)

inst_28:// rs1==x15, rd==x23, 
// opcode:lb.aqrl op1:x15; dest:x23; align:0
TEST_LOAD(x4,x5,0,x15,x23,0,6*XLEN/8,lb.aqrl,0)

inst_29:// rs1==x6, rd==x20, 
// opcode:lb.aqrl op1:x6; dest:x20; align:0
TEST_LOAD(x4,x5,0,x6,x20,0,7*XLEN/8,lb.aqrl,0)

inst_30:// rs1==x20, rd==x18, 
// opcode:lb.aqrl op1:x20; dest:x18; align:0
TEST_LOAD(x4,x5,0,x20,x18,0,8*XLEN/8,lb.aqrl,0)

inst_31:// rd==x2, 
// opcode:lb.aqrl op1:x24; dest:x2; align:0
TEST_LOAD(x4,x5,0,x24,x2,0,9*XLEN/8,lb.aqrl,0)
#endif


RVTEST_CODE_END
RVMODEL_HALT

RVTEST_DATA_BEGIN
.align 4
rvtest_data:
.word 0xbabecafe
.word 0xabecafeb
.word 0xbecafeba
.word 0xecafebab
RVTEST_DATA_END

RVMODEL_DATA_BEGIN
rvtest_sig_begin:
sig_begin_canary:
CANARY;



signature_x1_0:
    .fill 0*((XLEN/8)/4),4,0xdeadbeef


signature_x1_1:
    .fill 22*((XLEN/8)/4),4,0xdeadbeef


signature_x4_0:
    .fill 10*((XLEN/8)/4),4,0xdeadbeef

#ifdef rvtest_mtrap_routine
tsig_begin_canary:
CANARY;

mtrap_sigptr:
    .fill 64*XLEN/32,4,0xdeadbeef

tsig_end_canary:
CANARY;
#endif

#ifdef rvtest_gpr_save

gpr_save:
    .fill 32*XLEN/32,4,0xdeadbeef

#endif


sig_end_canary:
CANARY;
rvtest_sig_end:
RVMODEL_DATA_END
