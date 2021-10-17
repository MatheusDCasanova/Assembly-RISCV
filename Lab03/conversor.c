
int read(int __fd, const void *__buf, int __n){
  int bytes;
  __asm__ __volatile__(
    "mv a0, %1           # file descriptor\n"
    "mv a1, %2           # buffer \n"
    "mv a2, %3           # size \n"
    "li a7, 63           # syscall read (63) \n"
    "ecall \n"
    "mv %0, a0"
    : "=r"(bytes)  // Output list
    :"r"(__fd), "r"(__buf), "r"(__n)    // Input list
    : "a0", "a1", "a2", "a7"
  );
  return bytes;
}
 
void write(int __fd, const void *__buf, int __n){
  __asm__ __volatile__(
    "mv a0, %0           # file descriptor\n"
    "mv a1, %1           # buffer \n"
    "mv a2, %2           # size \n"
    "li a7, 64           # syscall write (64) \n"
    "ecall"
    :   // Output list
    :"r"(__fd), "r"(__buf), "r"(__n)    // Input list
    : "a0", "a1", "a2", "a7"
  );
}

int tamanhoString(char string[]){

  int tamanho = 0;

  for (int i = 0; string[i] != '\0'; i++){
    tamanho += 1;
  }

  return tamanho;
}

int potencializar(int numero, int potencia){
  if (potencia == 0){
    return 1;
  }

  return numero * potencializar(numero, potencia - 1);
}

void converterUIntParaString(unsigned int decimall){
  char decimal_invertido[36];
  unsigned int aux = decimall;
  int i = 0;
  while (aux != 0){
    
    decimal_invertido[i] = (aux % 10) + '0';

    aux = aux / 10;
    i++;
  }
  decimal_invertido[i] = '\0';
  
  //DESINVERTER
  char decimal[36];

  int inicio = 0;

  int tamanho = tamanhoString(decimal_invertido);

  for (int i = tamanho - 1; i >= 0; i--){
    decimal[inicio] = decimal_invertido[i];
    inicio++;
  }

  decimal[inicio] = '\0';

  write(1, decimal, tamanhoString(decimal));
  write(1,"\n", 1);

}

void converterIntParaString(int decimall){
  char decimal_invertido[36];
  int aux = decimall;
  unsigned int aux2 = decimall;
  int i = 0;
  int eh_negativo = 0;

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
  char decimal[36];

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

  write(1, decimal, tamanhoString(decimal));
  write(1, "\n", 1);

}

int converterDecimalParaInt(char str[36], int tamanho){
  int decimal = 0;

  if (str[0] == '-'){ //se for negativo comeca a converter a partir de str[1] e dps multiplica por -1
    for (int i = 1; i < tamanho; i++){
      decimal += (str[i] - 48) * potencializar(10, tamanho - i - 1);
    }
    decimal = decimal * -1;
  } else{
    for (int i = 0; i < tamanho; i++){
      decimal += (str[i] - 48) * potencializar(10, tamanho - i - 1);
    }
  }

  return decimal;
}

int converterHexadecimalParaIntDecimal(char str[36], int tamanho){
  int decimal = 0;

  for (int i = 2; i < tamanho; i++){//comeca em str 2 por causa do 0x
    if (str[i] < 60){
      decimal += (str[i] - 48) * potencializar(16, tamanho - i - 1);
    } else{
      decimal += (str[i] - 87) * potencializar(16, tamanho - i - 1);
    }
  }

  return decimal;
}

void trocarEndianes(char hexadecimal[]){

  int tamanho = tamanhoString(hexadecimal);

  char hexadecimal_trocado[36];
  hexadecimal_trocado[0] = '0';
  hexadecimal_trocado[1] = 'x';

  int inicio = 2;

  for (int i = tamanho - 1;  i >= 2; i = i - 2){
    if (hexadecimal[i-1] != 'x'){
      hexadecimal_trocado[inicio] = hexadecimal[i-1];
    } else{
      hexadecimal_trocado[inicio] = '0';
    }
    hexadecimal_trocado[inicio + 1] = hexadecimal[i];
    inicio = inicio + 2;
  }
  
  hexadecimal_trocado[inicio] = '\0';

  tamanho = tamanhoString(hexadecimal_trocado);

  while(tamanho < 10){
    hexadecimal_trocado[inicio] = '0';
    inicio++;
    tamanho++;
  }

  hexadecimal_trocado[inicio] = '\0';

  tamanho = tamanhoString(hexadecimal_trocado);

  unsigned int decimal = converterHexadecimalParaIntDecimal(hexadecimal_trocado, tamanho);

  converterUIntParaString(decimal);
}

void converterDecimalParaHexadecimal(unsigned int decimal){
  char hexadecimal_invertido[36];
  unsigned int aux = decimal;
  int i = 0;
  while (aux != 0){
    
    if (aux % 16 < 10){
      hexadecimal_invertido[i] = (aux % 16) + '0';
    } else{
      hexadecimal_invertido[i] = (aux % 16) + '40' + 39; //dar a letra respectiva ao resto
    }
    aux = aux / 16;
    i++;
  }
  hexadecimal_invertido[i] = '\0';
  

  //DESINVERTER E ADICIONAR 0X
  char hexadecimal[36];

  hexadecimal[0] = '0';
  hexadecimal[1] = 'x';

  int inicio = 2;

  int tamanho = tamanhoString(hexadecimal_invertido);

  for (int i = tamanho - 1; i >= 0; i--){
    hexadecimal[inicio] = hexadecimal_invertido[i];
    inicio++;
  }

  hexadecimal[inicio] = '\0';

  write(1, hexadecimal, tamanhoString(hexadecimal));
  write(1, "\n", 1);
  //VER ENDianness trocado

  trocarEndianes(hexadecimal);
}



void converterDecimalParaBinario(unsigned int decimal){ //IGNORANDO O SINAL

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
  char binario[36];

  binario[0] = '0';
  binario[1] = 'b';

  int inicio = 2;

  int tamanho = tamanhoString(binario_invertido);

  for (int i = tamanho - 1; i >= 0; i--){
    binario[inicio] = binario_invertido[i];
    inicio++;
  }

  binario[inicio] = '\0';

  write(1, binario, tamanhoString(binario));
  write(1, "\n", 1);

}
 
int main()
{
  char str[36];
  int n = read(0, str, 35);

  str[tamanhoString(str) - 1] = '\0';

  if (str[0] != '0'){ //se a entrada for um decimal 
    int decimal = converterDecimalParaInt(str, tamanhoString(str));
    unsigned int decimal_sem_sinal = decimal; //representacao sem sinal
    converterDecimalParaBinario(decimal_sem_sinal);
    converterIntParaString(decimal);
    converterDecimalParaHexadecimal(decimal_sem_sinal);
  } else{
    int decimal = converterHexadecimalParaIntDecimal(str, tamanhoString(str));
    unsigned int decimal_sem_sinal = decimal;
    converterDecimalParaBinario(decimal_sem_sinal);
    converterIntParaString(decimal);
    write(1, str, tamanhoString(str));
    write(1, "\n", 1);
    trocarEndianes(str);
  }
  return 0;
}
 
void _start(){
  main();
}
