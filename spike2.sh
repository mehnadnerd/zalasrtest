set -e

../riscv-isa-sim/build/spike -p2 -l --log=dcla1.itrace --isa=RV64GCV_zalasr dcla1
../riscv-isa-sim/build/spike -p2 -l --log=dcla2.itrace --isa=RV64GCV_zalasr dcla2
