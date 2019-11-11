import processing.sound.*; //library used to process sounds
Amplitude amp;

SoundFile file; 
void setup() {
  size(800, 800, P3D);
  smooth(8);
  file= new SoundFile(this, "GW.wav");  //sound that is generated from the data collected from the first observed graviational wave, resulting from the merging of two neutron stars
 // file= new SoundFile(this, "beethoven-short.mp3");  //from beethoven 5th symphony, the opening part
  amp = new Amplitude(this);
  amp.input(file);
  file.play();
}
void draw() {
  //println(amp.analyze());     //to check what the range of the amplitude is
  float position = map(amp.analyze(), 0, 0.4, 0, width);   //position of the center of the lights, maps amplitude to width
  float spheresize = map(amp.analyze(), 0, 0.4, 0.35, 0.7);  //maps the amplitude to the size of the sphere
  background(0); 
  pointLight(0, 0, 255, position, position, 32);  //light left up
  pointLight(0, 0, 255, width - position, height - position, 32);  //light right down
  pointLight(0, 255, 0, position, height- position, 32);  //light left down
  pointLight(255, 0, 0, width - position, position, 32);  //light right up
  noStroke();
  pushMatrix();
  translate(width * 0.5, height * 0.5, -width * spheresize);      
  sphere(width * spheresize);    //size of sphere depends on amplitude
  popMatrix();
}
