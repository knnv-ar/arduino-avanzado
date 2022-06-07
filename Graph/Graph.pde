/*
 Graph

 Un ejemplo simple de comunicación entre Arduino y el ordenador:
 el valor de la entrada analógica 0 se envía al puerto serie. Los bytes
 son enviados uno tras otro (de forma serial) desde la placa Arduino al
 ordenador.
 
 Puede usar el monitor serial Arduino para observar los valores de los datos
 enviados, o a través de Processing, Pd, Max o cualquier otra aplicación
 capaz de leer datos de puertos serie. 
 
 El circuito:
 Cualquier sensor en la entrada analógica de pin 0.
  
 creado 2006 por David A. Mellis
 modificado 14 Abr 2009 por Tom Igoe y Scott Fitzgerald
 
 Este ejemplo se encuentra en dominio público.
*/

void setup() {
  // inicio de comunicación serial:
  Serial.begin(9600);
}

void loop() {
  // envía el valor de la entrada analógica 0:
  Serial.println(analogRead(A0));
  // tiempo de espera para estabilizar el DAC: 
  delay(10);
}
