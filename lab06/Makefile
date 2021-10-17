all : imagem.x

imagem.o : imagem.s
	clang-10 --target=riscv32 -march=rv32g -mabi=ilp32d -mno-relax imagem.s -c -o imagem.o

imagem.x : imagem.o
	ld.lld-10 imagem.o -o imagem.x