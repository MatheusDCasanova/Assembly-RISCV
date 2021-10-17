.globl _start

input_adress: .skip 0x14  # buffer

read:
    li a0, 0 # file descriptor = 0 (stdin)
    la a1, input_adress #  buffer
    li a2, 20 # size (lendo apenas 1 byte, mas tamanho é variável)
    li a7, 63 # syscall read (63)
    ecall
    ret

write:
    li a0, 1            # file descriptor = 1 (stdout)
    la a1, input_adress    # buffer
    li a2, 20         # size
    li a7, 64           # syscall write (64)
    ecall
    ret

.data
contador: .word 0
n: .word 10

.text
_start:
    jal ra, read
    lw t0, contador
    lw t1, n
    jal ra, inteirar
    #slti t3, t3, 0 # se t3 for maior que zero, coloca o valor dele como 0
    addi t3, zero, 2; # t3 = zero + imm
    # y eh o valor guardado em s0
    # palpite inicial : k = y / 2
    div s1, s0, t3 #guarda o palpite k1 em s1
    div s5, s2, t3 #guarda o palpite k2 em s5
    div s6, s3, t3 #guarda o palpite k3 em s6
    div s7, s4, t3 #guarda o palpite k4 em s7
    jal ra, iteracoes #fazer o loop de 10 iteracoes


inteirar:
    la t2, input_adress #carrego o endereco da string na memoria
    #a string na memoria eh do tipo 0x30303030
    addi t6, zero, 1 #colocar o valor 1 em t6
    addi a2, zero, 10 #colocar o valor 10 em a2
    addi s0, zero, 0
    
    #quarto digito
    lbu t3, 3(t2) # carrego o quarto byte em t3 
    addi t4, t3, -48 # subtraio 48 para sair de ascii e ir para inteiro e coloco em t4
    mul t5, t4, t6
    add s0, t5, s0; # t0 = t1 + imm
    
    #terceiro digito
    lbu t3, 2(t2)
    addi t4, t3, -48
    mul t5, t4, a2
    add s0, t5, s0

    #segundo digito
    lbu t3, 1(t2)
    addi t4, t3, -48
    mul a3, a2, a2
    mul t5, t4, a3
    add s0, t5, s0

    #primeiro digito
    lbu t3, 0(t2)
    addi t4, t3, -48
    mul a4, a3, a2
    mul t5, t4, a4
    add s0, t5, s0
    #----------------------------------------------------------------------------------------------------------------------#
    addi s2, zero, 0
    #quarto digito
    lbu t3, 8(t2) # carrego o quarto byte em t3 
    addi t4, t3, -48 # subtraio 48 para sair de ascii e ir para inteiro e coloco em t4
    mul t5, t4, t6
    add s2, t5, s2; # t0 = t1 + imm
    
    #terceiro digito
    lbu t3, 7(t2)
    addi t4, t3, -48
    mul t5, t4, a2
    add s2, t5, s2

    #segundo digito
    lbu t3, 6(t2)
    addi t4, t3, -48
    mul a3, a2, a2
    mul t5, t4, a3
    add s2, t5, s2

    #primeiro digito
    lbu t3, 5(t2)
    addi t4, t3, -48
    mul a4, a3, a2
    mul t5, t4, a4
    add s2, t5, s2

    #---------------------------------------------------------------------------------------------------------
    addi s3, zero, 0
    #quarto digito
    lbu t3, 13(t2) # carrego o quarto byte em t3 
    addi t4, t3, -48 # subtraio 48 para sair de ascii e ir para inteiro e coloco em t4
    mul t5, t4, t6
    add s3, t5, s3; # t0 = t1 + imm
    
    #terceiro digito
    lbu t3, 12(t2)
    addi t4, t3, -48
    mul t5, t4, a2
    add s3, t5, s3

    #segundo digito
    lbu t3, 11(t2)
    addi t4, t3, -48
    mul a3, a2, a2
    mul t5, t4, a3
    add s3, t5, s3

    #primeiro digito
    lbu t3, 10(t2)
    addi t4, t3, -48
    mul a4, a3, a2
    mul t5, t4, a4
    add s3, t5, s3

    #---------------------------------------------------------------------------------------------------------------
    addi s4, zero, 0
    #quarto digito
    lbu t3, 18(t2) # carrego o quarto byte em t3 
    addi t4, t3, -48 # subtraio 48 para sair de ascii e ir para inteiro e coloco em t4
    mul t5, t4, t6
    add s4, t5, s4; # t0 = t1 + imm
    
    #terceiro digito
    lbu t3, 17(t2)
    addi t4, t3, -48
    mul t5, t4, a2
    add s4, t5, s4

    #segundo digito
    lbu t3, 16(t2)
    addi t4, t3, -48
    mul a3, a2, a2
    mul t5, t4, a3
    add s4, t5, s4

    #primeiro digito
    lbu t3, 15(t2)
    addi t4, t3, -48
    mul a4, a3, a2
    mul t5, t4, a4
    add s4, t5, s4

    ret
    #la t6, int_adress #carrego o endereco em que sera armazenado o inteiro em t6
    #sw s0, 0(t6) #armazeno o valor inteiro de s0 no endereco alocado para o inteiro 
    

iteracoes:
    beq t0, t1, transformar_em_string; # if t0 == t1 then target
    #fazer o algoritmo
    #dividir y por k (s0 por s1) e salvar em t2
    #somar t2 com k (s1) e guardar em t4
    #dividir t4 por 2 (t3) e guardar em s1 (novo k)

    divu t2, s0, s1
    add t4, t2, s1
    divu s1, t4, t3 

    #k2 eh o s5, y eh o s2
    divu t2, s2, s5
    add  t4, t2, s5
    divu s5, t4, t3

    #k3 eh o s6, y eh o s3
    divu t2, s3, s6
    add t4, t2, s6
    divu s6, t4, t3

    #k4 eh o s7, y eh o s4
    divu t2, s4, s7
    add t4, t2, s7
    divu s7, t4, t3

    addi t0, t0, 1 # t0 = t1 +mm #atualizar o contador
    jal ra, iteracoes
    
transformar_em_string:
    #s1 eh onde esta o resultado da aproximacao
    la t2, input_adress #carrego o endereco da string em t2
    addi t3, zero, 10

    remu t0, s1, t3 #pega o resto da divisao de s1 por 10 (t3) e armazena em t0
    addi t0, t0, 48 #adiciona 48 em t0 para transformar em ascii
    sb t0, 3(t2) #guardo o caractere menos significativo no primeiro  
    div s1, s1, t3 #atualizo o valor de s1

    remu t0, s1, t3 #pega o resto da divisao de s1 por 10 (t3) e armazena em t0
    addi t0, t0, 48 #adiciona 48 em t0 para transformar em ascii
    sb t0, 2(t2) #guardo o caractere menos significativo no primeiro  
    div s1, s1, t3 #atualizo o valor de s1

    remu t0, s1, t3 #pega o resto da divisao de s1 por 10 (t3) e armazena em t0
    addi t0, t0, 48 #adiciona 48 em t0 para transformar em ascii
    sb t0, 1(t2) #guardo o caractere menos significativo no primeiro  
    div s1, s1, t3 #atualizo o valor de s1

    remu t0, s1, t3 #pega o resto da divisao de s1 por 10 (t3) e armazena em t0
    addi t0, t0, 48 #adiciona 48 em t0 para transformar em ascii
    sb t0, 0(t2) #guardo o caractere menos significativo no primeiro  

#-----------------------------------------------------------------------------------------------------------------
    remu t0, s5, t3 #pega o resto da divisao de s1 por 10 (t3) e armazena em t0
    addi t0, t0, 48 #adiciona 48 em t0 para transformar em ascii
    sb t0, 8(t2) #guardo o caractere menos significativo no primeiro  
    div s5, s5, t3 #atualizo o valor de s1

    remu t0, s5, t3 #pega o resto da divisao de s1 por 10 (t3) e armazena em t0
    addi t0, t0, 48 #adiciona 48 em t0 para transformar em ascii
    sb t0, 7(t2) #guardo o caractere menos significativo no primeiro  
    div s5, s5, t3 #atualizo o valor de s1

    remu t0, s5, t3 #pega o resto da divisao de s1 por 10 (t3) e armazena em t0
    addi t0, t0, 48 #adiciona 48 em t0 para transformar em ascii
    sb t0, 6(t2) #guardo o caractere menos significativo no primeiro  
    div s5, s5, t3 #atualizo o valor de s1

    remu t0, s5, t3 #pega o resto da divisao de s1 por 10 (t3) e armazena em t0
    addi t0, t0, 48 #adiciona 48 em t0 para transformar em ascii
    sb t0, 5(t2) #guardo o caractere menos significativo no primeiro  

#-----------------------------------------------------------------------------------------------------------------------
    remu t0, s6, t3 #pega o resto da divisao de s1 por 10 (t3) e armazena em t0
    addi t0, t0, 48 #adiciona 48 em t0 para transformar em ascii
    sb t0, 13(t2) #guardo o caractere menos significativo no primeiro  
    div s6, s6, t3 #atualizo o valor de s1

    remu t0, s6, t3 #pega o resto da divisao de s1 por 10 (t3) e armazena em t0
    addi t0, t0, 48 #adiciona 48 em t0 para transformar em ascii
    sb t0, 12(t2) #guardo o caractere menos significativo no primeiro  
    div s6, s6, t3 #atualizo o valor de s1

    remu t0, s6, t3 #pega o resto da divisao de s1 por 10 (t3) e armazena em t0
    addi t0, t0, 48 #adiciona 48 em t0 para transformar em ascii
    sb t0, 11(t2) #guardo o caractere menos significativo no primeiro  
    div s6, s6, t3 #atualizo o valor de s1

    remu t0, s6, t3 #pega o resto da divisao de s1 por 10 (t3) e armazena em t0
    addi t0, t0, 48 #adiciona 48 em t0 para transformar em ascii
    sb t0, 10(t2) #guardo o caractere menos significativo no primeiro  

#----------------------------------------------------------------------------------------------------------
    remu t0, s7, t3 #pega o resto da divisao de s1 por 10 (t3) e armazena em t0
    addi t0, t0, 48 #adiciona 48 em t0 para transformar em ascii
    sb t0, 18(t2) #guardo o caractere menos significativo no primeiro  
    div s7, s7, t3 #atualizo o valor de s1

    remu t0, s7, t3 #pega o resto da divisao de s1 por 10 (t3) e armazena em t0
    addi t0, t0, 48 #adiciona 48 em t0 para transformar em ascii
    sb t0, 17(t2) #guardo o caractere menos significativo no primeiro  
    div s7, s7, t3 #atualizo o valor de s1

    remu t0, s7, t3 #pega o resto da divisao de s1 por 10 (t3) e armazena em t0
    addi t0, t0, 48 #adiciona 48 em t0 para transformar em ascii
    sb t0, 16(t2) #guardo o caractere menos significativo no primeiro  
    div s7, s7, t3 #atualizo o valor de s1

    remu t0, s7, t3 #pega o resto da divisao de s1 por 10 (t3) e armazena em t0
    addi t0, t0, 48 #adiciona 48 em t0 para transformar em ascii
    sb t0, 15(t2) #guardo o caractere menos significativo no primeiro  
    
    jal ra, write


    

