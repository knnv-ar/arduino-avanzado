/*
 MIDI note player
 
 El presente boceto muestra como usar el pin 1 de transmición serie (TX1)
 de la placa Arduino para enviar datos de nota MIDI.
 Si este circuito se conecta a un sintetizador MIDI, este ejecutará 
 las notas F#-0 (0x1E) a F#-5 (0x5A) de forma secuencial.

 
 El circuito:
 * TX1 conectado al pin 5 de un jack MIDI hembra (DIN 5/180º)
 * pin 2 del jack MIDI conectado a masa
 * pin 4 del jack MIDI conectado a +5V a través de un resistor de 220 ohms
 Conecte un extremo de un cable MIDI al jack,
 el otro al puerto MIDI IN de un sintetizador y luego escuche...

 creado 13 Jun 2006
 modificado 2 Jul 2009 por Tom Igoe 

 Este ejemplo se encuentra en dominio público.
 */

void setup() {
  //  la velocidad de conexión MIDI estandard es de 31250 baudios:
  Serial.begin(31250);
}

void loop() {
  // ejecuta las notas de F#-0 (0x1E) a F#-5 (0x5A):
  for (int note = 0x1E; note < 0x5A; note ++) {
    //parámetros: mensaje Note On en canal 1 (0x90), altura de nota (note), velocidad de nota (0x45):
    noteOn(0x90, note, 0x45);
    delay(100);
    //parámetros: mensaje Note On en canal 1 (0x90), altura de nota (note), velocidad de nota (note off = 0x00):
    noteOn(0x90, note, 0x00);   
    delay(100);
  }
}

//  ejecuta una nota MIDI.  No evalua si cmd es mayor a 127, o si
//  los valores de datos son menores a 127:
void noteOn(int cmd, int pitch, int velocity) {
  Serial.print(cmd, BYTE);
  Serial.print(pitch, BYTE);
  Serial.print(velocity, BYTE);
}

