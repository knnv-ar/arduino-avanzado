/*
  Physical Pixel
 
 Ejemplo de recepción de datos serie en la placa Arduino provenientes
 de un ordenador. En este caso, la placa enciende el LED del pin 13
 cuando recibe el caracter 'H', y lo apaga cuando recibe 'L'.
 
 Los datos pueden ser enviados desde el monitor serie de Arduino, o
 desde otras aplicaciones como Processing , Adobe Flash, Pd, Max, etc.
 
 El circuito:
 * LED en el pin 13 existente en la placa Arduino
 
 creado 2006 por David A. Mellis
 modificado 14 Abr 2009 por Tom Igoe and Scott Fitzgerald
 
 Este ejemplo se encuentra en dominio público.
*/

const int ledPin = 13; // pin 13 para el LED
int incomingByte;      // varible para datos serie de byte entrantes

void setup() {
  // inicio de comunicación serie:
  Serial.begin(9600);
  // pin de LED como salida sigital:
  pinMode(ledPin, OUTPUT);
}

void loop() {
  // comprueba si hay datos serie entrantes:
  if (Serial.available() > 0) {
    // lee el byte más antiguo del buffer serie:
    incomingByte = Serial.read();
    // si es una H mayúscula (ASCII 72), enciende el LED:
    if (incomingByte == 'H') {
      digitalWrite(ledPin, HIGH);
    } 
    // si es una L mayúscula (ASCII 76) apaga el LED:
    if (incomingByte == 'L') {
      digitalWrite(ledPin, LOW);
    }
  }
}
