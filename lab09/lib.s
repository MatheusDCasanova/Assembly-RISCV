.globl _start, _system_time, play_note, main_ISR

.bss
.align 4
isr_stack: # Final da pilha das ISRs
.skip 1024 # Aloca 1024 bytes para a pilha
topo_stack_isr:

_system_time: .skip 4


.text
.align 2
_start:
    #configurando ISR
    la t0, main_ISR
    csrw mtvec, t0

    #configurando pilha
    la t0, topo_stack_isr
    csrw mscratch, t0

    # Habilita Interrupções Externas
    csrr t1, mie # Seta o bit 11 (MEIE)
    li t2, 0x800 # do registrador mie
    or t1, t1, t2
    csrw mie, t1

    # Habilita Interrupções Global
    csrr t1, mstatus # Seta o bit 3 (MIE)
    ori t1, t1, 0x8 # do registrador mstatus
    csrw mstatus, t1

    la t0, _system_time
    li t1, 0
    sw t1, 0(t0)

    li t0, 0xFFFF0100   #base GPT
    addi t0, t0, 8
    li t1, 100
    sw t1, 0(t0)

    jal main




play_note:  #a0 = int ch, a1 = int inst, a2 = int note, a3 = int vel, a4 = int dur
    li t0, 0xFFFF0300
    #definir o instrumento
    addi t1, t0, 2
    sh a1, 0(t1)

    #definir nota
    addi t1, t0, 4
    sb a2, 0(t1) 

    #definir velocidade
    addi t1, t0, 5
    sb a3, 0(t1)

    #definir duracao
    addi t1, t0, 6
    sh a4, 0(t1)

    #definir canal de reproducao
    sb a0, 0(t0)
    ret

main_ISR:
    csrrw sp, mscratch, sp # Troca sp com mscratch
    addi sp, sp, -16 # Aloca espaço na pilha da ISR
    sw t0, 0(sp)
    sw t1, 4(sp)
    sw t2, 8(sp)

    #incrementar _sytem_time
    la t0, _system_time
    lw t1, 0(t0)
    li t2, 100
    add t1, t1, t2
    sw t1, 0(t0)

    #Programar para gerar interrupação daqui 100ms
    li t0, 0xFFFF0100   
    addi t0, t0, 8
    li t1, 100
    sw t1, 0(t0)

    lw t0, 0(sp)
    lw t1, 4(sp)
    lw t2, 8(sp)
    addi sp, sp, 16
    csrrw sp, mscratch, sp # Troca sp com mscratch
    mret



    

