set -e

../riscv-isa-sim/build/spike -p2 -l --log=dclhbsc1.itrace --isa=RV64GCV_zalasr dclhbsc1
../riscv-isa-sim/build/spike -p2 -l --log=dclhbsc2.itrace --isa=RV64GCV_zalasr dclhbsc2
