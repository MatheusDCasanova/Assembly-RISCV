.globl _start

.data
posicoes: .skip 0x0c  # buffer
tempos: .skip 0x14
#alocar os inteiros
Xc: .skip 0x04
Yb: .skip 0x04
Ta: .skip 0x04
Tb: .skip 0x04
Tc: .skip 0x04
Tr: .skip 0x04
da: .skip 0x04
db: .skip 0x04
dc: .skip 0x04
x:  .skip 0x06
y:  .skip 0x06

#VELOCIDADE DA LUZ = 3*10^8 m /s

.text
read:
    li a0, 0 # file descriptor = 0 (stdin)
    li a7, 63 # syscall read (63)
    ecall
    ret

write:
    li a0, 1            # file descriptor = 1 (stdout)
    li a7, 64           # syscall write (64)
    ecall
    ret

#no input_adress:
#Yb : do posicoes + 0 ate posicoes + 4     
#Xc : do posicoes + 6 ate posicoes + 10     
#Ta : do tempos + 0 ate tempos + 3   
#Tb : do tempos + 5 ate tempos + 8    
#Tc : do tempos + 10 ate tempos + 13
#Tr : do tempos + 15 ate tempos + 18

#Exemplo de entrada
#+0700 -0100                 (Yb, Xc)
#2000 0000 2240 2300         (Tr, Ta, Tb, Tc)

_start:
  li a2, 12
  la a1, posicoes
  jal ra, read #ler posicoes
  jal ra, convert_signed

  li a2, 20
  la a1, tempos
  jal ra, read #ler tempos
  jal ra, convert_unsigned

  #nesse ponto, temos as variaveis Yb, Xc, Ta, Tb, Tc, Tr com seus respectivos inteiros
  la a3, da #endereco de armazenamento em a3
  la a1, Ta
  lw a1, 0(a1)#carrega o valor de Ta em a1
  la a0, Tr
  lw a0, 0(a0) #carrega o valor de Tr em a0
  jal ra, calcular_distancia #parametros a3: storage_addr  a0: Tr  a1:Ta

  la a3, db
  la a1, Tb
  lw a1, 0(a1)
  jal ra, calcular_distancia

  la a3, dc
  la a1, Tc
  lw a1, 0(a1)
  jal ra, calcular_distancia

  #nesse ponto, temos Yb, Xc (signed), Ta, Tb, Tc, Tr, da, db, dc (unsigned)

  jal ra, calcular_coordenadas #devolve a0 = x e a1 = y
  mv s8, a1
  #Agora, temos que guardar na memoria como string
  mv a3, a0 #mover x para a3 (parametro)
  la a4, x #endereco de armazenamento de x em a4
  jal ra, transformar_em_string #parametro: a3 numero a ser guardado   a4: endereco de armazenamento
  li t0, 32
  sb t0, 5(a4)#colocar o espaco dps do x
  
  #escrever o x
  li a2, 6
  mv a1, a4
  jal ra, write

  mv a3, s8
  la a4, y
  jal ra, transformar_em_string
  li t0, 10
  sb t0, 5(a4)#colocar o \n dps do y

  #escrever o y
  li a2, 6
  mv a1, a4
  jal ra, write

  j _end


convert_signed: 
    la a2, posicoes # a2 <-- input_adress
    mv a3, a2 #a3 guardara o endereco do inicio

    li t1, 1    # t1 = i (comeca em 
    li t0, 5    #t0 = 5
    li t2, 1000 #t2 = 1000
    li s0, 0    #Yb
    li t4, 10 #a

  for:
    bge t1, t0, verificar_sinal1 # se i >= 5 entao vai pro proximo numero
    addi a2, a2, 1 #atualiza o endereco
    lbu t3, (a2) #t3 = caractere
    addi t3, t3, -48 #t3 tem o inteiro
    mul t3, t3, t2 #t3 = t3 * t2
    add s0, s0, t3 #soma s0 com t3
    divu t2, t2, t4 #t2 = t2 / 10
    addi t1, t1, 1 #atualiza o contador
    j for #reinicia o laco

  verificar_sinal1:
  li t1, 45 #carrega em t1 o decimal equivalente ao sinal de "-" em ascii
  lbu t3, (a3) #carrega o inicio do input em a3
  bne t1, t3, pular # if primeiro byte != '-' entao vai pro proximo numero sem negativar
  li t1, -1
  mul s0, s0, t1 #negativa Yb
 
  pular:
  #a2 esta apontando para o ultimo digito de Yb
  #a3 esta apontando pra posicoes[0]
  addi a2, a2, 2 #a2 esta apontando para o sinal de Xc
  addi a3, a3, 6 #a3 esta apontando para o sinal de Xc
  li t1, 1
  li t0, 5
  li t2, 1000
  li s1, 0  #Xc
  for2:
  bge t1, t0, verificar_sinal2 #se i >= 5 entao vai para o proximo numero
  addi a2, a2, 1 #atualiza para o proximo digito
  lbu t3, (a2)
  addi t3, t3, -48
  mul t3, t3, t2
  add s1, s1, t3
  divu t2, t2, t4 #t2 = t2 / 10
  addi t1, t1, 1 #atualiza o contador
  j for2

  verificar_sinal2:
  li t1, 45
  lbu t3, (a3) #a3 aponta para o sinal de Xc
  bne t1, t3, converteu_entrada
  li t1, -1
  mul s1, s1, t1

  converteu_entrada:
  la t1, Xc
  la t2, Yb
  sw s1, 0(t1) #Armazena o valor de Xc 
  sw s0, 0(t2) #Armazena o valor de Yb
  #resetar os sX
  li s0, 0
  li s1, 0
  li s2, 0
  li s3, 0
  ret
      

convert_unsigned:
  #carregar o endereço da entrada de tempos em a3
  la a3, tempos
  #fazer umas copias para cada numero
  mv a4, a3
  mv a5, a3 
  mv a6, a3
  # a3 servirá para iterar sobre o primeiro numero
  addi a4, a4, 5 #aponta para o incio de Tb
  addi a5, a5, 10 #aponta para o incio de Tc
  addi a6, a6, 15 #aponta para o incio de Tr
  #for (int i = 0; i < 4; i++)
  li t0, 0 #t0 = i = 0
  li t6, 4 #condicao
  li t5, 1000
  li s11, 10
  for3:
  bge t0, t6, converteu_entrada2 #if i >= 4 terminar for
  #carrego os enderecos para os bytes atuais da iteracao
  lbu t1, (a3) #t1 = Ta[i]
  lbu t2, (a4) #t2 = Tb[i]
  lbu t3, (a5) #t3 = Tc[i]
  lbu t4, (a6) #t4 = Tr[i]
  #transformo o caractere ascii em int
  addi t1, t1, -48
  addi t2, t2, -48
  addi t3, t3, -48
  addi t4, t4, -48
  #multiplico pela potencia
  mul t1, t1, t5
  mul t2, t2, t5
  mul t3, t3, t5
  mul t4, t4, t5
  #adiciono no resultado final
  add s0, s0, t1
  add s1, s1, t2
  add s2, s2, t3
  add s3, s3, t4
  #atualizo os contadores/enderecos
  divu t5, t5, s11
  addi t0, t0, 1
  addi a3, a3, 1
  addi a4, a4, 1
  addi a5, a5, 1
  addi a6, a6, 1
  j for3

  converteu_entrada2:
  #armazenar os valores na memoria
  la t0, Ta
  sw s0, 0(t0) 
  la t0, Tb
  sw s1, 0(t0)
  la t0, Tc
  sw s2, 0(t0)
  la t0, Tr
  sw s3, 0(t0) 
  #resetar sX
  li s0, 0
  li s1, 0
  li s2, 0
  li s3, 0
  ret

raiz_quadrada: #parametro : y = a3 e k = s11
  #estimativa inicial: k = y / 2
  srli s11, a3, 1
  #for (int i = 0; i < 12; i++)
    #k = (k + y/k)/2
  li t0, 0 #i
  li t1, 12
  for4:
  bge t0, t1, devolver_raiz # if i >= 12 then target
  divu t2, a3, s11 #t2 = y/k
  add t2, t2, s11  # t2 = (y/k) + k
  srli s11, t2, 1  # k = (y/k + k)/2
  addi t0, t0, 1
  j for4

  devolver_raiz:
  ret #RESULTADO EM s11

calcular_distancia: #T1 em a0, T2 em a1, endereco de armazenamento em a3
  #deltaT = T1 - T2  -> registrador t0
  sub t0, a0, a1
  #multiplicar por 3 e dividir por 10 ( delta t * v )
  li t1, 10
  li t3, 3
  mul t0, t0, t3 #multiplica por 3
  divu t0, t0, t1 #divide por 10

  sw t0, 0(a3) #armazena o valor no endereco guardado em a3
  ret 

calcular_coordenadas: #a0 = x e a1 = y
  #pegar da, db, dc, Yb, Xc
  la s0, da
  lw s0, 0(s0)
  la s1, db
  lw s1, 0(s1)
  la s2, dc
  lw s2, 0(s2)
  la s3, Yb
  lw s3, 0(s3)
  la s4, Xc
  lw s4, 0(s4)
  #portanto
  #s0 = da, s1 = db, s2 = dc, s3 = Yb, s4 = Xc
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
  mul t3, a1, a1 #t3 = y²

  sub a3, s0, t3 #t2 = (da²-y²)
  mv s10, ra
  jal ra, raiz_quadrada #s11 = sqrt(da²-y²)
  mv ra, s10
  mv a0, s11 #x = sqrt(da²-y²)
  #a0 = sqrt(da²-y²)
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

  #O resultado tem q estar em a0. Assim:
    # Se t2 > t4 (a0 esta mais distante de satisfazer a igualdade)
      #mover s11 para a0
    # Caso contrario:
      #n fazer nada
  aqui:
  blt t2, t4, retornar_coordendas # if t2 < t4 then target
  #se t2 > t4
  mv a0, s11
  
  retornar_coordendas:
  #a0 = x, a1 = y
  ret
  
transformar_em_string: #a3 = numero #a4 endereco de armazenamento
  #verificar se o numero eh menor que zero
  li t0, 0
  li t2, 43 #guarda o caractere '+' em t2
  bge a3, t0, cont # if a3 >= 0 then target
  #se a3 for negativo
  li t0, -1
  mul a3, a3, t0 #faco a3 ser positivo
  li t2, 45 #guarda o caractere '-' em t2

  #algoritmo
  #Para cada algarismo
  #Guarda o resto da divisao do numero por 10
  #soma 48 nesse resto pra transformar em string
  #divide o numero por 10
  cont:
  li t0, 1
  li t1, 4
  li t3, 10
  for5:
  blt t1, t0, encerrar # if t1 < t0 then target
  remu t4, a3, t3 #t4 = x % 10 
  addi t4, t4, 48 #transformar em caractere
  divu a3, a3, t3 # x = x / 10
  add t5, a4, t1 #local de armazenamento = a4 + i
  sb t4, 0(t5)
  addi t1, t1, -1 #atualizar contador
  j for5 
  encerrar:
  #adicionar o sinal no inicio
  sb t2, 0(a4)
  ret

_end: 
    li a0, 0
    li a7, 93
    ecall