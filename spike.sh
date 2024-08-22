set -e

../riscv-isa-sim/build/spike -p2 -l --log=dcsc1.itrace --isa=RV64GCV_zalasr dcsc1
../riscv-isa-sim/build/spike -p2 -l --log=dcsc2.itrace --isa=RV64GCV_zalasr dcsc2
