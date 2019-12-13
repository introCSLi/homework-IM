#include "Adafruit_Thermal.h"
#include "file1.h"
#include "file2.h"

#include "SoftwareSerial.h"
#define TX_PIN 6 // Arduino transmit  YELLOW WIRE  labeled RX on printer
#define RX_PIN 5 // Arduino receive   GREEN WIRE   labeled TX on printer

SoftwareSerial mySerial(RX_PIN, TX_PIN); // Declare SoftwareSerial obj first
Adafruit_Thermal printer(&mySerial);     // Pass addr to printer constructor
// -----------------------------------------------------------------------

void setup() {
  Serial.begin(9600); //for communication with processing
  mySerial.begin(19200);  // Initialize SoftwareSerial
  printer.begin();        // Init printer (same regardless of serial type)
  printer.feed(1);
  printer.wake();       // MUST wake() before printing again, even if reset
  printer.setDefault(); // Restore printer to defaults

}
//-----------------------------------------------------------------------
void loop() {

  if ( Serial.available() ) {  //see if there is incoming data
    if (Serial.read() % 2 == 1) //every uneven run will print file 1
    {
      printer.wake();
      printer.printBitmap(file2_width, file2_height, file2_data);
      printer.feed(8);  //print some whitespace 

    }
    else  {  //every even run will print file 2 
      printer.wake();
      printer.printBitmap(file1_width, file1_height, file1_data);
      printer.feed(8);  //print some whitespace
    }
  }
}
