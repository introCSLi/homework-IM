import processing.serial.*;  //for serial communication with arduino
import processing.sound.*; 
PImage img;//for including the logo
SoundFile file; //file for sound played when new question appears
Serial myPort;  //create the serial port
AudioIn in;  //audioinput from microphone
Amplitude amp;
float angle;   //angle for rotating circle
PFont f; //normal font used
boolean showInstruction=true; //before the recording starts, instruction is shown
int startTime; //to record the time when the recording starts
int run; //how many runs is the program in 

//booleans for displaying the questions once only
boolean hasBeenDrawn1=false; 
boolean hasBeenDrawn2=false;
boolean hasBeenDrawn3=false;

//questions
String question1= "Question 1: how did your friendship begin?";
String question2= "Question 2: what is your favourite memory together?";
String question3= "Question 3: what do you appreciate about each other?";


void setup() {
  printArray(Serial.list()); 
  //change the 0 to a 1 or 2 etc. to match your port
  myPort = new Serial(this, Serial.list()[5], 9600); //creates the serial port
  file= new SoundFile(this, "sound.wav"); //the piano sound played after each question
  img = loadImage("logo.png");//loading the logo
  stroke(0);
  f = createFont("Avenir", 32);  //creating the font, setting font size
  textFont(f);      // here the fontsize is set
  background(255); //make background white
  fill(0);//make the text black
  fullScreen();   //make it full screen
  // Create the Input stream
  in = new AudioIn(this, 0); 
  amp = new Amplitude(this);
  amp.input(in);
}      

void draw() {
  if (showInstruction==true) {
    background(255);
    image(img, width/2, height/2, 500, 300);
    text("welcome to the friendship booth. you have one minute to answer each question. clap your hands to start.", width/4, height/4, width/1.6, height);
    //the condition for when the program starts
    //print(amp.analyze());
    //print("\n");
    if (amp.analyze()>0.4)   //if the amplitute exceeds a certain level (caused by clap), start the program
    {
      startTime=millis();
      background(255);
      showInstruction=false;
    }
    return; //prevents the following code from running, starts again from beginning
  }
  timer(); //display the questions (question changes after every minute)
  pattern(); //start drawing the pattern
}

int timeSinceStart() //helper method to calculate the time since the button was first pressed
{
  return millis()-startTime;
}

void timer() //helper method to display the questions (question changes after every minute)
{

  if (timeSinceStart()<40000 && timeSinceStart()>0) { //first minute
    if (hasBeenDrawn1==false) { //boolean to ensure that this text is only drawn once. Since background is not repeatedly drawn, the text keeps being shown. 
      file.play(); //play sound each time a question appears
      text(question1, width/4, height/7, width/1.2, height);
      hasBeenDrawn1=true;
    }
  } else if (timeSinceStart()<80000 && timeSinceStart()>40000) {  //second minute
    if (hasBeenDrawn2==false) { //ensures that this text is only drawn once. Since background is not repeatedly drawn, the text keeps being shown. 
      file.play(); //play sound each time a question appears
      //redraw the old question in white to "erase" it , as I am not redrawing the background
      fill(255); //set color to white
      noStroke(); //so that the rectangle stroke is not visible
      rect(width/4, height/7, 800, 60); //the size of the rectangle
      stroke(0); //so that the inner drawing of the pattern still works, better to set here than in draw loop since only done once
      fill(0);//so that the text color is back to black 
      text(question2, width/4, height/7, width/1.2, height);
      hasBeenDrawn2=true;
    }
  } else if (timeSinceStart()<120000 && timeSinceStart()>80000) { //third minute
    if (hasBeenDrawn3==false) { //ensures that this text is only drawn once. Since background is not repeatedly drawn, the text keeps being shown. 
      file.play();//play sound each time a question appears
      fill(255);
      noStroke();
      rect(width/4, height/7, 800, 60);
      stroke(0);//so that the inner drawing of the pattern still works, better to set here than in draw loop since only done once
      fill(0); //so that the text color is black 
      text(question3, width/4, height/7, width/1.2, height);
      hasBeenDrawn3=true;
    }
  } else if (timeSinceStart()>120000)
  {
    fill(255); 
    noStroke();
    rect(width/4, height/7, 800, 60); //cover the question and save the image
    stroke(0);//so that the inner drawing of the pattern still works, better to set here than in draw loop since only done once
    fill(0); //so that the text color is black 

    file.play();//play sound each time a question appears
    run+=1; //increase the run counter
    toArduino(); //send run to Arduino
    restart(); //restart the program after time has ended
  }
}

void pattern() //function for drawing the sound pattern
{
  angle+=0.05; //determines how "fast" the circle is drawn
  float radius = map(amp.analyze(), 0, 0.15, 20, height/2); //maps amplitute to the radius
  noFill();
  circle(width/2, height/2, radius/2); //draws the inner circles
  pushMatrix();
  translate(width/2, height/2);  //so that it rotates around the center
  rotate(radians(angle));
  line( 0, 50, 0, radius);
  strokeWeight(0.5);
  fill(0); 
  circle( 0, radius, radius*0.05);  //position of circles depends on amplitude, size of circle increases as amplitude increases
  popMatrix();
}

void restart() //restart the program after time ends
{
  //resetting all variables
  showInstruction=true;
  hasBeenDrawn1=false; 
  hasBeenDrawn2=false;
  hasBeenDrawn3=false;
}

void toArduino() { //to let arduino know which receipt to print
  myPort.write(run); 
}

//------------------------------------------------------------------------
/* //my failed attempt to communicate the image to arduino directly
 void imageConversion() { //this converts the final screenshot into a serial stream for arduino
 int bytesOnLine=0; //for formatting 
 imgfile = loadImage("file.png"); //the final screenshot
 imgfile.loadPixels(); 
 imgfile.resize(380, 400); //resize to fit receipt size
 
 // iterate over image-pixels
 
 for (int i=0; i<imgfile.pixels.length; i++ ) {
 // get the color
 int col = imgfile.pixels[i];
 if (brightness(col) < threshold) {
 if (bytesOnLine<10) {
 myPort.write("0xFF");
 myPort.write(",");
 bytesOnLine++;
 } else if (bytesOnLine>=10)
 {
 myPort.write(0xFF);
 myPort.write(",");
 // print("\n");
 bytesOnLine=0;
 }
 } else {
 if (bytesOnLine<10) {
 myPort.write("0x00");
 myPort.write(",");
 bytesOnLine++;
 } else if (bytesOnLine>=10)
 {
 myPort.write("0x00");
 myPort.write(",");
 myPort.write("\n");
 bytesOnLine=0;
 }
 }
 }
 }
 */
