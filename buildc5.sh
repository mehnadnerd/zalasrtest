set -e

../llvm-install/bin/clang -O2 --target=riscv64 -march=rv64gcv_zacas1p0_zicond1p0_zihintpause_zawrs           -o main.o main.S -static -mcmodel=medany -fvisibility=hidden -c -menable-experimental-extensions -Wno-builtin-macro-redefined --sysroot=/opt/homebrew/Cellar/riscv-gnu-toolchain/main/riscv64-unknown-elf -D__STDC_HOSTED__=0
../llvm-install/bin/clang -O2 --target=riscv64 -march=rv64gcv_zacas1p0_zicond1p0_zihintpause_zawrs           -o dclhbsc1.o dclhbsc.c -static -mcmodel=medany -fvisibility=hidden -c -menable-experimental-extensions -Wno-builtin-macro-redefined --sysroot=/opt/homebrew/Cellar/riscv-gnu-toolchain/main/riscv64-unknown-elf -D__STDC_HOSTED__=0
../llvm-install/bin/clang -O2 --target=riscv64 -march=rv64gcv_zacas1p0_zicond1p0_zihintpause_zawrs_zalasr0p1 -o dclhbsc2.o dclhbsc.c -static -mcmodel=medany -fvisibility=hidden -c -menable-experimental-extensions -Wno-builtin-macro-redefined --sysroot=/opt/homebrew/Cellar/riscv-gnu-toolchain/main/riscv64-unknown-elf -D__STDC_HOSTED__=0


../llvm-install/bin/ld.lld -T link.txt -o dclhbsc1 -O2 main.o dclhbsc1.o
../llvm-install/bin/ld.lld -T link.txt -o dclhbsc2 -O2 main.o dclhbsc2.o


../llvm-install/bin/llvm-objdump --disassemble-all dclhbsc1 > dclhbsc1.dis
../llvm-install/bin/llvm-objdump --disassemble-all dclhbsc2 > dclhbsc2.dis
