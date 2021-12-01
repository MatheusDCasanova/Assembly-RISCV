/*
  Self Driving Car Application Programming Interface
*/
##ifndef API_CAR_H
##define API_CAR_H
/******************************************************************************/
/*  MOTORES                                                                   */
/******************************************************************************/
.globl set_motor, set_handbreak, approx_sqrt, sleep, itoa, atoi, gets, puts, display_image, filter_1d_image, get_time, get_rotation, get_position, read_sensor_distance, read_camera

.text
/*
  Define os valores para o deslocamento vertical e horizontal do carro.
  Paramêtros:
  * vertical:   um byte que define o deslocamento vertical, entre -1 e 1.
                Valor -1 faz o carro andar para trás e 1 para frente
  * horizontal: define o valor para o deslocamento horizontal, entre -127 e 127.
                Valores negativos gera deslocamento para a direita e positivos
                para a esquerda.
  Retorna:
  * 0 em caso de sucesso.
  * -1 caso algum parametro esteja fora de seu intervalo.
*/

set_motor:  #a0: sentido do deslocamento    #a1: angulo do volante
    li a7, 10
    ecall
    #a0 possui o resultado (sucesso ou falha)
    ret
/*
  Aciona o freio de mão do carro.
  Paramêtros:
  * valor:  um byte que define se o freio será acionado ou não.
            1 para acionar o freio e 0 para não acionar.
  Retorna:
  * 0 em caso de sucesso.
  * -1 caso algum parametro esteja fora de seu intervalo .
*/

set_handbreak:
    li a7, 11
    ecall
    ret

/******************************************************************************/
/*  SENSORES                                                                  */
/******************************************************************************/

/*
  Lê os valores da camera de linha.
  Paramêtros:
  * img:  endereço de um vetor de 256 elementos que armazenará os
          valores lidos da camera de linha.
  Retorna:
    Nada
*/

read_camera:
    li a7, 12
    ecall
    ret

/*
  Lê a distancia do sensor ultrasônico
  Paramêtros:
    Nenhum
  Retorna:
    O inteiro com a distância do sensor, em centímetros.
*/

read_sensor_distance:
    li a7, 13
    ecall
    ret

/*
  Lê a posição aproximada do carro usano um dispositivo de GPS
  Parametros:
  * x:  endereço da variável que armazenará o valor da posição x
  * y:  endereço da variável que armazenará o valor da posição y
  * z:  endereço da variável que armazenará o valor da posição z
  Retorna:
    Nada
*/

get_position:
    li a7, 15
    ecall
    ret

/*
  Lê a rotação global do dispositivo de giroscópio
  Parametros:
  * x:  endereço da variável que armazenará o valor do angulo de Euler em x
  * y:  endereço da variável que armazenará o valor do angulo de Euler em y
  * z:  endereço da variável que armazenará o valor do angulo de Euler em z
  Retorna:
    Nada
*/

get_rotation:
    li a7, 16
    ecall
    ret


/******************************************************************************/
/*  TIMER                                                                     */
/******************************************************************************/

/*
  Lê o tempo do sistema
  Paramêtros:
    Nenhum
  Retorna:
    O tempo do sistema, em milisegundos.
*/

get_time:
    la t1, _system_time
    lw a0, 0(t1)
    ret

/******************************************************************************/
/*  Processamento de Imagem                                                   */
/******************************************************************************/

/*
  Filtra uma imagem unidimensional utilizando um filtro unidimensional (similar ao lab 6b, mas para apenas uma dimensão). 
  Paramêtros:
    img: array representando a imagem.
    filter: vetor de 3 posições representando o filtro 1D.
  Retorna:
    Nada
*/
filter_1d_image:  #a0: endereco do inicio do vetor #a1: endereco vetor filtro
  #alocar espaco para a copia na pilha
  addi sp, sp, -256

  li t0, 0 #i
  li t1, 256
  #copiar vetor para a pilha
  for_i_copiar_vetor:
    bge t0, t1, final_for_i_copia #percorrer o vetor
    add t2, t0, a0  #pegar o 
    lbu t2, 0(t2)    #pixel atual
    add t3, t0, sp #passar para    
    sb t2, 0(t3)    #a pilha
    addi t0, t0, 1  #atualizar contador
    j for_i_copiar_vetor
  final_for_i_copia:


  li t0, 0
  li t1, 256
  li t2, 0
  li t3, 255
  for_i_itera_vetor:  #para cada elemento de vetor, aplicar o filtro
    bge t0, t1, final_for_i_itera # if t0 >= t1 then target
    beq t0, t2, borda # if t0 == 0 then eh borda
    beq t0, t3, borda # if t0 == 255 then eh borda

    li a5, 0  #armazenara o resultado

    add a2, t0, sp   #pixel anterior
    lbu a2, -1(a2)    #armazenado em a2

    add a3, t0, sp  #pixel atual
    lbu a3, 0(a3)   #armazenado em a3

    add a4, t0, sp  #pixel posterior
    lbu a4, 1(a4)    #armazenado em a4
  
    lb t4, 0(a1)  #primeiro numero do filtro
    mul t5, t4, a2  #aplico o filtro no pixel anterior
    add a5, a5, t5  #somo no resultado

    lb t4, 1(a1)  #segundo elemento do filtro
    mul t5, t4, a3  #aplico o filtro no pixel atual
    add a5, a5, t5  #somo no resultado

    lb t4, 2(a1)  #terceiro elemento do filtro
    mul t5, t4, a4  #aplico o filtro no pixel posterior
    add a5, a5, t5  #somo no resultado

    #a5 armazena o valor do pixel
    #verificar se eh negativo ou maior que 255
    li t4, 0
    blt a5, t4, setar_pixel_0 # if a5 < 0 then target
    li t4, 255
    bgt a5, t4, setar_pixel_255 # if a5 > 255 then target
    
    j setar_pixel
    
    setar_pixel_0:
    li a5, 0
    j setar_pixel

    setar_pixel_255:
    li a5, 255
    j setar_pixel

    borda:
    li a5, 0

    setar_pixel:
    add t4, t0, a0  #posicao de armazenamento atual
    sb a5, 0(t4)

    addi t0, t0, 1  #atualiza contador
    j for_i_itera_vetor
  
  final_for_i_itera:
  addi sp, sp, 256
  ret


/*
  Mostra uma imagem 1D (1x256) no canvas. 
  Paramêtros:
    img: array representando a imagem.
  Retorna:
    Nada
*/

display_image:
    li a7, 19
    ecall
    ret


/*
  Para as funções abaixo, veja detalhes no Laboratório 7.
*/

puts: #a0: endereco da string
  #percorrer e ir escrevendo byte a byte ate encontrar o \0

  addi sp, sp, -16
  sw ra, 0(sp)
  mv a1, a0 #guardar endereco em a1

  jal calcular_tamanho_string
  add t0, a0, a1  #endereco do \0
  li t1, 10       #t1 = \n
  sb t1, 0(t0)    #\0 -> \n
  mv a2, a0
  addi a2, a2, 1
  li a0, 1      #stdout
  li a7, 18
  ecall

  li t1, 0
  sb t1, 0(t0)    #\n -> \0   

  li a0, 1  #return non negative value in case of success
  lw ra, 0(sp)
  addi sp, sp, 16
  ret

calcular_tamanho_string:
  #percorrer a numero enquanto posicao != \0 (ascii 0)
  li t0, 0
  lb t1, 0(a0)   #t1 = primeiro caractere
  li t2, 0 #condicao de parada
  while1:
  ble t1, t2, contou1 # se o byte casrregado for \0, para o loop
  addi t0, t0, 1
  add t1, t0, a0 #endereco do proximo algarismo em t1
  lb t1, 0(t1)  #carrega o algarismo em t1
  j while1

  contou1:
  mv a0, t0 #t4 = numero de algarismos -> a0
  ret

gets:#a0: endereco da string
  addi sp, sp, -16
  sw ra, 0(sp)
  sw a0, 4(sp)
  #parametros do read
  mv a1, a0 #buffer em a1
  li a2, 1  #size em a2
  li a0, 0  #stdin em a0
  li a7, 17 #syscall read
  ecall
  lb t0, 0(a1)
  li t1, 10 #condicao de parada
  li t2, 1
  li t4, 0
  while3:
  beq t0, t1, fim_get # if t0 == \n then fim_get
  beq t0, t4, fim_get # if t0 == \0 then fim_get
  add a1, a1, t2
  li a0, 0
  li a2, 1
  li a7, 17
  ecall
  li a0, 0
  lb t0, 0(a1)
  j while3
  fim_get:
  li t3, 0  #adicionar o \0 no final (coloca no lugar do \n que foi lido)
  sb t3, 0(a1)
  lw ra, 0(sp)
  lw a0, 4(sp)
  addi sp, sp, 16
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


itoa: #a0 = numero #a1 endereco de armazenamento   a2: base
  #verificar se o numero eh menor que zero
  mv a3, a1
  addi sp, sp, -48
  li t0, 10
  li t2, 0
  #verificar se o numero eh 0
  beq a0, t2, finalizar_0 # if numero == 0
  
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

  finalizar_0:
  li t0, 48
  sb t0, 0(a3)
  li t4, 1

  encerrar:
  li t0, 0
  add t5, a3, t4
  sb t0, 0(t5) # 
  addi sp, sp, 48
  mv a0, a1
  ret


sleep:
  addi sp, sp, -32
  sw ra, 0(sp)
  sw a0, 4(sp)  #guardar tempo de espera
  jal get_time  #tempo inicial em milissegundos em a0
  mv a1, a0 #move o tempo inicial para a1
  lw a0, 4(sp)  #recupera tempo de espera em a0
  add t0, a1, a0  #tempo inicial mais espera desejada
  jal get_time
  wait_for_time:  #executar enquanto time !=  tempo incial mais espera desejada
  bge a0, t0, sleepou 
  jal get_time
  j wait_for_time
  sleepou:
  lw ra, 0(sp)
  addi sp, sp, 32
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


##endif  /* API_CAR_H */
#api_car.h
#Exibindo api_car.h…