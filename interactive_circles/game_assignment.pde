void setup() {
  background(255);
  size(1200, 700);
}

MovingCircle myCircle = new MovingCircle(25, 72);


class MovingCircle {

  int max_radius=300;
  int max_linewidth=100;
  int center_x=width/2;
  int center_y=height/2;


  MovingCircle(center_x, center_y) {
    float radius = random(1)*max_radius;
    float linewidth= random(1)*max_linewidth;
    float delay= random(1)*100+5;
  }

  void update() {
    center_x+=(mouseX - center_x)/delay;
    center_y+= (mouseY - center_y)/delay;
    float scale=sin(millis());
    print(scale);
    color(0);
  }

  void drawCircle() {
  circle(center_x, center_y, scale);
  }
  
} 
}
