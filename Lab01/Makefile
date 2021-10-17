all: executavel.x

arquivo1.s: arquivo1.c
	clang-10 --target=riscv32 -march=rv32g -mabi=ilp32d -mno-relax arquivo1.c -S -g -o arquivo1.s

arquivo2.s: arquivo2.c
	clang-10 --target=riscv32 -march=rv32g -mabi=ilp32d -mno-relax arquivo2.c -S -g -o arquivo2.s

arquivo1.o: arquivo1.s
	clang-10 --target=riscv32 -march=rv32g -mabi=ilp32d -mno-relax arquivo1.s -c -g -o arquivo1.o

arquivo2.o: arquivo2.s
	clang-10 --target=riscv32 -march=rv32g -mabi=ilp32d -mno-relax arquivo2.s -c -g -o arquivo2.o

executavel.x: arquivo1.o arquivo2.o
	ld.lld-10 arquivo1.o arquivo2.o -g -o executavel.x