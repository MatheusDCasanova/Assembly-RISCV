.bss
.align 4
isr_stack: # Final da pilha das ISRs
.skip 1024 # Aloca 1024 bytes para a pilha
topo_stack_isr:

/*user_stack:
.skip 2048
top_user_stack:
*/
#0xFFFF0500 - Serial port
#0xFFFF0700 - Canva

.text
.align 4

Syscall_set_engine_and_steering: #a0 sentido do deslocamento, #a1 angulo
  li t0, -127
  blt a1, t0, parametro_invalido
  li t0, 127
  bgt a1, t0, parametro_invalido
  li t0, 1
  li t1, 0
  li t2, -1
  beq a0, t0, parametros_validos 
  beq a0, t1, parametros_validos 
  beq a0, t2, parametros_validos 
  j parametro_invalido
  
  parametros_validos:
  li t0, 0xFFFF0300
  sb a0, 0x21(t0)
  sb a1, 0x20(t0)
  li a0, 0
  j syscall_realizada

  parametro_invalido:
  li a0, -1
  j syscall_realizada
#---------------------------------------------
Syscall_set_handbreak:
  li t0, 0xFFFF0300
  sb a0, 0x22(t0)
  j syscall_realizada
#---------------------------------------------
Syscall_read_sensors: #a0: endereço de um vetor de 256 elementos que armazenará os valores lidos do sensor de luminosidade
  li t0, 0xFFFF0300
  li t1, 1
  sb t1, 0x01()
  lb t1, 0x01(t0) #t1 eh o verificador do termino de leitura
  li t2, 0  #terminou leitura
  aguardar_leitura_sensor:
  beq t1, t2, terminou_leitura_sensor
  lb t1, 0x01(t0)
  j aguardar_leitura_sensor
  terminou_leitura_sensor:
  #guardar os byter em a0
  li t1, 0  #contador de pixels
  li t2, 256
  while_copia_pixels:
  bge t1, t2, copiou_pixels # while t1 < 256
  add t3, t1, t0    #t3 endereco inicial + offset do contador
  lb t3, 0x24(t3)   #primeiro byte (pixel) carregado em t3
  add t4, t1, a0    #a0 endereco inicial + offset do contador (armazenará)
  sb t3, 0(t4)
  addi t1, t1, 1
  j while_copia_pixels
  copiou_pixels:
  j syscall_realizada



#---------------------------------------------
Syscall_read_sensor_distance:
  li t0, 0xFFFF0300
  li t1, 2
  sb t1, 0x02(t0)
  lb t1, 0x02(t0) #t1 eh o verificador do termino de leitura
  li t2, 0  #terminou leitura
  aguardar_leitura_distancia:
  beq t1, t2, terminou_leitura_distancia
  lb t1, 0x02(t0)
  j aguardar_leitura_distancia
  terminou_leitura_distancia:
  lw a0, 0x1C(t0)
  li t1, -100
  bne a0, t1, syscall_realizada # if a0 != -100 retornar o conteudo de a0
  li a0, -1 #se for igual a -100, retornar -1
  j syscall_realizada

#---------------------------------------------
Syscall_get_position: #a0: endereço posição x #a1: endereço posição y #a2: endereço posição z
  li t0, 0xFFFF0300
  li t1, 1
  sb t1, 0(t0) #inicia leitura do gps
  lb t1, 0(t0) #t1 eh o verificador do termino de leitura
  li t2, 0  #terminou leitura
  aguardar_leitura_gps:
  beq t1, t2, terminou_leitura
  lb t1, 0(t0)
  j aguardar_leitura_gps
  terminou_leitura:
  lw t1, 0x10(t0)    #X da leitura
  sw t1, 0(a0) #guarda X
  lw t1, 0x14(t0)
  sw t1, 0(a1)
  lw t1, 0x18(t0)
  sw t1, 0(a2)
  j syscall_realizada
  
#---------------------------------------------
Syscall_get_rotation: #a0: valor do em x. a1: valor do ângulo em y a2: valor do ângulo em z
  li t0, 0xFFFF0300
  li t1, 1
  sb t1, 0(t0) #inicia leitura do gps
  lb t1, 0(t0) #t1 eh o verificador do termino de leitura
  li t2, 0  #terminou leitura
  aguardar_leitura_rotation:
  beq t1, t2, terminou_rotation
  lb t1, 0(t0)
  j aguardar_rotation_rotation
  terminou_rotation:
  lw t1, 0x04(t0)    #X da leitura
  sw t1, 0(a0) #guarda X
  lw t1, 0x08(t0)
  sw t1, 0(a1)
  lw t1, 0x0C(t0)
  sw t1, 0(a2)
  j syscall_realizada

#---------------------------------------------
Syscall_read: #a0: file descriptor #a1: buffer #a2: size
  li t0, 0xFFFF0500 #serial port memory adress
  li t1, 1
  sb t1, 0x02(t0)   #inicia a leitura do byte na stdin
  lb t1, 0x02(t0) #t1 eh o verificador do termino de leitura
  li t2, 0
  while_reading:
  beq t1, t2, terminou_reading # if t1 == t0 then leu o byte
  lb t1, 0x02(t0)
  j while_reading
  terminou_reading:
  lb t5, 0x03(t0)
  li t2, 0  #terminou leitura com \0
  li t3, 10 #terminou leitura com 10
  li t4, 0  #contador de caracteres

  while_ler:
    beq t5, t2, terminou_ler    # if byte lido == \n then target
    beq t5, t3, terminou_ler    # if byte lido == 0 then target
    add t6, t4, a1  #endereco armazenamento + offset
    sb t5, 0(t6)    #guarda o caractere
    addi t4, t4, 1  #leu um caractere
    li t1, 1
    sb t1, 0x02(t0)   #inicia a leitura do byte na stdin
    lb t1, 0(t0) #t1 eh o verificador do termino de leitura
    while_reading_interno:
    beq t1, t2, terminou_reading_interno # if terminou leitura
    lb t1, 0x02(t0)
    j while_reading_interno
    terminou_reading_interno:
    lb t5, 0x03(t0)
    j while_ler
  terminou_ler:

  mv a0, t4
  j syscall_realizada

#---------------------------------------------
Syscall_write:  #a1 endereco do buffer #a2 tamanho
  li t0, 0xFFFF0500 #serial port memory adress
  li t1, 0  #i
  for_escrita:
  bge t1, a2, fim_escrita # if i >= tamanho then terminou
  add t2, t1, a1    #endereco buffer + offeset do byte
  lb t2, 0(t2)  #carrega o byte
  sb t2, 0x01(t0)   #guarda o byte
  li t2, 1
  sb t2, 0(t0)  #triggers writing
  lb t2, 0(t0)
  li t3, 0
  esperar_escrita:
  beq t2, t3, esperou_escrita # if t2 = 0
  lb t2, 0(t0)
  j esperar_escrita
  esperou_escrita:
  addi t1, t1, 1    #incremento i
  j for_escrita
  fim_escrita:
  j syscall_realizada
#---------------------------------------------


Syscall_draw_line:#a0 endereco array 256 bytes
  li t0, 0xFFFF0700
  li t1, 0 #i
  li t2, 256
  for_copiar_linha:
  bge t1, t2, fim_copiar_linha
  add t3, t1, a0    #endereco array + offset
  lb t3, 0(t3)  #carrega o byte
  add t4, t0, t1
  addi t4, t4, 0x08 #endereco pixels + offset
  sb t3, 0(t4)
  addi t1, t1, 1
  j for_copiar_linha
  fim_copiar_linha:
  li t1, 256
  sh t1, 0x02(t0)   #array size
  li t1, 0
  sw t1, 0x04(t0)   #initial position
  li t1, 1
  sb t1, 0(t0)      #triggers drawing
  lb t1, 0(t0)
  li t2, 0
  esperar_desenhar:
  beq t1, t2, desenhou # if t0 == t1 then target
  lb t1, 0(t0)
  j esperar_desenhar
  desenhou:
  
  j syscall_realizada
  







#---------------------------------------------
int_handler:
  ###### Tratador de interrupções e syscalls ######  
  # <= Implemente o tratamento da sua syscall aqui

  csrrw sp, mscratch, sp # Troca sp com mscratch
  addi sp, sp, -32 # Aloca espaço na pilha da ISR
  sw t0, 0(sp)
  sw t1, 4(sp)
  sw t2, 8(sp)
  sw t3, 12(sp)
  sw t4, 16(sp)
  sw ra, 20(sp)

  li t1, 10
  beq a7, t1, Syscall_set_engine_and_steering
  li t1, 11
  beq a7, t1, Syscall_set_handbreak
  li t1, 12
  beq a7, t1, Syscall_read_sensors
  li t1, 13
  beq a7, t1, Syscall_read_sensor_distance
  li t1, 15
  beq a7, t1, Syscall_get_position
  li t1, 16
  beq a7, t1, Syscall_get_rotation
  li t1, 17
  beq a7, t1, Syscall_read
  li t1, 18
  beq a7, t1, Syscall_write
  li t1, 19
  beq a7, t1, Syscall_draw_line
  

  syscall_realizada:
  csrr t0, mepc  # carrega endereço de retorno (endereço da instrução que invocou a syscall)
  addi t0, t0, 4 # soma 4 no endereço de retorno (para retornar após a ecall) 
  csrw mepc, t0  # armazena endereço de retorno de volta no mepc
  lw t0, 0(sp)
  lw t1, 4(sp)
  lw t2, 8(sp)
  lw t3, 12(sp)
  lw t4, 16(sp)
  lw ra, 20(sp)
  addi sp, sp, 32 
  csrrw sp, mscratch, sp
  mret           # Recuperar o restante do contexto (pc <- mepc)


.globl _start
_start:
  la t0, int_handler  # Carregar o endereço da rotina que tratará as interrupções
  csrw mtvec, t0      # (e syscalls) no registrador MTVEC para configurar
                      # o vetor de interrupções.

# Escreva aqui o código para mudar para modo de usuário e chamar a função user_main (definida em outro arquivo).
# Lembre-se de inicializar a pilha do usuário para que seu programa possa utilizá-la.

  #configurando pilha
  la t0, topo_stack_isr
  csrw mscratch, t0

  #configurando pilha do usuario
  li sp, 0x07FFFFFC

  # Habilita Interrupções Externas
  csrr t1, mie # Seta o bit 11 (MEIE)
  li t2, 0x800 # do registrador mie
  or t1, t1, t2
  csrw mie, t1

  csrr t1, mstatus # Update the mstatus.MPP
  li t2, ~0x1800 # field (bits 11 and 12)
  and t1, t1, t2 # with value 00 (U-mode)
  csrw mstatus, t1
  la t0, main # Loads the user software
  csrw mepc, t0 # entry point into mepc
  mret