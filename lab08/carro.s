.globl _start

_start:
    li a0, 0xFFFF0100
    mv t0, a0   #t0: endereco do registrador do gps
    li t3, 0x18
    add t3, a0, t3  #&Z
    li t4, 1
    li t5, 0
    li t6, -1

    sb t4, 0(t0)    #X, Y, Z adquiridos nos enderecos de t1, t2, t3
    lb a1, 0(t0) 
    li s0, 0
    while_espera1:
        beq a1, s0, recebeu #se o gps estiver com 0, leu
        lb a1, 0(t0)
        j while_espera1  
    recebeu:
    lw a1, 0(t3)    #Z

    li a2, 0x21
    add a2, a0, a2  #engine register

    #IR PARA FRENTE ATE DETERMINADO Z
    li s0, -77
    li s1, 0
    sb t4, 0(a2)
    while:
    bge a1, s0, mudar_direcao # if Z >= -77 then freiar
    sb t4, 0(t0)    #ativa o gps
    lb a1, 0(t0)
    while_espera2:
        beq a1, s1, recebeu2 #se o gps estiver com 0, leu
        lb a1, 0(t0)
        j while_espera2  
    recebeu2:
    lw a1, 0(t3)    #Z
    lw a1, 0(t3)    #guarda Z em a1
    j while
    mudar_direcao:
    li t1, 0x20
    add t1, t0, t1  #t1 = wheel direction
    li t2, -34
    sb t2, 0(t1)


    li t1, 95
    li t2, 0x10
    add t2, t0, t2  #X position register
    sb t4, 0(t0)    #activate GPS
    li s1, 0
    lb a1, 0(t0)
    esperar_GPS:
    beq a1, s1, esperou_GPS
    lb a1, 0(t0)
    j esperar_GPS
    esperou_GPS:

    lw a1, 0(t2)
    li s1, 130
    li s2, 140
    li s0, 0
    while_espera4:
    blt a1, s1, zerar_direcao # if x < 130 then zerar direcao
    sb t4, 0(t0)    #ativar o GPS
    lb a1, 0(t0)    #pegar o 
    esperar_GPS2:
    beq a1, s0, esperou_GPS2
    lb a1, 0(t0)
    j esperar_GPS2
    esperou_GPS2:
    lw a1, 0(t2)
    blt a1, s2, desligar_motor_precoce
    a:
    j while_espera4

    desligar_motor_precoce:
    li a2, 0x21
    add a2, a0, a2  #engine register
    sb t5, 0(a2)
    j a

    zerar_direcao:

    li t1, 0x20
    add t1, t0, t1  #t1 - whell direction
    li t2, 0
    sb t2, 0(t1)

    li t1, 0x22
    add t1, t0, t1  #t1 - break
    sb t4, 0(t1)


    j exit



exit: 
li a0, 0
li a7, 93
ecall

