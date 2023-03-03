#include <WiFiEsp.h>

char ssid[] = "nome_da_rede_wifi"; // nome da rede Wi-Fi
char pass[] = "senha_wifi"; // senha da rede Wi-Fi

IPAddress server(192, 168, 1, 100); // endereço IP da lâmpada inteligente

WiFiEspClient client; // cria um cliente Wi-Fi

int ldrPin = A0; // pino analógico usado para ler a intensidade da luz

void setup() {
  Serial.begin(9600);
  pinMode(ldrPin, INPUT);
  WiFi.begin(ssid, pass); // conecta-se à rede Wi-Fi

  while (WiFi.status() != WL_CONNECTED) { // espera a conexão Wi-Fi
    delay(500);
    Serial.print(".");
  }
  
  Serial.println("");
  Serial.println("Conectado à rede Wi-Fi");
}

void loop() {
  int ldrValue = analogRead(ldrPin); // lê o valor do sensor de luz

  if (ldrValue < 500) { // se a luz estiver fraca
    if (client.connect(server, 80)) { // conecta-se à lâmpada inteligente
      client.print("GET /ligar_lampada HTTP/1.1\r\n"); // envia comando para ligar a lâmpada
      client.print("Host: 192.168.1.100\r\n"); // endereço IP da lâmpada
      client.print("Connection: close\r\n\r\n");
      delay(100);
      client.stop(); // desconecta-se da lâmpada
    }
  } else { // se a luz estiver forte
    if (client.connect(server, 80)) { // conecta-se à lâmpada inteligente
      client.print("GET /desligar_lampada HTTP/1.1\r\n"); // envia comando para desligar a lâmpada
      client.print("Host: 192.168.1.100\r\n"); // endereço IP da lâmpada
      client.print("Connection: close\r\n\r\n");
      delay(100);
      client.stop(); // desconecta-se da lâmpada
    }
  }
  delay(1000); // espera 1 segundo antes de fazer a próxima leitura do sensor de luz
}
