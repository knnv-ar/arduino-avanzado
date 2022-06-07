// Graph

// Este programa toma cadenas de codificación ASCII del puerto
// serie a 9600 baudios y lo grafica. Espera valores del rango
// comprendido entre 0 y 1023, seguido por una nueva linea.

// creado 20 Abr 2005
// actualizado 18 Ene 2008 por by Tom Igoe
// Este ejemplo se encuentra en dominio público.

import processing.serial.*;

Serial myPort;        // Puerto serie
int xPos = 1;         // posición horizontal del gráfico

void setup () {
  // configura la ventana de visualización:
  size(400, 300);        

  // listado de todos los puertos serie disponibles:
  println(Serial.list());
  // seleccion del puerto correspondiente:
  myPort = new Serial(this, Serial.list()[0], 9600);
  // no genera un serialEvent() a menos que obtenga un caracter de salto de linea (\n):
  myPort.bufferUntil('\n');
  // color de fondo inicial:
  background(0);
}
void draw () {
  // todo ocurre en serialEvent()
}

void serialEvent (Serial myPort) {
  // obtiene la cadena ASCII hasta el salto de línea (\n):
  String inString = myPort.readStringUntil('\n');

  if (inString != null) {
    // filtra cualquier caracter de espacio en blanco que pueda haber:
    inString = trim(inString);
    // convierte a decimal y mapea a la altura de la ventana:
    float inByte = float(inString); 
    inByte = map(inByte, 0, 1023, 0, height);

    // dibuja la línea:
    stroke(127, 34, 255);
    line(xPos, height, xPos, height - inByte);

    // al llegar al extremo derecho, vuelve a la izquierda:
    if (xPos >= width) {
      xPos = 0;
      background(0);
    } 
    else {
      // incremento de la posición horizontal:
      xPos++;
    }
  }
}
