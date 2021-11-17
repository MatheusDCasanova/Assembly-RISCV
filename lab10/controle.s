.bss
.align 4
isr_stack: # Final da pilha das ISRs
.skip 1024 # Aloca 1024 bytes para a pilha
topo_stack_isr:

user_stack:
.skip 2048
top_user_stack:

x: .skip 4
y: .skip 4
z: .skip 4

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
  li t0, 0xFFFF0100
  sb a0, 0x21(t0)
  sb a1, 0x20(t0)
  li a0, 0
  j syscall_realizada

  parametro_invalido:
  li a0, -1
  j syscall_realizada

Syscall_set_handbreak:
  li t0, 0xFFFF0100
  sb a0, 0x22(t0)
  j syscall_realizada

Syscall_read_sensors: #a0: endereço de um vetor de 256 elementos que armazenará os valores lidos do sensor de luminosidade


Syscall_get_position: #a0: endereço posição x #a1: endereço posição y #a2: endereço posição z
  li t0, 0xFFFF0100
  li t1, 1
  sb t1, t0 #inicia leitura do gps
  lb t1, t0 #t1 eh o verificador do termino de leitura
  li t2, 0  #terminou leitura
  aguardar_leitura_gps:
  beq t1, t2, terminou_leitura
  lb t1, t0
  j aguardar_leitura_gps
  terminou_leitura:
  lw t1, 0x10(t0)    #X da leitura
  sw t1, 0(a0) #guarda X
  lw t1, 0x14(t0)
  sw t1, 0(a1)
  lw t1, 0x18(t0)
  sw t1, 0(a2)
  j syscall_realizada
  
int_handler:
  ###### Tratador de interrupções e syscalls ######  
  # <= Implemente o tratamento da sua syscall aqui

  csrrw sp, mscratch, sp # Troca sp com mscratch
  addi sp, sp, -32 # Aloca espaço na pilha da ISR
  sw t0, 0(sp)
  sw t1, 4(sp)
  sw t2, 8(sp)
  sw ra, 12(sp)

  li t1, 10
  beq a7, t1, Syscall_set_engine_and_steering
  li t1, 11
  beq a7, t1, Syscall_set_handbreak
  li t1, 12
  beq a7, t1, Syscall_read_sensors
  li t1, 15
  beq a7, t1, Syscall_get_position

  syscall_realizada:
  lw t0, 0(sp)
  lw t1, 4(sp)
  lw t2, 8(sp)
  lw ra, 12(sp)
  addi sp, sp, 32 
  csrrw sp, mscratch, sp

  csrr t0, mepc  # carrega endereço de retorno (endereço da instrução que invocou a syscall)
  addi t0, t0, 4 # soma 4 no endereço de retorno (para retornar após a ecall) 
  csrw mepc, t0  # armazena endereço de retorno de volta no mepc
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
  la sp, top_user_stack

  # Habilita Interrupções Externas
  csrr t1, mie # Seta o bit 11 (MEIE)
  li t2, 0x800 # do registrador mie
  or t1, t1, t2
  csrw mie, t1

  csrr t1, mstatus # Update the mstatus.MPP
  li t2, ~0x1800 # field (bits 11 and 12)
  and t1, t1, t2 # with value 00 (U-mode)
  csrw mstatus, t1
  la t0, user_main # Loads the user software
  csrw mepc, t0 # entry point into mepc
  mret


.globl logica_controle
logica_controle:
  # implemente aqui sua lógica de controle, utilizando apenas as syscalls definidas.
    addi sp, sp, -32



    li a0, 1
    li a1, 0
    li a7, 10
    ecall

    la a0, x 
    la a1, y
    la a2, z
    li a7, 15
    ecall

    lw a0, 0(a0)   #X value   
    lw a1, 0(a1)   #Y value  
    lw a2, 0(a2)   #Z value  
    
    li t0, -77
    step1:  #enquanto Z nao for -77
    bge a2, t0, mudar_direcao # if Z >= -77 then target

    la a0, x
    la a1, y
    la a2, z
    li a7, 15
    ecall   #call GPS
    lw a0, 0(a0)   #X value   
    lw a1, 0(a1)   #Y value  
    lw a2, 0(a2)   #Z value

    j step1

    mudar_direcao:
    li a0, 1
    li a1, -34
    li a7, 10
    ecall   #alterar o angulo


    ret
