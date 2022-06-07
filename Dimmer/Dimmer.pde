/*
  Dimmer
 
 En este caso demuestra el envío de datos de un ordenador a una placa Arduino,
 para controlar la intensidad de brillo de un LED.  Los datos son enviados
 en bytes individuales, con un rango de 0 a 255. Arduino lee dichos bytes y
 los usa para modificar la intensidad de brillo de un LED.
 
 El circuito:
 LED conectado del pin 9 a masa.
 Conexión serie a Processing, Pd, Cycling74 Max/MSP o Max5, o cualquier otra aplicación.
 Para ejemplos aplicados a OpenFrameworks, Puredata o Cycling74 Max5 ver:
 http://www.ennuigo.com/?p=409
 
 creado 2006 por David A. Mellis
 modificado 14 Abr 2009 por Tom Igoe and Scott Fitzgerald
 
 Este ejemplo se encuentra en dominio público.
*/

const int ledPin = 9;      // pin de conexión del LED

void setup() {
  // inicio de comunicación serie:
  Serial.begin(9600);
  // inicio de ledPin como salida:
  pinMode(ledPin, OUTPUT);
}

void loop() {
  byte brightness;

  // evalua si se han enviado datos desde el ordenador vía alguna aplicación:
  if (Serial.available()) {
    // lee el byte más reciente (de rango 0 a 255):
    brightness = Serial.read();
    // determina la intensidad de brillo del LED:
    analogWrite(ledPin, brightness);
  }
}
