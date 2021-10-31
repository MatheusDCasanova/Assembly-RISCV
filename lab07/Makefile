main.x: exemplo.o lib.o
	ld.lld-10 exemplo.o lib.o -o main.x

exemplo.s: exemplo.c
	clang-10 --target=riscv32 -march=rv32g -mabi=ilp32d -mno-relax exemplo.c -S -o exemplo.s

exemplo.o: exemplo.s
	clang-10 --target=riscv32 -march=rv32g -mabi=ilp32d -mno-relax exemplo.s -c -o exemplo.o

lib.o: lib.s
	clang-10 --target=riscv32 -march=rv32g -mabi=ilp32d -mno-relax lib.s -c -o lib.o