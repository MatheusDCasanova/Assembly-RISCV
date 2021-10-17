all: conversor.x

conversor.s: conversor.c
	clang-10 --target=riscv32 -march=rv32g -mabi=ilp32d -mno-relax conversor.c -S -g -o conversor.s

conversor.o: conversor.s
	clang-10 --target=riscv32 -march=rv32g -mabi=ilp32d -mno-relax conversor.s -c -g -o conversor.o

conversor.x: conversor.o
	ld.lld-10 conversor.o -g -o conversor.x

