.globl puts, gets, atoi, itoa, time, sleep, approx_sqrt, getPosition, imageFilter, exit
.data
#buffer: .skip 100

.text
write:
  #li a0, 1            # file descriptor = 1 (stdout)
  #la a1, input_adress    # buffer
  #li a2, 20         # size
  li a7, 64           # syscall write (64)
  ecall
  ret

read:
    #li a0, 0
    #la a1, buffer #  buffer
    #li a2, 300000 # size (lendo apenas 1 byte, mas tamanho é variável)
    li a7, 63 # syscall read (63)
    ecall
    ret

puts: #a0: endereco da string
  addi sp, sp, -16
  sw ra, 0(sp)
  sw a0, 4(sp)
  jal calcular_tamanho_string
  #parametros para write
  mv a2, a0 #tamanho
  li a0, 1  #stdout
  lw a1, 4(sp)  #buffer  
  jal write
  li t0, '\n'
  sb t0, 8(sp)
  #parametros para write
  addi a1, sp, 8  #endereco do \n na pilha
  li a2, 1
  li a0, 1
  jal write
  lw ra, 0(sp)  #recupera ra
  addi sp, sp, 16 #desaloca a pilha
  li a0, 1
  ret

calcular_tamanho_string:
  #percorrer a numero enquanto posicao != \0 (ascii 0)
  li t0, 0
  lbu t1, 0(a0)   #t1 = primeiro caractere
  li t2, 0 #condicao de parada
  while1:
  beq t1, t2, contou1 # se o byte carregado for \0, para o loop
  addi t0, t0, 1
  add t1, t0, a0 #endereco do proximo algarismo em t1
  lbu t1, 0(t1)  #carrega o algarismo em t1
  j while1

  contou1:
  mv a0, t0 #t4 = numero de algarismos -> a0
  ret


gets:#a0: endereco da string
  addi sp, sp, -16
  sw ra, 0(sp)
  sw a0, 4(sp)
  #parametros do read
  mv a1, a0
  li a2, 1
  li a0, 0
  jal read
  lb t0, 0(a1)
  li t1, '\n' #condicao de parada
  li t2, 1
  li t4, 0
  while3:
  beq t0, t1, fim_get # if t0 == \n then fim_get
  #beq t0, t4, fim_get # if t0 == \0 then fim_get
  add a1, a1, t2
  li a0, 0
  li a2, 1
  jal read
  li a0, 0
  lb t0, 0(a1)
  j while3
  fim_get:
  li t3, 0  #adicionar o \0 no final
  sb t3, 0(a1)
  lw ra, 0(sp)
  lw a0, 4(sp)
  addi sp, sp, 16
  ret

calcular_tamanho_numero:#a0 = endereco da numero
    #percorrer a numero enquanto posicao != \0 (ascii 0)
    #se a posicao [0] for - (ascii 45) desconsiderar
    li t0, 0
    lbu t1, 0(a0)   #t1 = primeiro caractere
    li t2, 0 #condicao de parada
    li t3, 45 #sinal de negativo
    li t4, 0 #contador de algarismos
    while:
    beq t1, t2, contou # se o byte carregado for \0, para o loop
    beq t1, t3, pular_sinal; # se for sinal de negativo pulo sem adicionar na contagem
    addi t0, t0, 1
    addi t4, t4, 1
    add t1, t0, a0 #endereco do proximo algarismo em t1
    lbu t1, 0(t1)  #carrega o algarismo em t1
    j while

    pular_sinal:
    addi t0, t0, 1 
    add t1, t0, a0 
    lbu t1, 0(t1)  
    j while

    contou:
    mv a0, t4 #t4 = numero de algarismos -> a0
    ret

atoi:#a0: endereco do buffer
    addi sp, sp, -16
    sw ra, 0(sp)
    sw a0, 4(sp)
    jal calcular_tamanho_numero
    mv t0, a0 #numero de algarismos
    addi t1, t0, -1 #t1 = potencia de 10 do maior algarismo
    lw a0, 4(sp) #recuperar o endereco da numero
    li t2, 0 #i
    li t3, 1
    li t4, 10

    for:
    bge t2, t1, potencia_max_calculada
    mul t3, t4, t3
    addi t2, t2, 1
    j for
    
    potencia_max_calculada: #t3 max potencia
    li t2, 0 #condicao de parada
    li t4, 45 #verificador do sinal
    li t5, 0 #guardara o resultado final
    lb t0, 0(a0)
    li t6, 1
    li a2, 10
    while2: #enquanto algarismo != \0 (ascii 0) continuar
    beq t0, t2, inteirou # if t0 == 0 then inteirou
    beq t0, t4, primeiro_negativo #se o algarismo for -, 
    addi t0, t0, -48 #transformo o caractere em inteiro
    mul t0, t0, t3 #multiplico pela respectiva potencia
    divu t3, t3, a2
    add t5, t0, t5 #somo
    addi a0, a0, 1
    lbu t0, 0(a0)
    j while2

    primeiro_negativo: #ir para o proximo
    addi a0, a0, 1
    lbu t0, 0(a0)
    li t6, -1
    j while2

    inteirou:
    mul t5, t6, t5 #se o numero era negativo, t6 sera -1
    lw ra, 0(sp)
    addi sp, sp, 16
    mv a0, t5
    ret


itoa: #a0 = numero #a1 endereco de armazenamento   a2: base
  #verificar se o numero eh menor que zero
  mv a3, a1
  addi sp, sp, -48
  li t0, 10
  li t2, 0
  bne a2, t0, cont # if base != 10 considerar diretamente unsigned
  
  verificar_sinal_base_10:
  li t0, 0
  bge a0, t0, cont # if numero_base_10 >= 0 then considerar sem sinal
  li t0, -1
  mul a0, t0, a0
  li t2, 45

  #algoritmo
  #Para cada algarismo
  #Guarda o resto da divisao do numero por 10
  #soma 48 nesse resto pra transformar em string
  #divide o numero por 10
  cont:
  li t0, 0
  li t1, 0
  li a6, 10
  while_itoa:
  beq a0, t0, endereco_ultimo_caractere_guardado # if x==0 terminou de transformar em string
  remu t4, a0, a2 #t4 = x % base
  blt t4, a6, pular_soma_caractere # if numero < 10 then target
  addi t4, t4, 39
  pular_soma_caractere:
  addi t4, t4, 48 #transformar em caractere
  divu a0, a0, a2 # x = x / base
  add t5, sp, t1 #local de armazenamento = sp + t1
  sb t4, 0(t5)
  addi t1, t1, 1  #atualiza o contador
  j while_itoa

  endereco_ultimo_caractere_guardado:
  li t6, 45
  li t4, 0  #contador de inicio para transferencia
  bne t2, t6, transf_from_stack_to_string #se o numero nao for um base 10 negativo
  #se for um base 10 negativo
  sb t2, 0(a3) #coloca o sinal de negativo 
  li t4, 1  #comeco a contar dps do primeiro byte
  
  transf_from_stack_to_string:
  addi t1, t1, -1 
  add t5, sp, t1  #endereco do ultimo caractere guardado na pilha pelo algoritmo
  li t2, 0  #condicao
  while_transfer:
  blt t1, t2, encerrar # if t1 < 0 transferiu para o endereco
  lb t3, 0(t5)  #carrega o caractere em t3
  add t5, a3, t4  #carrega o endereco de armazenamento do byte
  sb t3, 0(t5) #guardo o byte
  addi t4, t4, 1  #atualizo o contador do endereco
  addi t1, t1, -1
  add t5, sp, t1  #atualizo o endereco da pilha
  j while_transfer


  encerrar:
  li t0, 0
  add t5, a3, t4
  sb t0, 0(t5) # 
  addi sp, sp, 48
  mv a0, a1
  ret



time:
  addi sp, sp, -32
  sw ra, 28(sp)
  mv a0, sp
  li a1, 0
  li a7, 169 # chamada de sistema gettimeofday
  ecall
  mv a0, sp 
  lw t1, 0(a0) # tempo em segundos
  lw t2, 8(a0) # fração do tempo em microssegundos
  li t3, 1000
  mul t1, t1, t3
  div t2, t2, t3
  add a0, t2, t1
  lw ra, 28(sp)
  addi sp, sp, 32
  ret

sleep:
  addi sp, sp, -32
  sw ra, 0(sp)
  sw a0, 4(sp)
  jal time  #tempo inicial em milissegundos em a0
  mv a1, a0 #move o tempo inicial para a1
  lw a0, 4(sp)  #tempo de espera em a0
  sw s0, 8(sp)
  add s0, a1, a0  #tempo inicial mais espera desejada
  jal time
  wait_for_time:  #executar enquanto time !=  tempo incial mais espera desejada
  beq a0, s0, sleepou # if t0 == t1 then sleepou
  jal time
  j wait_for_time
  
  sleepou:
  lw ra, 0(sp)
  lw s0, 8(sp)
  ret

approx_sqrt: #parametro : y = a0 e n_iteraoes = a1
  #estimativa inicial: k = y / 2 -> k = t2
  srli t2, a0, 1
  #for (int i = 0; i < 12; i++)
    #k = (k + y/k)/2
  li t0, 0 #i
  mv t1, a1 #t1 = n_iteracoes
  for4:
  bge t0, t1, devolver_raiz # if i >= 12 then target
  divu t3, a0, t2 #t3 = y/k
  add t3, t3, t2  # t3 = (y/k) + k
  srli t2, t3, 1  # k = (y/k + k)/2
  addi t0, t0, 1
  j for4

  devolver_raiz:
  mv a0, t2
  ret 



getPosition: #a0: endereco de x, a1: endereco de y, a2: Yb, a3: Xc, a4: Ta, a5: Tb, a6: Tc, a7, Tr
  addi sp, sp, -48
  sw ra, 0(sp)
  sw s0, 4(sp)
  sw s1, 8(sp)
  sw s2, 12(sp)
  sw s3, 16(sp)
  sw s4, 20(sp)
  sw s11, 24(sp)
  sw a0, 28(sp)
  sw a1, 32(sp)

  #da:
  mv a0, a7 #a0 = Tr
  mv a1, a4
  jal calcular_distancia  #da em a0
  mv s0, a0
  #db:
  mv a0, a7
  mv a1, a5
  jal calcular_distancia  #db em a0
  mv s1, a0
  #dc:
  mv a0, a7
  mv a1, a6
  jal calcular_distancia  #dc em a0
  mv s2, a0

  mv s3, a2 #s3 = Yb
  mv s4, a3 #s4 = Xc

  #Algoritmo
  mul s0, s0, s0 #elevar da ao quadrado
  mv t0, s3 #t0 = Yb
  mul s3, s3, s3 #elevar Yb ao quadrado
  mul s1, s1, s1 #elevar db ao quadrado

  #y = (da²+Yb²-db²)/2Yb
  add t1, s0, s3 #t1 = da² + Yb²
  sub t1, t1, s1 #t1 = da² + Yb² - db²

  li t6, 2 #carrega t6 com 2
  mul t2, t0, t6 #t2 = Yb * 2

  div a1, t1, t2 #y = (da² + Yb² - db²)/Yb * 2
  #GUARDAR O Y NO ENDERECO DESEJADO
  lw t6, 32(sp) #endereco de y em t6
  sw a1, 0(t6)

  CALCULO_DO_X:
  mul t3, a1, a1 #t3 = y²
  sub a0, s0, t3 #a0 = (da²-y²)
  li a1, 20
  sw t3, 36(sp)
  jal approx_sqrt #a0 = sqrt(da²-y²)
  lw t3, 36(sp)
  mv s11, a0 #x = sqrt(da²-y²)
  li t1, -1
  mul s11, s11, t1 #s11 = -sqrt(da²-y²)
  
  #agora, devemos verificar se a0 ou se s11 se aproxima mais do resultado
  #(x - Xc)² + y² = dc²
  #Primeiro para a0
  sub t2, a0, s4 #t2 = x1 - Xc
  mul t2, t2, t2 #t2 = (x1 - Xc)²
  add t2, t3, t2 # t2 = (x1 - Xc)²+y²
  mul s2, s2, s2 #s2 = dc²
  sub t2, t2, s2 #t2 = (x1 - Xc)²+y² - dc²
  bge t2, zero, calculeix1
  mul t2, t1, t2
  calculeix1:

  #Segundo para s11
  sub t4, s11, s4 #t4 = x2 - Xc
  mul t4, t4, t4 #t4 = (x2 - Xc)²
  add t4, t3, t4 #t4 =(x2 - Xc)²+y²
  sub t4, t4, s2 # t4 = (x2 - Xc)²+y² - dc²
  bge t4, zero, aqui
  mul t4, t1, t4

  aqui:
  blt t2, t4, retornar_coordendas # if t2 < t4 then target
  #se t2 > t4
  mv a0, s11
  
  retornar_coordendas:
  lw t6, 28(sp)
  sw a0, 0(t6)  #GUARDAR O X FINAL NO ENDERECO DESEJADO
  a:
  lw ra, 0(sp)
  lw s0, 4(sp)
  lw s1, 8(sp)
  lw s2, 12(sp)
  lw s3, 16(sp)
  lw s4, 20(sp)
  lw s11, 24(sp)
  addi sp, sp, 48
  ret


calcular_distancia: #T1 em a0, T2 em a1
  #deltaT = T1 - T2  -> registrador t0
  sub t0, a0, a1
  #multiplicar por 3 e dividir por 10 ( delta t * v )
  li t1, 10
  li t3, 3
  mul t0, t0, t3 #multiplica por 3
  divu t0, t0, t1 #divide por 10
  mv a0, t0 #devolve a distancia em a0
  ret 

imageFilter:  #a0: endereco do inicio da matriz, a1: width, a2: height, a3: endereco do filter[3][3]
  #CALCULA PARA TAMANHO DE ARMAZENAMENTO DA MATRIZ NA PILHA -> hw + 16 - (hw % 16)
  mul t0, a1, a2  #t0 = hw
  addi t1, t0, 16 #t1 = hw + 16
  li t2, 16
  remu t3, t0, t2 #t3 = hm % 16
  sub t0, t1, t3  #t0 = hw + 16 - (hw % 16)
  sub sp, sp, t0

  mv a3, a0
  
  li t0, 0 #i
  mv t1, a2 #t1 = y

  li t2, 0 #j
  mv t3, a1

  li t4, 0 #posicao no buffer
  for_i_copia:
  bge t0, t1, final_for_i_copia # if i >= y terminou

  for_j_copia:
  bge t2, t3, final_for_j_copia # if j >= x proxima linha

  mv a0, t2 #posicao x do pixel na matriz (parametro da funcao setpixel)
  mv a1, t0 #posicao y do pixel na matriz (parametro da funcao setpixel)

  addi t2, t2, 1 #atualiza o j (x)
  j for_j_copia
  final_for_j_copia:
  addi t0, t0, 1 #atualizo o i (y)
  li t2, 0 #volto o j para zero
  j for_i_copia

  final_for_i_copia:
















  for_i:
  bge t0, t1, final_for_i # if i >= y terminou

  for_j:
  bge t2, t3, final_for_j # if j >= x proxima linha
  #fazer operacoes
  #lbu s6, 0(s5) #s6 = Guarda o pixel
  mv a0, t2 #posicao x do pixel na matriz (parametro da funcao setpixel)
  mv a1, t0 #posicao y do pixel na matriz (parametro da funcao setpixel)
  #verificar se esta na borda:
  #se esta na borda setar cor preta
  #condicao para estar na borda: t2 = 0 ou t2 = t3 - 1 (ultima coluna) ou t0 = 0 ou t0 = t1 - 1 (ultima linha)
  addi a4, t3, -1 # a4 = t3 - 1
  beq a4, t2, borda # if t2 == t3 - 1 entao eh borda
  li t5, 0
  beq t2, t5, borda # if t2 == 0 entao eh borda 
  beq t0, t5, borda # if t0 == 0 entao eh borda
  addi a4, t1, -1; # t0 = t1 + imm
  beq t0, a4, borda # if t0 = t1 -1
  
  #se passar por aqui eh pq nao eh borda
  #utilizar da filtragem
  #temos que encontrar quais pixels da matriz serao utilizados -> Matriz[i + k - 1][j+q-1] -> t4 = [i + k - 1] * (numero de colunas) + [j+q-1]
  #t1 = y t3 = x || t0 = i, t2 = j
  li t4, 0 #armazenara o offset do inicio da matriz
  li a5, 0 #armazenara a soma dos valores
  #para k = 0 q = 0
  li a4, -1   #valor de w[k][q] em a4
  addi t4, t0, 0  #t4 = i + k
  addi t4, t4, -1 #t4 = i + k - 1
  mul t4, t4, t3  #t4 =  (i + k - 1) * x         x = numero de colunas
  add t4, t4, t2 #t4 =  ((i + k - 1) * x) + j
  addi t4, t4, 0 #t4 =  ((i + k - 1) * x) + j + q
  addi t4, t4, -1 #t4 =  ((i + k - 1) * x) + j + q -1
  add s5, a3, t4 #guarda o endereco do pixel da vez em s5
  lbu s6, 0(s5) #s6 = Guarda o pixel
  mul s6, s6, a4 #s6 = Matriz[i + k - 1][j+q-1] * w[k][q]
  add a5, s6, a5
  #------------------------------------------------------------------------------------------------------------------------------

  li t4, 0 #armazenara o valor da matriz
  #para k = 0 q = 1
  li a4, -1   #valor de w[k][q] em a4
  addi t4, t0, 0  #t4 = i + k
  addi t4, t4, -1 #t4 = i + k - 1
  mul t4, t4, t3  #t4 =  (i + k - 1) * x         x = numero de colunas
  add t4, t4, t2 #t4 =  ((i + k - 1) * x) + j
  addi t4, t4, 1 #t4 =  ((i + k - 1) * x) + j + q
  addi t4, t4, -1 #t4 =  ((i + k - 1) * x) + j + q -1
  add s5, a3, t4 #guarda o endereco do pixel da vez em s5
  lbu s6, 0(s5) #s6 = Guarda o pixel
  mul s6, s6, a4 #s6 = Matriz[i + k - 1][j+q-1] * w[k][q]
  add a5, s6, a5
  #------------------------------------------------------------------------------------------------------------------------------

  li t4, 0 #armazenara o valor da matriz
  #para k = 0 q = 2
  li a4, -1   #valor de w[k][q] em a4
  addi t4, t0, 0  #t4 = i + k
  addi t4, t4, -1 #t4 = i + k - 1
  mul t4, t4, t3  #t4 =  (i + k - 1) * x         x = numero de colunas
  add t4, t4, t2 #t4 =  ((i + k - 1) * x) + j
  addi t4, t4, 2 #t4 =  ((i + k - 1) * x) + j + q
  addi t4, t4, -1 #t4 =  ((i + k - 1) * x) + j + q -1
  add s5, a3, t4 #guarda o endereco do pixel da vez em s5
  lbu s6, 0(s5) #s6 = Guarda o pixel
  mul s6, s6, a4 #s6 = Matriz[i + k - 1][j+q-1] * w[k][q]
  add a5, s6, a5
  #------------------------------------------------------------------------------------------------------------------------------

  li t4, 0 #armazenara o valor da matriz
  #para k = 1 q = 0
  li a4, -1   #valor de w[k][q] em a4
  addi t4, t0, 1  #t4 = i + k
  addi t4, t4, -1 #t4 = i + k - 1
  mul t4, t4, t3  #t4 =  (i + k - 1) * x         x = numero de colunas
  add t4, t4, t2 #t4 =  ((i + k - 1) * x) + j
  addi t4, t4, 0 #t4 =  ((i + k - 1) * x) + j + q
  addi t4, t4, -1 #t4 =  ((i + k - 1) * x) + j + q -1
  add s5, a3, t4 #guarda o endereco do pixel da vez em s5
  lbu s6, 0(s5) #s6 = Guarda o pixel
  mul s6, s6, a4 #s6 = Matriz[i + k - 1][j+q-1] * w[k][q]
  add a5, s6, a5
  #------------------------------------------------------------------------------------------------------------------------------

  li t4, 0 #armazenara o valor da matriz
  #para k = 1 q = 1
  li a4, 8   #valor de w[k][q] em a4
  addi t4, t0, 1  #t4 = i + k
  addi t4, t4, -1 #t4 = i + k - 1
  mul t4, t4, t3  #t4 =  (i + k - 1) * x         x = numero de colunas
  add t4, t4, t2 #t4 =  ((i + k - 1) * x) + j
  addi t4, t4, 1 #t4 =  ((i + k - 1) * x) + j + q
  addi t4, t4, -1 #t4 =  ((i + k - 1) * x) + j + q -1
  add s5, a3, t4 #guarda o endereco do pixel da vez em s5
  lbu s6, 0(s5) #s6 = Guarda o pixel
  mul s6, s6, a4 #s6 = Matriz[i + k - 1][j+q-1] * w[k][q]
  add a5, s6, a5
#------------------------------------------------------------------------------------------------------------------------------

  li t4, 0 #armazenara o valor da matriz
  #para k = 1 q = 2
  li a4, -1   #valor de w[k][q] em a4
  addi t4, t0, 1  #t4 = i + k
  addi t4, t4, -1 #t4 = i + k - 1
  mul t4, t4, t3  #t4 =  (i + k - 1) * x         x = numero de colunas
  add t4, t4, t2 #t4 =  ((i + k - 1) * x) + j
  addi t4, t4, 2 #t4 =  ((i + k - 1) * x) + j + q
  addi t4, t4, -1 #t4 =  ((i + k - 1) * x) + j + q -1
  add s5, a3, t4 #guarda o endereco do pixel da vez em s5
  lbu s6, 0(s5) #s6 = Guarda o pixel
  mul s6, s6, a4 #s6 = Matriz[i + k - 1][j+q-1] * w[k][q]
  add a5, s6, a5
#------------------------------------------------------------------------------------------------------------------------------

  li t4, 0 #armazenara o valor da matriz
  #para k = 2 q = 0
  li a4, -1   #valor de w[k][q] em a4
  addi t4, t0, 2  #t4 = i + k
  addi t4, t4, -1 #t4 = i + k - 1
  mul t4, t4, t3  #t4 =  (i + k - 1) * x         x = numero de colunas
  add t4, t4, t2 #t4 =  ((i + k - 1) * x) + j
  addi t4, t4, 0 #t4 =  ((i + k - 1) * x) + j + q
  addi t4, t4, -1 #t4 =  ((i + k - 1) * x) + j + q -1
  add s5, a3, t4 #guarda o endereco do pixel da vez em s5
  lbu s6, 0(s5) #s6 = Guarda o pixel
  mul s6, s6, a4 #s6 = Matriz[i + k - 1][j+q-1] * w[k][q]
  add a5, s6, a5
#------------------------------------------------------------------------------------------------------------------------------
  li t4, 0 #armazenara o valor da matriz
  #para k = 2 q = 1
  li a4, -1   #valor de w[k][q] em a4
  addi t4, t0, 2  #t4 = i + k
  addi t4, t4, -1 #t4 = i + k - 1
  mul t4, t4, t3  #t4 =  (i + k - 1) * x         x = numero de colunas
  add t4, t4, t2 #t4 =  ((i + k - 1) * x) + j
  addi t4, t4, 1 #t4 =  ((i + k - 1) * x) + j + q
  addi t4, t4, -1 #t4 =  ((i + k - 1) * x) + j + q -1
  add s5, a3, t4 #guarda o endereco do pixel da vez em s5
  lbu s6, 0(s5) #s6 = Guarda o pixel
  mul s6, s6, a4 #s6 = Matriz[i + k - 1][j+q-1] * w[k][q]
  add a5, s6, a5
#------------------------------------------------------------------------------------------------------------------------------

  li t4, 0 #armazenara o valor da matriz
  #para k = 2 q = 2
  li a4, -1   #valor de w[k][q] em a4
  addi t4, t0, 2  #t4 = i + k
  addi t4, t4, -1 #t4 = i + k - 1
  mul t4, t4, t3  #t4 =  (i + k - 1) * x         x = numero de colunas
  add t4, t4, t2 #t4 =  ((i + k - 1) * x) + j
  addi t4, t4, 2 #t4 =  ((i + k - 1) * x) + j + q
  addi t4, t4, -1 #t4 =  ((i + k - 1) * x) + j + q -1
  add s5, a3, t4 #guarda o endereco do pixel da vez em s5
  lbu s6, 0(s5) #s6 = Guarda o pixel
  mul s6, s6, a4 #s6 = Matriz[i + k - 1][j+q-1] * w[k][q]
  add a5, s6, a5

  #a5 armazena o valor do pixel
  #verificar se eh negativo ou maior que 255
  li t4, 0
  blt a5, t4, setar_pixel_0 # if a5 < 0 then target
  li t4, 255
  bgt a5, t4, setar_pixel_255 # if a5 > 255 then target
  
  j manipular_pixel
  
  setar_pixel_0:
  li a5, 0
  j manipular_pixel


  setar_pixel_255:
  li a5, 255


  manipular_pixel:
  #arrumar pixel
  slli s7, a5, 24 #s7 = R
  slli s8, a5, 16 #s8 = G
  slli s9, a5, 8 #s9 = B
  li a5, 255 #s6 = alpha 
  li a2, 0 #a2 armazenara o resultado (cor do pixel)
  or a2, s7, a2
  or a2, s8, a2
  or a2, s9, a2
  or a2, a5, a2
  
  borda:
  li a2, 0x000000FF #preto

  setar_pixel:
  #ATRIBUIR PARA O PIXEL DA MATRIZ

  addi t2, t2, 1 #atualiza o j (x)
  j for_j
  final_for_j:
  addi t0, t0, 1 #atualizo o i (y)
  li t2, 0 #volto o j para zero
  j for_i

  final_for_i:
  mv ra, s11
  ret


exit: 
    li a0, 0
    li a7, 93
    ecall

