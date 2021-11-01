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
    a:
    jal calcular_tamanho_numero
    mv t0, a0 #numero de algarismos
    addi t1, t0, -1 #t1 = potencia de 10 do maior algarismo
    lw a0, 4(sp) #recuperar o endereco da numero
    d:
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
    c:
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
    b:
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
ret

sleep:
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


getPosition:
ret

imageFilter:
ret

# s_start:
#   la a0, buffer
#   jal gets
#   la a0, buffer
#   jal atoi
#   mv s0, a0
#   la a0, buffer
#   jal puts
#   la a0, buffer
#   jal gets
#   la a0, buffer
#   jal puts

exit: 
    li a0, 0
    li a7, 93
    ecall

