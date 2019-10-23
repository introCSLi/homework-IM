PImage src;
int threshold = 110;
color lips = color(102, 0, 0);
color black = color(0, 0, 0);
FadeColorTimer fc;

void setup() {
  // basic settings
  fc = new FadeColorTimer( color(255, 255, 255), color(255, 0, 0), 4000, 1000); //start from white and fade to red
  size(400, 600);


  // load an image
  src = loadImage("A.jpeg");
  // resize
  src.resize(140, 180);
  // load piyels of source-image
  src.loadPixels();
}

void draw() {

  fill(fc.c()); // use current color
  ellipse(width/2, height/2, 400, 600); 

  //draw nose (two black dots)
  fill(black);
  ellipse(width/2, height/2-1, 8, 4);
  ellipse(width/2-20, height/2, 8, 4);
  
  // iterate over image-pixels
  for (int i=0; i<src.pixels.length; i++ ) {
    // get the color
    int col = src.pixels[i];
//fill with different, randomly changing colors depending on brightness of the original pixels
    if (brightness(col) < threshold) {
      int x = i%src.width * 3;
      int y = i/src.width * 3 +3;
      fill(color(random(0, 150), random(0, 50), random (0, 10))); 
      rect(x, y, 5, 5);
    } else if (brightness(col) >=threshold) {
      int x = i%src.width * 3;
      int y = i/src.width * 3 +3;
      fill(color(random(200, 255), random(150, 210), random (50, 180)));
      text("li", x, y);
    }
  }
  stroke(black);
  src.updatePixels();
  //draw moving lips (illusion of moving by changing size of ellipse)
  fill(lips);
  float w=random(30, 50);
  float h=random(0, 20);
  ellipse(width/2-10, height/2+30, w, h);
  delay(80);
}

void keyReleased() {
  color cr = color(random(255), random(255), random(255));
  // change the target color to a random color (and restart timer)
  fc.set(cr);
}

//this code is from https://forum.processing.org/two/discussion/20861/change-between-colors-over-time
class FadeColorTimer {
  color c1, c2, c;
  int start, duration;
  FadeColorTimer(color _c1, color _c2, int _start, int _duration) {
    c = _c1;
    c1 = _c1;
    c2 = _c2;
    start = _start;
    duration = _duration;
  }
  void set(color _c2) {
    set(c, _c2, millis(), duration);
  }
  void set(color _c2, int _duration) {
    set(c, _c2, millis(), _duration);
  }
  void set(color _c2, int _start, int _duration) {
    set(c, _c2, _start, _duration);
  }
  void set(color _c1, color _c2, int _start, int _duration) {
    c1 = _c1;
    c2 = _c2;
    start = _start;
    duration = _duration;
  }
  void update() {
    println(c1, c2, map(millis(), start, start+duration, 0.0, 1.0));
    c = lerpColor( c1, c2, map(millis(), start, start+duration, 0.0, 1.0));
  }
  color c() {
    this.update();
    return c;
  }
}
