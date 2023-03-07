int arduino_pin = A5, leitura_sensor_ldr = 0; //  Lê a entrada do sensor LDR no pino A5 

void setup()  // Configura forma de comunicação serial
{
  Serial.begin(9600);
  pinMode(arduino_pin, INPUT);
}

void loop() // Recebe valor do sensor e atribui à variável 'leitura_sensor_ldr'
{
  leitura_sensor_ldr = analogRead(arduino_pin);
  Serial.println(leitura_sensor_ldr);
  delay(2000);
}
