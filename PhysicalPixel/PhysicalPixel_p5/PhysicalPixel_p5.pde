// Physical Pixel

// Demuestra cómo enviar datos a una placa Arduino para encender
// un LED cuando el cursor se encuentre sobre un cuadrado y apagar
// dicho LED cuando no se encuentre sobre el cuadrado. 

// creado 2003-4
// basado en ejemplos de Casey Reas y Hernando Barragan
// modificado 18 Ene 2009 por Tom Igoe
// Este ejemplo se encuentra en dominio público.

import processing.serial.*; 

float boxX;
float boxY;
int boxSize = 20;
boolean mouseOverBox = false;

Serial port; 

void setup() {
  size(200, 200);
  boxX = width/2.0;
  boxY = height/2.0;
  rectMode(RADIUS); 

  // Listado de todos los puertos serie disponibles.
  println(Serial.list()); 

  // Apertura del puerto donde está conectado la placa Arduino) 
  // Asegurese de que la velocidad del puerto de Arduino coincida
  // con esta: 9600 baudios
  port = new Serial(this, Serial.list()[1], 9600);
}

void draw() { 
  background(0);

  // evaluo si el cursor se encuentra dentro del cuadrado: 
  if (mouseX > boxX-boxSize && mouseX < boxX+boxSize && 
    mouseY > boxY-boxSize && mouseY < boxY+boxSize) {
    mouseOverBox = true;  
    // dibuja un contorno y cambia su color:
    stroke(255); 
    fill(153);
    // envía un caracter 'H' para indicar que el mouse se 
    // encuentra sobre el cuadrado:
    port.write('H');
  } else {
    // el cuadrado regresa a su estado inactivo:
    stroke(153);
    fill(153);
    // envía un caracter 'L' para apagar el LED: 
    port.write('L');      
    mouseOverBox = false;
  }
  // dibuja el cuadrado
  rect(boxX, boxY, boxSize, boxSize);
}
