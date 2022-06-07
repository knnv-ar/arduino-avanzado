//  MultiColorMixer

import processing.serial.*;

float redValue = 0;        // valor rojo
float greenValue = 0;      // valor verde
float blueValue = 0;       // valor azul

Serial myPort;

void setup() {
  size(200, 200);
  // listado de puertos serie disponibles:
  println(Serial.list());
  // puerto serie seleccionado:
  myPort = new Serial(this, Serial.list()[0], 9600);
  // no genera un serialEvent() a menos que obtenga un caracter de  nueva linea:
  myPort.bufferUntil('\n');
}

void draw() {
  // determina el color de fondo con las variables de color:
  background(redValue, greenValue, blueValue);
}

void serialEvent(Serial myPort) { 
  // obtiene la cadena ASCII:
  String inString = myPort.readStringUntil('\n');

  if (inString != null) {
    // elimina culquier caracter de espacio en blanco:
    inString = trim(inString);
    // separa la cadena en las comas y convierte las
    // resultantes subcanedas en enteros de array:
    float[] colors = float(split(inString, ","));
    // si el array tiene al menos 3 elementos, hemos
    // obtenido los datos necesarios. Ingresa los 
    // números en las cariables de color:
    if (colors.length >=3) {
      // mapea las variables de color al rango 0-255:
      redValue = map(colors[0], 0, 1023, 0, 255);
      greenValue = map(colors[1], 0, 1023, 0, 255);
      blueValue = map(colors[2], 0, 1023, 0, 255);
    }
  }
}
