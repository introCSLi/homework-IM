
import processing.serial.*;
Serial myPort;        // The serial port
int xPos = 1;         // horizontal position of the graph
int[] serialInArray = new int[3];  // Where we'll put what we receive
int serialCount = 0;    // A count of how many bytes we receive
boolean firstContact = false;        // Whether we've heard from the microcontroller
int A; //size of rings
// for controlling the position of ring
int right;
int left ;


void setup() {
  println(Serial.list());
  String portName = Serial.list()[9];
  myPort = new Serial(this, portName, 9600);
  noFill();
  size(1200, 700);
  int center_x=width/2;    //initial position of center
  int center_y=height/2;  
  //create an array of circles
  for (int i=0; i < myCircleArray.length; i++) {
    myCircleArray[i] = new MovingCircle(center_x, center_y);
  }

}

MovingCircle[] myCircleArray = new MovingCircle[10];

class MovingCircle {

  int max_radius=300;
  int center_x=width/2;
  int center_y=height/2;
  float delay= random(1)*80+5;
  float minSize=random(30, 80);  //minimum size of circles 
  float maxSize=random(100, 500);  //maximum size of circles
  float sizeSpeed = 0.025;  //speed at which circle oscillates
  float size=10;

  MovingCircle(int center_x, int center_y) {
    circle(center_x, center_y, size);
  }

  void update() {
    //oscillating width of the circles
    float linewidth= sin(frameCount*sizeSpeed)*15+16;         
    strokeWeight(linewidth);  

    //oscillating size of circles
    maxSize=map(A, 0, 100, 100, 700);    //maxsize depends on lightmeter
    size = map(sin(frameCount * sizeSpeed), -1.0, 1.0, minSize, maxSize);   


    if (left>50)
    {
      center_x+=(0 - center_x)/delay; //move circles to the left
    }
    if (right>100)
    {
      center_x+= (width-center_x)/delay; //move cirlces to the right
    }

    //make color random
    stroke(random(200, 255), random(200, 255), random(200, 255));
  }
  void drawCircle() {
    circle(center_x, center_y, size);
  }
};

void draw() {
  // Always erase the screen first
  background(0);
  //updating each of the circles
  for (int i=0; i < myCircleArray.length; i++) {  
    myCircleArray[i].update();
    myCircleArray[i].drawCircle();
  }
}
void serialEvent (Serial myPort) {

  // read a byte from the serial port:
  int inByte = myPort.read();
  // if this is the first byte received, and it's an A, clear the serial
  // buffer and note that you've had first contact from the microcontroller.
  // Otherwise, add the incoming byte to the array:
  if (firstContact == false) {
    if (inByte == 'A') {
      myPort.clear();          // clear the serial port buffer
      firstContact = true;     // you've had first contact from the microcontroller
      myPort.write('A');       // ask for more
    }
  } else {
    // Add the latest byte from the serial port to array:
    serialInArray[serialCount] = inByte;
    serialCount++;

    // If we have 3 bytes:
    if (serialCount > 2 ) {
      A = serialInArray[0]; //this specific lightsensor is in range 4-91
      right = serialInArray[1]; //range 20-150
      left = serialInArray[2]; //range 1-96

      // print the values (for debugging purposes only):
      println(A + "\t" + right + "\t" + left);

      // Send a capital A to request new sensor readings:
      myPort.write('A');
      // Reset serialCount:
      serialCount = 0;
    }
  }
}
