.globl _start

.bss
buffer: .skip 300000
x: .skip 4
y: .skip 4

.data
input_file: .asciz "imagem.pgm"


.text
open:
    la a0, input_file    # endereço do caminho para o arquivo
    li a1, 0             # flags (0: rdonly, 1: wronly, 2: rdwr)
    li a2, 0             # modo
    li a7, 1024          # syscall open 
    ecall
    ret

read:
    la a1, buffer #  buffer
    li a2, 300000 # size (lendo apenas 1 byte, mas tamanho é variável)
    li a7, 63 # syscall read (63)
    ecall
    ret

write:
    li a0, 1            # file descriptor = 1 (stdout)
    #la a1, string       # buffer
    #li a2, 19           # size
    li a7, 64           # syscall write (64)
    ecall
    ret
 
setPixel: #a0 = coordenada x   a1  = coordenada y   a2 = cor do pixel
    li a7, 2200 # syscall setGSPixel (2200)
    ecall
    ret

setCanvasSize: #a0: largura(x)  a1: altura(y)
    li a7, 2201
    ecall
    ret

setScaling: #a0: scaling horizontal  a1: scaling vertical
    li a0, 2
    li a1, 2
    li a7, 2202
    ecall
    ret


end: 
    li a0, 0
    li a7, 93
    ecall


_start:
    jal open
    jal read #a0 contem o file descriptor

    #matriz armazenada no endereco de buffer
    jal calcular_tamanho
    la a0, x
    lw a0, 0(a0)
    la a1, y
    lw a1, 0(a1)

    jal setCanvasSize
    #jal setScaling

    la a2, buffer
    addi a2, a2, 15

    jal exibir_imagem
    
    j end


converter_para_inteiro:#a0: tamanho da string a1: posicao inicial no buffer  a2: endereco do buffer // resultado em a3
    #calcular a potencia de 10 maxima (depende do numero de algarismos)
    li t0, 1
    li t1, 10
    mv t2, a0 #tamanho da string em t2
    li t3, 1 #i
    for:
    bge t3, t2, continue # if t0 >= t1 then target
    mul t0, t1, t0
    addi t3, t3, 1
    j for

    continue:#potencia de 10 maxima guardada em t0
    li a3, 0 #resultado
    add s0, a1, a2 #s0 aponta para o algarismo mais significativo
    mv t2, a0 #condicao de parada (ate i chegar no tamanho da string)
    li t3, 0 #i
    li t1, 10
    for2:
    bge t3, t2, inteirou # if t3 >= t2 then target
    add s2, s0, t3 #inicio do numero + i 
    lbu s1, 0(s2) #carrego o algarismo
    addi s1, s1, -48 #transformo inteiro
    mul s1, s1, t0 #multiplico pela potencia
    add a3, s1, a3 #somo com o q foi feito nas outras iteracoes
    #atualizar contadores
    div t0, t0, t1 #t0 = t0/10
    addi t3, t3, 1 # i = i + 1
    j for2
    inteirou:
    li s2, 0
    ret

calcular_n_algarismos: #a2 : endereco inicio buffer  a1: off_set
    li a0, 0
    #get char
    #while char >= 48{
    #a0++
    #}
    add a4, a2, a1 #a4 aponta para o primeiro algarismo do numero
    li t1, 48
    while:
    lbu s0, 0(a4) #s0 contem o valor do caractere
    blt s0, t1, terminou # if s0 < t1 then target
    addi a0, a0, 1
    addi a4, a4, 1
    j while
    terminou:
    ret



calcular_tamanho:
    la a2, buffer
    mv s11, ra #salva o endereco de retorno

    li a1, 3 #posicao inicial no buffer
    jal calcular_n_algarismos #tamanho do numero em a0
    //li a0, 3 #tamanho da string
    jal ra, converter_para_inteiro #resultado em a3
    la s0, x
    sw a3, 0(s0) #guarda o resultado em x

    //li a1, 7
    add a1, a1, a0 
    addi a1, a1, 1
    jal calcular_n_algarismos #tamanho do numero em a0
    jal ra, converter_para_inteiro #resultado em a3
    la s0, y
    sw a3, 0(s0)

    mv ra, s11
    ret

exibir_imagem: #inicio da matriz em a2

    mv a3, a2
    li t0, 0 #i
    la t1, y
    lw t1, 0(t1) #t1 = y 

    li t2, 0 #j
    la t3, x
    lw t3, 0(t3) #t2 = j

    mv s11, ra

    li t4, 0 #posicao no buffer

    for_i:
    bge t0, t1, final_for_i # if i >= y terminou

    for_j:
    bge t2, t3, final_for_j # if j >= x proxima linha
    #fazer operacoes
    add s5, a3, t4 #guarda o endereco do elemento da vez em s5
    lbu s6, 0(s5) #pega o numero no endereco da vez
    mv a0, t2 #x
    mv a1, t0 #y

    slli s7, s6, 24 #s7 = R
    slli s8, s6, 16 #s8 = G
    slli s9, s6, 8 #s9 = B
    li s6, 255 #s6 = alpha 
    li a2, 0 #a2 armazenara o resultado (cor do pixel)
    or a2, s7, a2
    or a2, s8, a2
    or a2, s9, a2
    or a2, s6, a2
    jal setPixel

    addi t4, t4, 1 #atualiza a posicao da matriz q esta pegando
    addi t2, t2, 1 #atualiza o j (x)
    j for_j
    final_for_j:
    addi t0, t0, 1 #atualizo o i (y)
    li t2, 0 #volto o j para zero
    j for_i

    final_for_i:
    mv ra, s11
    ret





    


