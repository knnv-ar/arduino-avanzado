/*
  ASCII table
 
 Imprime valores byten en todos los formatos posibles:  
 * como binario crudo
 * como decimal codificado en ASCII, hex, octal, y binario
 
 Para profundizar sobre ASCII, ver http://www.asciitable.com y http://es.wikipedia.org/wiki/ASCII
 
 El circuito:  No se necesita más que la placa Arduino.
 
 creado 2006 por Nicholas Zambetti 
 modificado 18 Ene 2009 por Tom Igoe
 
 Este ejemplo se encuentra en dominio público.
*/

// primer caracter ASCII visible '!' es el número 33:
int thisByte = 33; 
// también puede escribir caracteres  ASCII con comillas simples.
// por ej. '!' equivale a 33, por lo tanto podría usar:
// int thisByte = '!';  

void setup() { 
  Serial.begin(9600); 
  // imprime el título 
  Serial.println("Tabla ASCII ~ Mapa de caracteres"); 
} 

void loop() { 
  // imprime el valor sin alteraciones, por ej. la versión cruda binaria del byte
  // El Monitor Serie interpreta todos los bytes como ASCII, por lo tanto
  // el número 33 aparecerá como '!' 
  Serial.print(thisByte, BYTE);    

  Serial.print(", dec: "); 
  // imprime el valor como cadena decimal (base 10) de codificación ASCII.
  // El formato "decimal" es elegido por defecto en Serial.print() y
  // Serial.println(), por lo tanto no se necesita ingresar el parámetro.
  Serial.print(thisByte);      

  // Pero se recomienda declararlo por razones de depuración:
  // Serial.print(thisByte, DEC);  

  Serial.print(", hex: "); 
  // imprime el valor como cadena hexadecimal (base 16):
  Serial.print(thisByte, HEX);     

  Serial.print(", oct: "); 
  // imprime el valor como cadena octal (base 8):
  Serial.print(thisByte, OCT);     

  Serial.print(", bin: "); 
  // imprime el valor como cadena binaria (base 2):
  // también imprime nueva linea:
  Serial.println(thisByte, BIN);   

  // si se ha impreso el último caracter '~' o 126, se mantiene en el bucle while: 
  if(thisByte == 126) {     // también puede usar: if (thisByte == '~') {
    // Este bucle dura para siempre y no hace nada más.
    while(true) { 
      continue; 
    } 
  } 
  // incrementa la variable thisByte
  thisByte++;  
}
