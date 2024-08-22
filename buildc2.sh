set -e
cat ctest2.ll | ../llvm-project/build/bin/llc
#../llvm-project/build/bin/clang -O1 -o aarch-ctest.o ctest.c -static  -fvisibility=hidden -nostdlib -nostartfiles -fno-common -c -mllvm -print-after-all | tee outaarch.log

