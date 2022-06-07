// Dimmer - envía bytes a un puerto serie
// por David A. Mellis
// Este ejemplo se encuentra en dominio público.

import processing.serial.*;
Serial port;

void setup() {
  size(256, 150);

  println("Puertos serie disponibles:");
  println(Serial.list());

  // Utilizo el primer puerto de la lista (número 0). Modifique este
  // valor al puerto correspondiente a su placa Arduino. El último
  // parámetro (ej. 9600) corresponde a la velocidad de comunicación.
  // Debe corresponder al valor pasado por Serial.begin() en el boceto
  // Arduino.
  port = new Serial(this, Serial.list()[0], 9600);  

  // Si usted ya sabe el número de puerto usado por su placa Arduino,
  // puede especificarlo como sigue:
  // port = new Serial(this, "COM3", 9600);
}

void draw() {
  // dibuja un gradiente de negro a blanco
  for (int i = 0; i < 256; i++) {
    stroke(i);
    line(i, 0, i, 150);
  }
  // envía el valor actual de mouseX al puerto serie como byte
  port.write(mouseX);
}
