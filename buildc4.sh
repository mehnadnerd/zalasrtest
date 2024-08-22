set -e

../llvm-install/bin/clang -O2 --target=riscv64 -march=rv64gcv_zacas1p0_zicond1p0_zihintpause_zawrs           -o main.o main.S -static -mcmodel=medany -fvisibility=hidden -c -menable-experimental-extensions -Wno-builtin-macro-redefined --sysroot=/opt/homebrew/Cellar/riscv-gnu-toolchain/main/riscv64-unknown-elf -D__STDC_HOSTED__=0
../llvm-install/bin/clang -O2 --target=riscv64 -march=rv64gcv_zacas1p0_zicond1p0_zihintpause_zawrs           -o dcla1.o dcla.c -static -mcmodel=medany -fvisibility=hidden -c -menable-experimental-extensions -Wno-builtin-macro-redefined --sysroot=/opt/homebrew/Cellar/riscv-gnu-toolchain/main/riscv64-unknown-elf -D__STDC_HOSTED__=0
../llvm-install/bin/clang -O2 --target=riscv64 -march=rv64gcv_zacas1p0_zicond1p0_zihintpause_zawrs_zalasr0p1 -o dcla2.o dcla.c -static -mcmodel=medany -fvisibility=hidden -c -menable-experimental-extensions -Wno-builtin-macro-redefined --sysroot=/opt/homebrew/Cellar/riscv-gnu-toolchain/main/riscv64-unknown-elf -D__STDC_HOSTED__=0


../llvm-install/bin/ld.lld -T link.txt -o dcla1 -O2 main.o dcla1.o
../llvm-install/bin/ld.lld -T link.txt -o dcla2 -O2 main.o dcla2.o


../llvm-install/bin/llvm-objdump --disassemble-all dcla1 > dcla1.dis
../llvm-install/bin/llvm-objdump --disassemble-all dcla2 > dcla2.dis
