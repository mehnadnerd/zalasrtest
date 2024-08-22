set -e
../llvm-project/build/bin/clang --target=riscv64 -march=rv64gcv_zacas1p0_zalasr0p1_zicond1p0 -o test.o test.S -static -mcmodel=medany -fvisibility=hidden -nostdlib -nostartfiles -fno-common -c -menable-experimental-extensions
#../llvm-project/build/bin/clang --target=riscv64 -o test test.o -static -mcmodel=medany -fvisibility=hidden -nostdlib -nostartfiles -fno-common -T./link.txt

../binutilsinstall/bin/riscv64-unknown-elf-as -march=rv64gcv_zalasr_zicond -o testgcc.o test.S  
