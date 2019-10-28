void setup() {
  size(500, 500, P3D);
  int lines=20;
  background(255, 255, 255);

  for (int i=0; i<lines; i++) {
    float weight= random(30);
    float x1=random(500);
    float x2=random(500);
    float y1=random(500);
    float y2=random(500);
    strokeWeight(weight); 
    line(x1, x2, y1, y2);
  }
}
