all : biblioteca.x

biblioteca.o : biblioteca.s
	clang-10 --target=riscv32 -march=rv32g -mabi=ilp32d -mno-relax biblioteca.s -c -o biblioteca.o

biblioteca.x : biblioteca.o
	ld.lld-10 biblioteca.o -o biblioteca.x