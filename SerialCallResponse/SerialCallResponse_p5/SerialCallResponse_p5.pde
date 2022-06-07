import processing.serial.*;

int bgcolor;                 // color de fondo
int fgcolor;                 // color de relleno
Serial myPort;                       // puerto serie
int[] serialInArray = new int[3];    // array de recepción serie de datos
int serialCount = 0;                 // contador de bytes serie recibidos
int xpos, ypos;                      // posición inicial del círculo
boolean firstContact = false;        // primer contacto con el microcontrolador

void setup() {
  size(256, 256);
  noStroke();

  // determina la posición inicial del círculo
  xpos = width/2;
  ypos = height/2;

  // listado de puertos serie:
  println(Serial.list());

  // determina el puerto a usar:
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);
}

void draw() {
  background(bgcolor);
  fill(fgcolor);
  // dibuja el círculo:
  ellipse(xpos, ypos, 20, 20);
}

void serialEvent(Serial myPort) {
  // lee un byte del puerto serie:
  int inByte = myPort.read();
  // si este es el primer byte recibido, y es una A,
  // limpia el buffer serie y establece que se ha
  // llevado a cabo el primer contacto con el microcontrolador.
  // De otra manera, agrega el byte entrante al array:
  if (firstContact == false) {
    if (inByte == 'A') {
      myPort.clear();          // limpia el buffer
      firstContact = true;     // primer contacto establecido
      myPort.write('A');       // pide más datos
    }
  } else {
    // agrega el último byte del puerto serie al array:
    serialInArray[serialCount] = inByte;
    serialCount++;

    // si tenemos 3 bytes:
    if (serialCount > 2 ) {
      xpos = serialInArray[0];
      ypos = serialInArray[1];
      fgcolor = serialInArray[2];

      // imprime los valores (por razones de depuración):
      println(xpos + "\t" + ypos + "\t" + fgcolor);

      // envía una A capital A para solicitar nuevas lecturas de sensor:
      myPort.write('A');
      // restablece serialCount:
      serialCount = 0;
    }
  }
}
