set -e

../llvm-install/bin/clang -O2 --target=riscv64 -march=rv64gcv_zacas1p0_zicond1p0_zihintpause_zawrs           -o main.o main.S -static -mcmodel=medany -fvisibility=hidden -c -menable-experimental-extensions -Wno-builtin-macro-redefined --sysroot=/opt/homebrew/Cellar/riscv-gnu-toolchain/main/riscv64-unknown-elf -D__STDC_HOSTED__=0
../llvm-install/bin/clang -O2 --target=riscv64 -march=rv64gcv_zacas1p0_zicond1p0_zihintpause_zawrs           -o dcsc1.o dcsc.c -static -mcmodel=medany -fvisibility=hidden -c -menable-experimental-extensions -Wno-builtin-macro-redefined --sysroot=/opt/homebrew/Cellar/riscv-gnu-toolchain/main/riscv64-unknown-elf -D__STDC_HOSTED__=0
../llvm-install/bin/clang -O2 --target=riscv64 -march=rv64gcv_zacas1p0_zicond1p0_zihintpause_zawrs_zalasr0p1 -o dcsc2.o dcsc.c -static -mcmodel=medany -fvisibility=hidden -c -menable-experimental-extensions -Wno-builtin-macro-redefined --sysroot=/opt/homebrew/Cellar/riscv-gnu-toolchain/main/riscv64-unknown-elf -D__STDC_HOSTED__=0


../llvm-install/bin/ld.lld -T link.txt -o dcsc1 -O2 main.o dcsc1.o
../llvm-install/bin/ld.lld -T link.txt -o dcsc2 -O2 main.o dcsc2.o


../llvm-install/bin/llvm-objdump --disassemble-all dcsc1 > dcsc1.dis
../llvm-install/bin/llvm-objdump --disassemble-all dcsc2 > dcsc2.dis
