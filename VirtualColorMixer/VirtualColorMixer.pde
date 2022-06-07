/*
 Virtual Color Mixer
 
 Este ejemplo lee 3 sensores analógicos y envía sus valores de forma serial.
 Cualquier otra aplicación puede tomar sus valores y cambiar el color de fondo
 de una pantalla.
 
 El circuito:
 * tres sensores analógicos conectados a A0, A1 y A2
 
 creado 2 Dec 2006 por David A. Mellis
 modificado 4 Sep 2010 por Tom Igoe y Scott Fitzgerald
 
 Este ejemplo se encuentra en dominio público.
*/

const int redPin = A0;	  // sensor que controla el color rojo
const int greenPin = A1;  // sensor que controla el color verde
const int bluePin = A2;	  // sensor que controla el color azul

void setup() {
  Serial.begin(9600);
}

void loop() {
  Serial.print(analogRead(redPin));
  Serial.print(",");
  Serial.print(analogRead(greenPin));
  Serial.print(",");
  Serial.println(analogRead(bluePin));
}
