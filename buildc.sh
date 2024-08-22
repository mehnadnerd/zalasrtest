set -e

../llvm-project/build/bin/clang -O1 --target=riscv64 -march=rv64gcv_zacas1p0_zalasr0p1_zicond1p0 -o ctest.o ctest.c -static -mcmodel=medany -fvisibility=hidden -nostdlib  -fno-common -c -menable-experimental-extensions
../llvm-project/build/bin/clang -O1 --target=riscv64 -march=rv64gcv_zicond1p0 -o ctest2.o ctest.c -static -mcmodel=medany -fvisibility=hidden -nostdlib  -fno-common -c -menable-experimental-extensions
../llvm-project/build/bin/clang -O1 --target=riscv64 -march=rv64gcv_zicond1p0_ztso0p1 -o ctest3.o ctest.c -static -mcmodel=medany -fvisibility=hidden -nostdlib  -fno-common -c -menable-experimental-extensions
# ../llvm-project/build/bin/clang -O1 --target=aarch64 -o ctest.o ctest.c  -nostdlib  -fno-common -c

#../llvm-project/build/bin/clang -O1 --target=riscv64 -march=rv64gcv_zacas1p0_zalasr0p1_zicond1p0 -o ctest.o ctest.c -static -mcmodel=medany -fvisibility=hidden -nostdlib  -S -emit-llvm -fno-common -c -menable-experimental-extensions -mllvm -print-after-all

#../llvm-project/build/bin/clang -O1 --target=riscv64 -march=rv64gcv_zacas1p0_zalasr0p1_zicond1p0 -o ctest.o ctest.c -static -mcmodel=medany -fvisibility=hidden -nostdlib  -S -emit-llvm -fno-common -c -menable-experimental-extensions -mllvm -debug-only=isel -mllvm -print-after-all >& out2.log | tee out.log

#../llvm-project/build/bin/llc -o ctest.o ctest.ll -debug-only=isel -print-after-all >& out2.log | tee out.log

#../llvm-project/build/bin/clang --target=riscv64 -o ctest ctest.o -static -mcmodel=medany -fvisibility=hidden -nostdlib  -fno-common -T./link.txt

#../llvm-project/build/bin/clang -O1 -o aarch-ctest.o ctest.c -static  -fvisibility=hidden -nostdlib  -fno-common -c -mllvm -print-after-all | tee outaarch.log

#../llvm-project/build/bin/clang -O1 -pthread --target=riscv64 -march=rv64gcv_zacas1p0_zicond1p0 -o doublechecked1 doublechecked.c -static -mcmodel=medany -fvisibility=hidden -c -menable-experimental-extensions -I../llvm-project/build/include/c++/v1/
#../llvm-project/build/bin/clang -O1 --target=riscv64 -march=rv64gcv_zacas1p0_zalasr0p1_zicond1p0 -o doublechecked2 doublechecked.c -static -mcmodel=medany -fvisibility=hidden -c -menable-experimental-extensions -I../llvm-project/build/include/c++/v1/  -I../llvm-project/build/include/c++/v1/__thread/support/

../llvm-install/bin/clang -O2 -pthread --target=riscv64 -march=rv64gcv_zacas1p0_zicond1p0 -o doublechecked1.s doublechecked.c -static -mcmodel=medany -fvisibility=hidden -c -menable-experimental-extensions  --sysroot=/opt/homebrew/Cellar/riscv-gnu-toolchain/main/riscv64-unknown-elf -D__STDC_HOSTED__=0 -D_POSIX_THREADS -S

../llvm-install/bin/clang -O2 -pthread --target=riscv64 -march=rv64gcv_zacas1p0_zicond1p0_zalasr0p1 -o doublechecked2.s doublechecked.c -static -mcmodel=medany -fvisibility=hidden -c -menable-experimental-extensions  --sysroot=/opt/homebrew/Cellar/riscv-gnu-toolchain/main/riscv64-unknown-elf -D__STDC_HOSTED__=0 -D_POSIX_THREADS -S

#../llvm-install/bin/llvm-objdump --disassemble doublechecked1 > doublechecked1.dis
#../llvm-install/bin/llvm-objdump --disassemble doublechecked2 > doublechecked2.dis

#../llvm-install/bin/clang -O1 -pthread --target=riscv64 -march=rv64gcv_zacas1p0_zicond1p0 -static -mcmodel=medany -fvisibility=hidden -c -menable-experimental-extensions  --sysroot=/opt/homebrew/Cellar/riscv-gnu-toolchain/main/riscv64-unknown-elf -v -dM -E - < /dev/null
#riscv64-elf-gcc -O1 -lpthread -march=rv64gc -o doublecheckedgcc doublechecked.c -static -mcmodel=medany -fvisibility=hidden
