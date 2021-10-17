all: executavel.x

programa.o: programa.s
	clang-10 --target=riscv32 -march=rv32g -mabi=ilp32d -mno-relax programa.s -c -g -o programa.o

executavel.x: programa.o
	ld.lld-10  programa.o -g -o executavel.x