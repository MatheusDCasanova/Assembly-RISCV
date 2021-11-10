main.x: lab9.o lib.o
	ld.lld-10 lab9.o lib.o -o main.x

lab9.s: lab9.c
	clang-10 --target=riscv32 -march=rv32g -mabi=ilp32d -mno-relax lab9.c -S -o lab9.s

lab9.o: lab9.s
	clang-10 --target=riscv32 -march=rv32g -mabi=ilp32d -mno-relax lab9.s -c -o lab9.o

lib.o: lib.s
	clang-10 --target=riscv32 -march=rv32g -mabi=ilp32d -mno-relax lib.s -c -o lib.o