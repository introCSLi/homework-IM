void setup() {

  size(700, 500);
  background(255, 255, 255);
  noFill();

  int x=0;
  int y=0;

  //creating main frame of squares
  strokeWeight(1.3);
  for (int i=0; i<35; i++) {
    square(x, y, 100);
    if (x <600) {
      x+=100;
    } else {
      y+=100;
      x=0;
    }
  }
//calls the square function and translates it so that all fields are filled
  int a=0;
  int b=0;
  for (int i=0; i<35; i++) {
    square(a, b);
    if (a<600) {
      a+=100;
    } else {
      b+=100;
      a=0;
    }
  }
};
  void square(int a, int b) {
    pushMatrix();
    translate(a, b);

    int startx=int(random(30, 60));
    int starty=int(random(30, 60));
    int num_squares= int(random(1, 10));
    int size = 20;
    int new_startx=startx;
    int new_starty=starty;
    for (int j=0; j<num_squares; j++) {
      int dist_x= (startx/num_squares); 
      int dist_y= (starty/num_squares); //distance between each square to the upper edge
      int dist_y2 = (100-(starty+20))/num_squares; //distance between each square to lower edge

      square(new_startx, new_starty, size);
      size+= dist_y+dist_y2;

      new_startx-= dist_x;
      new_starty-=dist_y;
    }

    popMatrix();
  };
