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
-DSPIKE \


../../llvm-install/bin/ld.lld -T link-spike.ld -o $1 -O2 $1.o

../../llvm-install/bin/llvm-objdump --disassemble-all $1 > $1.dis
../../riscv-isa-sim/build/spike -p1 -l --log=$1.itrace --isa=RV32GCV_zalasr +signature-granularity=4 +signature=$1.spike.sig $1
echo $?