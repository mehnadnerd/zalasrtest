set -e

../../llvm-install/bin/clang -O2 \
--target=riscv32 \
-march=rv32gcv_zacas1p0_zicond1p0_zihintpause_zawrs_zalasr0p1 \
-o $1.o \
$1.S \
-static -mcmodel=medany -fvisibility=hidden \
-c -menable-experimental-extensions \
-Wno-builtin-macro-redefined \
--sysroot=/opt/homebrew/Cellar/riscv-gnu-toolchain/main/riscv64-unknown-elf \
-D__STDC_HOSTED__=0 \
-mabi=ilp32 \
-DXLEN=32 \
-DTEST_CASE_1 \


../../llvm-install/bin/ld.lld -T link-sail.ld -o $1-sail -O2 $1.o

../../llvm-install/bin/llvm-objdump --disassemble-all $1-sail > $1.dis
../../sail-riscv/c_emulator/riscv_sim_RV32 -i -v --trace=step --ram-size=14 --signature-granularity=4 \
--test-signature=$1.sail.sig $1 > $1.sail.log 2>&1;
echo $?