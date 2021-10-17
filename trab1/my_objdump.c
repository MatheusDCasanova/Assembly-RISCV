#include <fcntl.h>
#include <unistd.h>

int tamanhoString(char string[]){

  int tamanho = 0;

  for (int i = 0; string[i] != '\0'; i++){
    tamanho += 1;
  }

  return tamanho;
}

void transformar_char_string(char caractere, char string[]){
  string[0] = caractere;
  string[1] = '\0';
}

int potencializar(int numero, int potencia){
  if (potencia == 0){
    return 1;
  }

  return numero * potencializar(numero, potencia - 1);
}

void converterIntParaString(int decimall, char decimal[]){
  char decimal_invertido[36];
  int aux = decimall;
  unsigned int aux2 = decimall;
  int i = 0;
  int eh_negativo = 0;

  if (decimall != 0){
    if (aux < 0){
      eh_negativo = 1;
      aux = aux * (-1);
    }


    if (aux < 0){ //se mesmo dps de multiplicar por -1 ainda for negativo, uso o unsigned
      while (aux2 != 0){
        decimal_invertido[i] = (aux2 % 10) + '0';
        aux2 = aux2 / 10;
        i++;
      }
    } else{//caso contrario, mexo com o int mesmo
      while (aux != 0){
        decimal_invertido[i] = (aux % 10) + '0';
        aux = aux / 10;
        i++;
      }

    }
    decimal_invertido[i] = '\0';


    //DESINVERTER

    int inicio = 0;

    int tamanho = tamanhoString(decimal_invertido);
    if (!eh_negativo){//se for positivo inverto normalmente
      for (int i = tamanho - 1; i >= 0; i--){
        decimal[inicio] = decimal_invertido[i];
        inicio++;
      }
    } else{ //se for positivo coloco o sinal negativo antes e depois comeco a inverter
      inicio = 1;
      decimal[0] = '-';
      for (int i = tamanho - 1; i >= 0; i--){
        decimal[inicio] = decimal_invertido[i];
        inicio++;
      }
    }

    decimal[inicio] = '\0';
  } else{
    decimal[0] = '0';
    decimal[1] = '\0';
  }

}

void print_string(char string[]){
  write(1, string, tamanhoString(string));
}

void print_char(char caractere){
  char string[10];
  for (int i = 0; i < 10; i++){
    string[i] = '\0';
  }
  transformar_char_string(caractere, string);
  write(1, string, 1);
}

void print_int(int inteiro){
  char string[100];
  for (int i = 0; i < 100; i++){
    string[i] = '\0';
  }
  converterIntParaString(inteiro, string);
  write(1, string, tamanhoString(string));
}

long int converterHexadecimalParaIntDecimal(char hexadecimal[36], int tamanho){
  long int decimal = 0;

  for (int i = 0; i < tamanho; i++){//comeca em hexadecimal 2 por causa do 0x
    if (hexadecimal[i] < 60){
      decimal += (hexadecimal[i] - 48) * potencializar(16, tamanho - i - 1);
    } else{
      decimal += (hexadecimal[i] - 87) * potencializar(16, tamanho - i - 1);
    }
  }

  return decimal;
}

void copiar_string(char string1[], char string2[]){

  for (int i = 0; i <= tamanhoString(string1); i++){
    string2[i] = string1[i];
  }

}

void converterDecimalParaBinario(unsigned int decimal, char binario[]){

  char binario_invertido[36];
  unsigned int aux = decimal;
  int i = 0;
  while (aux != 0){
    
    binario_invertido[i] = (aux % 2) + '0';

    aux = aux / 2;
    i++;
  }
  binario_invertido[i] = '\0';

  //DESINVERTER O BINARIO
  int inicio = 0;

  int tamanho = tamanhoString(binario_invertido);


  for (int i = 0; i < 32 - tamanho; i++){
    binario[i] = '0';
    inicio++;
  }
  

  for (int i = tamanho - 1; i >= 0; i--){
    binario[inicio] = binario_invertido[i];
    inicio++;
  }

  binario[inicio] = '\0';
}

void converterDecimalParaHexadecimal(long int decimal, char destino[]){
  char hexadecimal_invertido[36];
  long int aux = decimal;
  int i = 0;
  long int aux2 = aux;

  while (aux != 0){
    
    if (aux % 16 < 10){
      hexadecimal_invertido[i] = (aux % 16) + '0';
    } else{
      hexadecimal_invertido[i] = (aux % 16) + 'W'; //dar a letra respectiva ao resto
    }
    aux = aux / 16;
    i++;
  }

  if (aux2 < 16 && aux2!= 0){
    hexadecimal_invertido[i] = '0';
    hexadecimal_invertido[i+1] = '\0';
  } else if(aux2 == 0){
    hexadecimal_invertido[i] = '0';
    hexadecimal_invertido[i+1] = '0';
    hexadecimal_invertido[i+2] = '\0';
  } else{
    hexadecimal_invertido[i] = '\0';
  }
  

  //DESINVERTER E ADICIONAR 0X
  char hexadecimal[36];

  int inicio = 0;

  int tamanho = tamanhoString(hexadecimal_invertido);

  for (int i = tamanho - 1; i >= 0; i--){
    hexadecimal[inicio] = hexadecimal_invertido[i];
    inicio++;
  }

  hexadecimal[inicio] = '\0';

  copiar_string(hexadecimal, destino);
}

long int obter_valor_decimal_do_grupo(unsigned char buffer[], int inicial, int iteracoes){ //PARA LITTLE ENDIAN
  char juncao[36];
  for (int i = 0; i < 36; i++){
    juncao[i] = '\0';
  }

  for (int j = iteracoes - 1; j >= 0; j--){
    long int aux = buffer[inicial + j];
    char hexadecimal_invertido[36];
    for (int i = 0; i < 36; i++){
      hexadecimal_invertido[i] = '\0';
    }
    int i = 0;

    long int aux2 = aux;

    while (aux != 0){
        if (aux % 16 < 10){
            hexadecimal_invertido[i] = (aux % 16) + '0';
        } 
        else{
            hexadecimal_invertido[i] = (aux % 16) + 'W'; //dar a letra respectiva ao resto 
        }
        aux = aux / 16;
        i++;
    }

    if (aux2 < 16 && aux2!= 0){
      hexadecimal_invertido[i] = '0';
      hexadecimal_invertido[i+1] = '\0';
    } else if(aux2 == 0){
      hexadecimal_invertido[i] = '0';
      hexadecimal_invertido[i+1] = '0';
      hexadecimal_invertido[i+2] = '\0';
    } else{
      hexadecimal_invertido[i] = '\0';
    }

    //DESINVERTER E ADICIONAR 0X
    char hexadecimal[36];

    int inicio = 0;

    int tamanho = tamanhoString(hexadecimal_invertido);

    for (int i = tamanho - 1; i >= 0; i--){
        hexadecimal[inicio] = hexadecimal_invertido[i];
        inicio++;
    }

    hexadecimal[inicio] = '\0';

    // ACOPLAMENTO
    
    inicio = tamanhoString(juncao);
    tamanho = tamanhoString(hexadecimal);
    
    //comecar de onde parou a juncao, e ir colocando 
    for (int h = 0; h  < tamanho; h++){
        juncao[inicio] = hexadecimal[h];
        inicio ++;
    }
  }
  
  return converterHexadecimalParaIntDecimal(juncao, tamanhoString(juncao));
}

void imprimir_valor_hexa_do_grupo(unsigned char buffer[], int inicial, int iteracoes){

  char juncao[36];
  for (int i = 0; i < 36; i++){
    juncao[i] = '\0';
  }

  for (int j = iteracoes - 1; j >= 0; j--){
    int aux = buffer[inicial + j];
    char hexadecimal_invertido[36];

    for (int i = 0; i < 36; i++){
      hexadecimal_invertido[i] = '\0';
    }

    int aux2 = aux;

    int i = 0;
    while (aux != 0){
        
        if (aux % 16 < 10){
            hexadecimal_invertido[i] = (aux % 16) + '0';
        } 
        else{
            hexadecimal_invertido[i] = (aux % 16) + 13360 + 39; //dar a letra respectiva ao resto
        }
        aux = aux / 16;
        i++;
    }

    if (aux2 < 15 && aux2!= 0){
      hexadecimal_invertido[i] = '0';
      hexadecimal_invertido[i+1] = '\0';
    } else if(aux2 == 0){
      hexadecimal_invertido[i] = '0';
      hexadecimal_invertido[i+1] = '0';
      hexadecimal_invertido[i+2] = '\0';
    } else{
      hexadecimal_invertido[i] = '\0';
    }

    //DESINVERTER E ADICIONAR 0X
    char hexadecimal[36];

    int inicio = 0;

    int tamanho = tamanhoString(hexadecimal_invertido);

    for (int i = tamanho - 1; i >= 0; i--){
        hexadecimal[inicio] = hexadecimal_invertido[i];
        inicio++;
    }

    hexadecimal[inicio] = '\0';

    // ACOPLAMENTO
    
    inicio = tamanhoString(juncao);
    tamanho = tamanhoString(hexadecimal);
    
    //comecar de onde parou a juncao, e ir colocando 
    for (int h = 0; h  < tamanho; h++){
        juncao[inicio] = hexadecimal[h];
        inicio ++;
    }
  }

  int zeros_a_printar = 8 - tamanhoString(juncao);

  for (int i = 0; i < zeros_a_printar; i++){
    print_string("0");
  }
  print_string(juncao);
}

void imprimir_secoes(unsigned char buffer[], int endereco_shstrtab, int e_shoff, int e_shnum, char nome_arquivo[]){

  print_string("\n");
  print_string(nome_arquivo);
  print_string(":\tfile format ELF32-riscv\n\nSections:\nIdx\tName\tSize\tVMA\n");
  
  for (int i = 0; i < e_shnum; i++){ //PARA CADA SECAO IMPRIMIR
    if (i == 0){
      print_string("0\t\t00000000\t00000000\n");
    } 
    else {
      int off_set = obter_valor_decimal_do_grupo(buffer, e_shoff + 40 * i, 4);
      print_int(i);
      print_string("\t");
      int contador = 0;
      char caractere;
      caractere = buffer[endereco_shstrtab + off_set + contador];
      
      while (caractere != 0){
        print_char(caractere);
        caractere = buffer[endereco_shstrtab + off_set + contador + 1];
        contador ++;
      }
      int sh_size = 20;
      int sh_addr = 12;
      print_string("\t");
      imprimir_valor_hexa_do_grupo(buffer, e_shoff + 40 * i + sh_size, 4);
      print_string("\t");
      imprimir_valor_hexa_do_grupo(buffer, e_shoff + 40 * i + sh_addr, 4);
      print_string("\n");
    }
  }
  print_string("\n");
}

void imprimir_grupo(unsigned char buffer[], int inicial, int iteracoes){ 
  for (int i = 0; i < iteracoes; i++){
    char destino[50];
    for (int j = 0; j < 50; j ++){
      destino[j] = '\0';
    }
    int aux = buffer[inicial + i];
    converterDecimalParaHexadecimal(aux, destino);
    if (i != iteracoes - 1){
      //printf("%x ", buffer[inicial + i]);
      print_string(destino);
      print_string(" ");

    } else{
      //printf("%x", buffer[inicial + i]);
      print_string(destino);
    }
  }
}

int string_iguais(char string1[], char string2[]){

  if (tamanhoString(string1) != tamanhoString(string2)){//se o tamanho das string for diferente elas sao diferentes
    return 0;
  }

  for (int i = 0; i < tamanhoString(string1); i++){
    if (string2[i] != string1[i]){//se um caractere for diferente as string sao diferentes
      return 0;
    }
  }

  return 1;
}

int encontrar_idx_secao(unsigned char buffer[], int endereco_shstrtab, int e_shoff, int e_shnum, char procurado[]){

  for (int i = 0; i < e_shnum; i++){//para cada secao
      int off_set = obter_valor_decimal_do_grupo(buffer, e_shoff + 40 * i, 4);
      int contador = 0;
      char caractere;
      char nome_secao[50];
      while ( buffer[endereco_shstrtab + off_set + contador] != '\000'){
        caractere = buffer[endereco_shstrtab + off_set + contador];
        nome_secao[contador] = caractere;
        contador ++;
      }
      if (string_iguais(nome_secao, procurado)){
        return i;//se a secao for a symtab, retorno seu index
      }

      for (int j = 0; j < 50; j++){ //resetar a string
        nome_secao[j] = '\0';
      }
  }

  return -1;//se passar por todas as scoes e nao encontrar a .symtab, retorna -1
}

int encontrar_endereco_text(unsigned char buffer[], int endereco_shstrtab, int e_shoff, int e_shnum){

  int idx_text = encontrar_idx_secao(buffer, endereco_shstrtab, e_shoff, e_shnum, ".text");
  
  return obter_valor_decimal_do_grupo(buffer, e_shoff + 40 * idx_text + 16, 4);
}

void imprimir_nome_secao_pelo_index(unsigned char buffer[], int e_shoff, int st_shndx, int endereco_shstrtab){
  int off_set = obter_valor_decimal_do_grupo(buffer, e_shoff + 40 * st_shndx, 4);
  int contador = 0;
  char caractere;
  
  while (buffer[endereco_shstrtab + off_set + contador] != '\000'){
    caractere = buffer[endereco_shstrtab + off_set + contador];
    print_char(caractere);
    contador ++;
  }
}

void imprimir_string_pelo_endereco(unsigned char buffer[], int endereco_strtab, int deslocamento){
  int contador = 0;
  char caractere;
  
  while (buffer[endereco_strtab + deslocamento + contador] != '\000'){
    caractere = buffer[endereco_strtab + deslocamento + contador];
    print_char(caractere);
    contador ++;
  }

}

void copiar_string_pelo_endereco(unsigned char buffer[], int endereco_strtab, int deslocamento, char string[]){
  int contador = 0;
  
  while (buffer[endereco_strtab + deslocamento + contador] != '\000'){
    string[contador] = buffer[endereco_strtab + deslocamento + contador];
    contador ++;
  }
  string[contador] = '\0';
}

long int obter_vma_pelo_nome(unsigned char buffer[], int endereco_shstrtab, int e_shoff, int e_shnum, char procurado[]){

  for (int i = 0; i < e_shnum; i++){//para cada secao
      int off_set = obter_valor_decimal_do_grupo(buffer, e_shoff + 40 * i, 4);
      int contador = 0;
      char caractere;
      char nome_secao[50];
      while (buffer[endereco_shstrtab + off_set + contador] != '\000'){
        caractere = buffer[endereco_shstrtab + off_set + contador];
        nome_secao[contador] = caractere;
        contador ++;
      }
      if (string_iguais(nome_secao, procurado)){//se for a secao q procura-se, retornar seu VMA
        long int vma = obter_valor_decimal_do_grupo(buffer, e_shoff + 40 * i + 12, 4);
        return vma;
      }

      for (int j = 0; j < 50; j++){ //resetar a string
        nome_secao[j] = '\0';
      }
  }

  return -1;//se passar por todas as scoes e nao encontrar a .symtab, retorna -1
}

void imprimir_simbolos(unsigned char buffer[], int e_shoff, int endereco_shstrtab, int e_shnum, char nome_arquivo[]){

  int idx_symtab = encontrar_idx_secao(buffer, endereco_shstrtab, e_shoff, e_shnum, ".symtab");
  int idx_strtab = encontrar_idx_secao(buffer, endereco_shstrtab, e_shoff, e_shnum, ".strtab");
  int sh_offset = 16; //off set a partir do inicio da secao que fornece o endereco da secao no arquivo (tamanho 4 bytes)
  int sh_size = 20; //off set a partir do inicio da secao que fornece o tamanho da respectiva secao (tamanho 4 bytes)
  int endereco_symtab = obter_valor_decimal_do_grupo(buffer, e_shoff + 40 * idx_symtab + sh_offset, 4);
  int endereco_strtab = obter_valor_decimal_do_grupo(buffer, e_shoff + 40 * idx_strtab + sh_offset, 4);
  int tamanho_symtab = obter_valor_decimal_do_grupo(buffer, e_shoff + 40 * idx_symtab + sh_size, 4);

  print_string("\n");
  print_string(nome_arquivo);
  print_string(":\tfile format ELF32-riscv\n\nSYMBOL TABLE:\n");

  for (int i = 1; i < tamanho_symtab/16; i ++){

    //printar o endereco
    imprimir_valor_hexa_do_grupo(buffer, endereco_symtab + 16*i + 4, 4);
    print_string("\t");

    // agora deve-se imprimir a secao a qual o simbolo pertence
    int st_shndx = obter_valor_decimal_do_grupo(buffer, endereco_symtab + 16*i + 14, 2);
    imprimir_nome_secao_pelo_index(buffer, e_shoff, st_shndx, endereco_shstrtab);
    print_string("\t");

    //agora o tamanho
    imprimir_valor_hexa_do_grupo(buffer, endereco_symtab + 16 * i+8, 4);
    print_string("\t");

    //agora o nome
    int deslocamento_do_inicio_da_strtab = obter_valor_decimal_do_grupo(buffer, endereco_symtab + 16*i, 4);
    imprimir_string_pelo_endereco(buffer, endereco_strtab, deslocamento_do_inicio_da_strtab);

    print_string("\n");
  }
}

int verificar_existencia(long int vetor[], int tamanho,  long int termo){
  int maior_indice = -1;
  for (int i = 0; i < tamanho; i++){
    if (vetor[i] == termo){
      maior_indice = i;
    }
  }
  return maior_indice;
}

void imprimir_apelido(unsigned int numero){
  if (numero == 0){
    print_string("zero");
  } else if(numero == 1){
    print_string("ra");
  } else if (numero ==2){
    print_string("sp");
  }  else if (numero ==3){
    print_string("gp");
  } else if (numero ==4){
    print_string("tp");
  } else if (numero ==5){
    print_string("t0");
  } else if (numero ==6){
    print_string("t1");
  } else if (numero ==7){
    print_string("t2");
  } else if (numero == 8){
    print_string("s0");
  } else if (numero ==9){
    print_string("s1");
  } else if (numero ==10){
    print_string("a0");
  } else if (numero ==11){
    print_string("a1");
  } else if (numero ==12){
    print_string("a2");
  } else if (numero ==13){
    print_string("a3");
  } else if (numero ==14){
    print_string("a4");
  } else if (numero ==15){
    print_string("a5");
  } else if (numero ==16){
    print_string("a6");
  } else if (numero ==17){
    print_string("a7");
  } else if (numero ==18){
    print_string("s2");
  } else if (numero ==19){
    print_string("s3");
  } else if (numero ==20){
    print_string("s4");
  } else if (numero ==21){
    print_string("s5");
  } else if (numero ==22){
    print_string("s6");
  } else if (numero ==23){
    print_string("s7");
  } else if (numero ==24){
    print_string("s8");
  } else if (numero ==25){
    print_string("s9");
  } else if (numero ==26){
    print_string("s10");
  } else if (numero ==27){
    print_string("s11");
  } else if (numero ==28){
    print_string("t3");
  } else if (numero ==29){
    print_string("t4");
  } else if (numero ==30){
    print_string("t5");
  } else if (numero ==31){
    print_string("t6");
  }
}

void imprimir_U(int decimal){
    unsigned int mask1 = 0b11111111111111111111000000000000;
    unsigned int imm = decimal & mask1;
    imm = imm>>12;
    unsigned int mask2 = 0b00000000000000000000111110000000;
    unsigned int rd = decimal & mask2;
    rd = rd>>7;

    print_string("\t");
    imprimir_apelido(rd);
    print_string(", ");
    print_int(imm);
}

void imprimir_J(int decimal){
  unsigned int mask19_12 = 0b00000000000011111111000000000000;
  unsigned int mask11 = 0b00000000000100000000000000000000;
  unsigned int mask10_1 = 0b01111111111000000000000000000000;
  unsigned int mask20 = 0b10000000000000000000000000000000;
  unsigned int maskrd = 0b00000000000000000000111110000000;
  unsigned int base = 0b00000000000000000000000000000000;
  unsigned int imm19_12 = decimal & mask19_12;
  unsigned int imm11 = decimal & mask11;
  unsigned int imm10_1 = decimal & mask10_1;
  unsigned int imm20 = decimal & mask20;
  unsigned int rd = decimal & maskrd;
  imm11 = imm11 >> 9;
  imm10_1 = imm10_1 >> 20;
  for (int i = 0; i < 12; i++){
    base = base | imm20;
    imm20 = imm20 >> 1;
  }
  base = base | imm19_12 | imm10_1 | imm11;
  rd = rd>>7;
  print_string("\t");
  imprimir_apelido(rd);
  print_string(", ");
  print_int(base);
}

void imprimir_I1(int decimal){
  unsigned int maskrd = 0b00000000000000000000111110000000;
  unsigned int maskrs = 0b00000000000011111000000000000000;
  unsigned int maskim = 0b11111111111100000000000000000000;
  unsigned int base = 0b00000000000000000000000000000000;

  unsigned int rd = decimal & maskrd;
  unsigned int rs = decimal & maskrs;
  rd = rd >> 7;
  rs = rs >>15;

  int imm = decimal & maskim;
  if (imm < 0){
    base = base | 0b11111111111111111111000000000000;
  }
  imm = imm >> 20;
  base = base | imm;
  print_string("\t");
  imprimir_apelido(rd);
  print_string(", ");
  print_int(base);
  print_string("(");
  imprimir_apelido(rs);
  print_string(")");
}

void imprimir_I2(int decimal){
  unsigned int maskrd = 0b00000000000000000000111110000000;
  unsigned int maskrs = 0b00000000000011111000000000000000;
  unsigned int maskim = 0b11111111111100000000000000000000;
  unsigned int base = 0b00000000000000000000000000000000;

  unsigned int rd = decimal & maskrd;
  unsigned int rs = decimal & maskrs;
  rd = rd >> 7;
  rs = rs >>15;

  int imm = decimal & maskim;
  if (imm < 0){
    base = base | 0b11111111111111111111000000000000;
  }
  imm = imm >> 20;
  base = base | imm;
  print_string("\t");
  imprimir_apelido(rd);
  print_string(", ");
  imprimir_apelido(rs);
  print_string(", ");
  print_int(base);
}

void imprimir_I3(int decimal){
  unsigned int maskrd = 0b00000000000000000000111110000000;
  unsigned int maskrs = 0b00000000000011111000000000000000;
  unsigned int mask_shamt = 0b00000001111100000000000000000000;
  unsigned int base = 0b00000000000000000000000000000000;
  int rd = decimal & maskrd;
  rd = rd >> 7;
  int rs = decimal & maskrs;
  rs = rs >> 15;
  int shamt = decimal & mask_shamt;
  shamt = shamt >> 20;
  base = base | shamt;
  print_string("\t");
  imprimir_apelido(rd);
  print_string(", ");
  imprimir_apelido(rs);
  print_string(", ");
  print_int(base);
}

void imprimir_I1U(int decimal){
  unsigned int maskrd = 0b00000000000000000000111110000000;
  unsigned int maskrs = 0b00000000000011111000000000000000;
  unsigned int maskim = 0b11111111111100000000000000000000;
  unsigned int base = 0b00000000000000000000000000000000;

  unsigned int rd = decimal & maskrd;
  unsigned int rs = decimal & maskrs;
  rd = rd >> 7;
  rs = rs >>15;

  int imm = decimal & maskim;
  imm = imm >> 20;
  base = base | imm;
  print_string("\t");
  imprimir_apelido(rd);
  print_string(", ");
  print_int(base);
  print_string("(");
  imprimir_apelido(rs);
  print_string(")");
}

void imprimir_I2U(int decimal){
  unsigned int maskrd = 0b00000000000000000000111110000000;
  unsigned int maskrs = 0b00000000000011111000000000000000;
  unsigned int maskim = 0b11111111111100000000000000000000;
  unsigned int base = 0b00000000000000000000000000000000;

  unsigned int rd = decimal & maskrd;
  unsigned int rs = decimal & maskrs;
  rd = rd >> 7;
  rs = rs >>15;

  int imm = decimal & maskim;
  imm = imm >> 20;
  base = base | imm;
  imprimir_apelido(rd);
  print_string(", ");
  imprimir_apelido(rs);
  print_string(", ");
  print_int(base);
}

void imprimir_B(int decimal){
  unsigned int maskrs1 = 0b00000000000011111000000000000000;
  unsigned int maskrs2 = 0b00000001111100000000000000000000;
  unsigned int mask11 = 0b00000000000000000000000010000000;
  unsigned int mask4_1 = 0b00000000000000000000111100000000;
  unsigned int mask10_5 = 0b01111110000000000000000000000000;
  unsigned int mask12 = 0b10000000000000000000000000000000;
  unsigned int base = 0b00000000000000000000000000000000;

  int imm11 = decimal & mask11;
  imm11 = imm11<<4;
  int imm10_5 = decimal & mask10_5;
  imm10_5 = imm10_5>>20;
  int imm4_1 = decimal & mask4_1;
  imm4_1 = imm4_1 >> 7;
  int imm12 = decimal & mask12;
  for (int i = 0; i < 20; i++){
    base = base | imm12;
    imm12 = imm12 >> 1;
  }
  base = base | imm4_1 | imm10_5 | imm11;

  unsigned int rs1 = decimal & maskrs1;
  unsigned int rs2 = decimal & maskrs2;
  rs1 = rs1 >> 15;
  rs2 = rs2 >> 20;

  print_string("\t");
  imprimir_apelido(rs1);
  print_string(", ");
  imprimir_apelido(rs2);
  print_string(", ");
  print_int(base);

}

void imprimir_BU(int decimal){
  unsigned int maskrs1 = 0b00000000000011111000000000000000;
  unsigned int maskrs2 = 0b00000001111100000000000000000000;
  unsigned int mask11 = 0b00000000000000000000000010000000;
  unsigned int mask4_1 = 0b00000000000000000000111100000000;
  unsigned int mask10_5 = 0b01111110000000000000000000000000;
  unsigned int mask12 = 0b10000000000000000000000000000000;
  unsigned int base = 0b00000000000000000000000000000000;

  int imm11 = decimal & mask11;
  imm11 = imm11<<4;
  int imm10_5 = decimal & mask10_5;
  imm10_5 = imm10_5>>20;
  int imm4_1 = decimal & mask4_1;
  imm4_1 = imm4_1 >> 7;
  int imm12 = decimal & mask12;

  imm12 = imm12 >> 19;

  base = base | imm4_1 | imm10_5 | imm11;

  unsigned int rs1 = decimal & maskrs1;
  unsigned int rs2 = decimal & maskrs2;
  rs1 = rs1 >> 15;
  rs2 = rs2 >> 20;

  print_string("\t");
  imprimir_apelido(rs1);
  print_string(", ");
  imprimir_apelido(rs2);
  print_string(", ");
  print_int(base);

}

void imprimir_S(int decimal){
  unsigned int maskrs1 = 0b00000000000011111000000000000000;
  unsigned int maskrs2 = 0b00000001111100000000000000000000;
  unsigned int base = 0b00000000000000000000000000000000;
  unsigned int mask4_0 = 0b00000000000000000000111110000000;
  unsigned int mask11_5 = 0b11111110000000000000000000000000;

  int imm4_0 = decimal & mask4_0;
  imm4_0 = imm4_0 >> 7;
  int imm11_5 = decimal & mask11_5;
  if (imm11_5 < 0){//manter o sinal negativo
    base = base | 0b11111111111111111111000000000000;
  }
  imm11_5 = imm11_5 >> 20;
  base = base | imm11_5 | imm4_0;
  
  int rs1 = decimal & maskrs1;
  int rs2 = decimal & maskrs2;
  rs1 = rs1 >> 15;
  rs2 = rs2 >> 20;
  print_string("\t");
  imprimir_apelido(rs2);
  print_string(", ");
  print_int(base);
  print_string("(");
  imprimir_apelido(rs1);
  print_string(")");
}

void imprimir_R(int decimal){
  unsigned int maskrs1 = 0b00000000000011111000000000000000;
  unsigned int maskrs2 = 0b00000001111100000000000000000000;
  unsigned int maskrd =  0b00000000000000000000111110000000;

  int rd = decimal & maskrd;
  int rs1 = decimal & maskrs1;
  int rs2 = decimal & maskrs2;

  rd = rd >> 7;
  rs1 = rs1 >> 15;
  rs2 = rs2 >> 20;

  print_string("\t");
  imprimir_apelido(rd);
  print_string(", ");
  imprimir_apelido(rs1);
  print_string(", ");
  imprimir_apelido(rs2);

}

void decodificar_instrucao(unsigned char buffer[], char binario[], long int decimal){
  char opcode[10];
  for (int i = 0; i < 7; i ++){
    opcode[i] = binario[25 + i];
  }
  opcode[7] = '\0';
  //agora que o opcode foi extraido, devemos verificar a qual grupo pertence a instrucao
  if (string_iguais(opcode, "0110111")){
    print_string("\tlui");
    imprimir_U(decimal);

  } else if(string_iguais(opcode, "0010111")){
    print_string("\tauipc");
    imprimir_U(decimal);

  } else if(string_iguais(opcode, "1101111")){
    print_string("\tjal");
    imprimir_J(decimal);

  } else if(string_iguais(opcode, "1100111")){
    char id[5];
    for (int i = 0; i < 3; i++){
      id[i] = binario[17 + i];
    }
    id[3] = '\0';
    if (string_iguais(id, "000")){
      print_string("\tjalr");
      imprimir_I1(decimal);
    } else{
      print_string("\t<unknown>");
    }
  } else if(string_iguais(opcode, "1100011")){ //TIPO B
    char id[5];
    for (int i = 0; i < 3; i++){
      id[i] = binario[17 + i];
    }
    id[3] = '\0';
    if (string_iguais(id, "000")){
      print_string("\tbeq");
      imprimir_B(decimal);
    } else if (string_iguais(id, "001")){
      print_string("\tbne");
      imprimir_B(decimal);
    } else if (string_iguais(id, "100")){
      print_string("\tblt");
      imprimir_B(decimal);
    } else if (string_iguais(id, "101")){
      print_string("\tbge");
      imprimir_B(decimal);
    } else if (string_iguais(id, "110")){
      print_string("\tbltu");
      imprimir_BU(decimal);
    } else if (string_iguais(id, "111")){
      print_string("\tbgeu");
      imprimir_BU(decimal);
    } else{
      print_string("\t<unknown>");
    }

  } else if (string_iguais(opcode, "0000011")){ //TIPO I 1
    char id[5];
    for (int i = 0; i < 3; i++){
      id[i] = binario[17 + i];
    }
    id[3] = '\0';
    if (string_iguais(id, "000")){
      print_string("\tlb");
      imprimir_I1(decimal);
    } else if (string_iguais(id, "001")){
      print_string("\tlh");
      imprimir_I1(decimal);
    } else if (string_iguais(id, "010")){
      print_string("\tlw");
      imprimir_I1(decimal);
    } else if (string_iguais(id, "100")){
      print_string("\tlbu");
      imprimir_I1U(decimal);
    } else if (string_iguais(id, "101")){
      print_string("\tlhu");
      imprimir_I1U(decimal);
    } else{
      print_string("\t<unknown>");
    }
  } else if (string_iguais(opcode, "0100011")){
    char id[5];
    for (int i = 0; i < 3; i++){
      id[i] = binario[17 + i];
    }
    id[3] = '\0';
    if (string_iguais(id, "000")){
      print_string("\tsb");
      imprimir_S(decimal);
    } else if (string_iguais(id, "001")){
      print_string("\tsh");
      imprimir_S(decimal);
    } else if (string_iguais(id, "010")){
      print_string("\tsw");
      imprimir_S(decimal);
    } else{
      print_string("\t<unknown>");
    }
  } else if (string_iguais(opcode, "0010011")){
    char id[5];
    for (int i = 0; i < 3; i++){
      id[i] = binario[17 + i];
    }
    id[3] = '\0';
    if (string_iguais(id, "000")){
      print_string("\taddi");
      imprimir_I2(decimal);
    } else if (string_iguais(id, "010")){
      print_string("\tslti");
      imprimir_I2(decimal);
    } else if (string_iguais(id, "011")){
      print_string("\tsltiu");
      imprimir_I2U(decimal);
    } else if (string_iguais(id, "100")){
      print_string("\txori");
      imprimir_I2(decimal);
    } else if (string_iguais(id, "110")){
      print_string("\tori");
      imprimir_I2(decimal);
    } else if (string_iguais(id, "111")){
      print_string("\tandi");
      imprimir_I2(decimal);
    } else if (string_iguais(id, "001")){
      char id2[10];
      for (int i = 0; i < 7; i++){
        id2[i] = binario[i];
      }
      id2[7] = '\0';
      if (string_iguais(id2, "0000000")){
        print_string("\tslli");
        imprimir_I3(decimal);
      } else{
        print_string("\t<unknown>");
      }
    } else if (string_iguais(id, "101")){
      char id2[10];
      for (int i = 0; i < 7; i++){
        id2[i] = binario[i];
      }
      id2[7] = '\0';
      if (string_iguais(id2, "0000000")){
        print_string("\tsrli");
        imprimir_I3(decimal);
      } else if (string_iguais(id2, "0100000")){
        print_string("\tsrai");
        imprimir_I3(decimal);
      } else{
        print_string("\t<unknown>");
      }
    } else{
      print_string("\t<unknown>");
    }
  } else if (string_iguais(opcode, "0110011")){//TIPO R

    char id[5];
    for (int i = 0; i < 3; i++){
      id[i] = binario[17 + i];
    }
    id[3] = '\0';

    char id2[10];
    for (int i = 0; i < 7; i++ ){
      id2[i] = binario[i];
    }
    id2[7] = '\0';

    if (string_iguais(id, "000")){
      if (string_iguais(id2, "0000000")){
        print_string("\tadd");
        imprimir_R(decimal);
      } else if (string_iguais(id2, "0100000")){
        print_string("\tsub");
        imprimir_R(decimal);
      } else{
        print_string("\t<unknown>");
      }
    } else if (string_iguais(id, "001")){
      if (string_iguais(id2, "0000000")){
        print_string("\tsll");
        imprimir_R(decimal);
      } else{
        print_string("\t<unknown>");
      }
    } else if (string_iguais(id, "010")){
      if (string_iguais(id2, "0000000")){
        print_string("\tslt");
        imprimir_R(decimal);
      } else{
        print_string("\t<unknown>");
      }
    } else if (string_iguais(id, "011")){
      if (string_iguais(id2, "0000000")){
        print_string("\tsltu");
        imprimir_R(decimal);
      } else{
        print_string("\t<unknown>");
      }
    } else if (string_iguais(id, "100")){
      if (string_iguais(id2, "0000000")){
        print_string("\txor");
        imprimir_R(decimal);
      } else{
        print_string("\t<unknown>");
      }
    } else if (string_iguais(id, "101")){
      if (string_iguais(id2, "0000000")){
        print_string("\tsrl");
        imprimir_R(decimal);
      } else if (string_iguais(id2, "0100000")){
        print_string("\tsra");
        imprimir_R(decimal);
      } else{
        print_string("\t<unknown>");
      }
    } else if (string_iguais(id, "110")){
      if (string_iguais(id2, "0000000")){
        print_string("\tor");
        imprimir_R(decimal);
      } else{
        print_string("\t<unknown>");
      }

    } else if(string_iguais(id, "111")){
      if (string_iguais(id2, "0000000")){
        print_string("\tand");
        imprimir_R(decimal);
      } else{
        print_string("\t<unknown>");
      }
    } else{
      print_string("\t<unknown>");
    }
  } else if (string_iguais(opcode, "0001111")){

    char id[5];//func3
    for (int i = 0; i < 3; i++){
      id[i] = binario[17 + i];
    }
    id[3] = '\0';

    char id3[10]; //pega o do indice 11 ao 7
    for (int i = 0; i < 5; i++ ){
      id3[i] = binario[20 + i];
    }
    id3[5] = '\0';
    
    char id4[10];//pega do indice 19 ao 15
    for (int i = 0; i < 5; i++ ){
      id4[i] = binario[12 + i];
    }
    id4[5] = '\0';

    char id5[10];//pega do indice 31 ao 28
    for (int i = 0; i < 4; i++ ){
      id5[i] = binario[i];
    }
    id5[4] = '\0';

    if (string_iguais(id, "000")){
      if (string_iguais(id3, "00000") && string_iguais(id4, "00000") && string_iguais(id5, "0000")){
        print_string("\tfence");
      }else{
        print_string("\t<unknown>");
      }
    } else if (string_iguais(id, "001")) {

      char id6[10];//pega do indice 27 ao 24
      for (int i = 0; i < 4; i++ ){
        id6[i] = binario[i + 4];
      }
      id6[4] = '\0';

      char id7[10];//pega do indice 23 ao 20
      for (int i = 0; i < 4; i++ ){
        id7[i] = binario[i + 8];
      }
      id7[4] = '\0';

      if (string_iguais(id3, "00000") && string_iguais(id4, "00000") && string_iguais(id5, "0000") && string_iguais(id6, "0000") && string_iguais(id7, "0000")){
        print_string("\tfence.i");
      } else{
        print_string("\t<unknown>");
      }
    } else{
      print_string("\t<unknown>");
    }
  } else if (string_iguais(opcode, "1110011")){
    char id[5];
    for (int i = 0; i < 3; i++){
      id[i] = binario[17 + i];
    }
    id[3] = '\0';
    if (string_iguais(id, "000")){
      char id2[15];
      for (int i = 0; i < 12; i++){
        id2[i] = binario[i];
      }
      id2[12] = '\0';
      if (string_iguais(id2, "000000000000")){
        print_string("\tecall");
      } else if (string_iguais(id2, "000000000001")){
        print_string("\tebreak");
      } else{
        print_string("\t<unknown>");
      }
    } else if (string_iguais(id, "001")){
      print_string("\tcsrrw");
    } else if (string_iguais(id, "010")){
      print_string("\tcsrrs");
    } else if (string_iguais(id, "011")){
      print_string("\tcsrrc");
    } else if (string_iguais(id, "101")){
      print_string("\tcsrrwi");
    } else if (string_iguais(id, "110")){
      print_string("\tcsrrsi");
    } else if (string_iguais(id, "111")){
      print_string("\tcsrrci");
    } else{
      print_string("\t<unknown>");
    }
  } else{
    print_string("\t<unknown>");
  }
}

void imprimir_instrucoes(unsigned char buffer[], long int vma_text, int e_shoff, int endereco_shstrtab, int e_shnum, char nome_arquivo[]){
  //pegar o nome dos rotulos e seus enderecos 
  char rotulos[1000][100];
  char enderecos_hexa[1000][100];
  long int enderecos_int[1000];
  int idx_symtab = encontrar_idx_secao(buffer, endereco_shstrtab, e_shoff, e_shnum, ".symtab");
  int idx_strtab = encontrar_idx_secao(buffer, endereco_shstrtab, e_shoff, e_shnum, ".strtab");
  int idx_text = encontrar_idx_secao(buffer, endereco_shstrtab, e_shoff, e_shnum, ".text");
  int sh_offset = 16; //off set a partir do inicio da secao que fornece o endereco da secao no arquivo (tamanho 4 bytes)
  int sh_size = 20; //off set a partir do inicio da secao que fornece o tamanho da respectiva secao (tamanho 4 bytes)
  int endereco_symtab = obter_valor_decimal_do_grupo(buffer, e_shoff + 40 * idx_symtab + sh_offset, 4);
  int endereco_strtab = obter_valor_decimal_do_grupo(buffer, e_shoff + 40 * idx_strtab + sh_offset, 4);
  int endereco_text = obter_valor_decimal_do_grupo(buffer, e_shoff + 40 * idx_text + sh_offset, 4);
  int tamanho_symtab = obter_valor_decimal_do_grupo(buffer, e_shoff + 40 * idx_symtab + sh_size, 4);
  int tamanho_text = obter_valor_decimal_do_grupo(buffer, e_shoff + 40 * idx_text + sh_size, 4);
  int tamanho_vetor = 0;
  print_string("\n");
  print_string(nome_arquivo);
  print_string(":\tfile format ELF32-riscv\n\n\nDisassembly of section .text:\n");
  for (int i = 1; i < tamanho_symtab / 16; i++){ //PARA CADA SIMBOLO DA SYMTAB
    //pegar o nome do simbolo e colocar na string
    char simbolo[100];
    for (int j = 0; j < 100; j++){
      simbolo[j] = '\0';
    }
    int deslocamento_do_inicio_da_strtab = obter_valor_decimal_do_grupo(buffer, endereco_symtab + 16*i, 4);
    copiar_string_pelo_endereco(buffer, endereco_strtab, deslocamento_do_inicio_da_strtab, simbolo); //coloca o simbolo na string
    copiar_string(simbolo, rotulos[tamanho_vetor]);
    enderecos_int[tamanho_vetor] = obter_valor_decimal_do_grupo(buffer, endereco_symtab + 16*i + 4, 4);
    converterDecimalParaHexadecimal(enderecos_int[tamanho_vetor], enderecos_hexa[tamanho_vetor]);
    tamanho_vetor++;
    //Nesse ponto, ja temos os rotulos e seus enderecos virtuais anotados
    /*Agora devemos iterar a partir do endereco VMA da secao .text, de 4 em 4,
    e comparando o endereco atual da iteracao com os enderecos anotados. Se 
    houver endereco anotado igual o endereco atual, printamos esse novo endereco.*/
  }

  long int contador = vma_text;
  int indice;

  for (int i = 0; i < tamanho_text / 4; i++){ //para cada rotulo teremos um conjunto de instrucoes
    char print_endereco[50];
    for(int k = 0; k < 50; k++){
      print_endereco[k] = '\0';
    }
    if (verificar_existencia(enderecos_int, tamanho_vetor, contador) != -1){
      indice = verificar_existencia(enderecos_int, tamanho_vetor, contador);
      print_string("\n");
      for (int j = 0; j < 8 - tamanhoString(enderecos_hexa[indice]); j ++){
        print_string("0");
      }
      //printf("%s %s:\n", enderecos_hexa[indice], rotulos[indice]);
      print_string(enderecos_hexa[indice]);
      print_string(" ");
      print_string(rotulos[indice]);
      print_string(":\n");
    }
    converterDecimalParaHexadecimal(contador, print_endereco);
    //printf("%s: ", print_endereco);
    print_string(print_endereco);
    print_string(": ");
    imprimir_grupo(buffer, endereco_text + (i * 4), 4);
    //agora devemos imprimir a instrucao associada a esse endereco
    char binario[36];
    long int valor = obter_valor_decimal_do_grupo(buffer, endereco_text + (i*4), 4);
    converterDecimalParaBinario(valor, binario);
    decodificar_instrucao(buffer, binario, valor);
    for (int j = 0; j < 36; j++){
      binario[j] = '\0';
    }
    contador += 4;
    print_string("\n");
  }
}

int main(int argc, char * argv[]){
    
    unsigned char buffer[500000];
    char nome_arquivo[200];

    for (int i = 0; i < tamanhoString(argv[2]); i++){
      nome_arquivo[i] = argv[2][i];
    }

    int arquivo = open(nome_arquivo, O_RDONLY);

    int tamanho_bytes = sizeof(buffer);
    
    read(arquivo, buffer, tamanho_bytes);

    int e_shoff = obter_valor_decimal_do_grupo(buffer, 32, 4); // (texto, posicao inicial, tamanho do grupo)

    int e_shnum = obter_valor_decimal_do_grupo(buffer, 48, 2);

    int e_shstrndx = obter_valor_decimal_do_grupo(buffer, 50, 2);

    int sh_offset = 16;

    int endereco_shstrtab = obter_valor_decimal_do_grupo(buffer, e_shoff + (40 * e_shstrndx) + sh_offset, 4);

    if (string_iguais(argv[1], "-h")){
      imprimir_secoes(buffer, endereco_shstrtab, e_shoff, e_shnum, nome_arquivo);
    } else if (string_iguais(argv[1], "-t")){
      imprimir_simbolos(buffer, e_shoff, endereco_shstrtab, e_shnum, nome_arquivo);
    } else if (string_iguais(argv[1], "-d")){
      long int vma_text = obter_vma_pelo_nome(buffer, endereco_shstrtab, e_shoff, e_shnum, ".text");
      imprimir_instrucoes(buffer, vma_text,e_shoff, endereco_shstrtab, e_shnum, nome_arquivo);
    }
    return 0;
}