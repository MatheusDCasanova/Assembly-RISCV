all : raiz_quadrada.x

raiz_quadrada.o : raiz_quadrada.s
	clang-10 --target=riscv32 -march=rv32g -mabi=ilp32d -mno-relax raiz_quadrada.s -c -o raiz_quadrada.o

raiz_quadrada.x : raiz_quadrada.o
	ld.lld-10 raiz_quadrada.o -o raiz_quadrada.x