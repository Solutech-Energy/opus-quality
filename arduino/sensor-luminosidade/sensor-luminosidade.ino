int lm35_pin = A4, leitura_lm35 = 0;
float temperatura;

int ldr_pin = A0, leitura_ldr = 0;


void setup() 
{
  //Iniciando o Serial na velocidade de 9600
  Serial.begin(9600);
  //Ajustando a porta A3 do 
}
 
void loop() 
{

  leitura_lm35 = analogRead(lm35_pin);
  temperatura = leitura_lm35 * (5.0/1023) * 100;
  int luminosidade = analogRead(ldr_pin);

  Serial.print(temperatura);
  Serial.print(";");
  Serial.println(luminosidade);
  
//Espera  1 segundo para rodar o código denovo
 delay(1000);
}
