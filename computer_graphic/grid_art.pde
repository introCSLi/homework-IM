void setup() {
  size(522, 522);
  int rect=17;
  background(255, 255, 255);
  
  //create framing square
  strokeWeight(5);
  square(0, 0, 520);
  //creating the square grid
  int x=10;
  int y=10;
  
   strokeWeight(1.3);
  for (int i=0; i<rect*rect; i++) {
    square(x, y, 20);
    if (x <=480) {
      x+=30;
    } else {
      y+=30;
      x=10;
    }
  }
  //first layer of lines
  int a=10;  
  int b=30;
  int c=10;
  int d=30;

  int a2=10;  
  int b2=30;
  int c2=10;
  int d2=30;

  int a3=10;  
  int b3=30;
  int c3=10;
  int d3=30;

  int a4=10;  
  int b4=30;
  int c4=10;
  int d4=30;

  int a5=10;  
  int b5=30;
  int c5=10;
  int d5=30;

  int a6=10;  
  int b6=30;
  int c6=10;
  int d6=30;

  int a7=10;  
  int b7=30;
  int c7=10;
  int d7=30;

  int a8=10;  
  int b8=30;
  int c8=10;
  int d8=30;




  for (int i=0; i<rect*rect; i++) {
    float[] x1 = {a+10, a, a, a, a, a+10, a, a+10};
    float[] y1 = {c, c+10, d, c, c+10, c, c+10, d};
    float[] x2 = {a+10, b, b, b, a+10, b, a+10, b};
    float[] y2 = {d, c+10, c, d, c, c+10, d, c+10};
    int line= int(random (8));
    line(x1[line], y1[line], x2[line], y2[line]);
    if (a <=480) {
      a+=30;
      b+=30;
    } else {
      c+=30;
      d+=30;
      a=10;
      b=30;
    }
  }


  //make blank squares to cover previous lines
  int blankx1=40;
  int blanky1=40;
  for (int i=0; i<(rect-2)*(rect-2); i++) {
    square(blankx1, blanky1, 20);
    if (blankx1 <=450) {
      blankx1+=30;
    } else {
      blanky1+=30;
      blankx1=40;
    }
  }

  //create add another layer of lines
  for (int i=0; i<rect*rect; i++) {
    float[] x1 = {a2+10, a2, a2, a2, a2, a2+10, a2, a2+10};
    float[] y1 = {c2, c2+10, d2, c2, c2+10, c2, c2+10, d2};
    float[] x2 = {a2+10, b2, b2, b2, a2+10, b2, a2+10, b2};
    float[] y2 = {d2, c2+10, c2, d2, c2, c2+10, d2, c2+10};
    int line= int(random (8));
    line(x1[line], y1[line], x2[line], y2[line]);
    if (a2 <=480) {
      a2+=30;
      b2+=30;
    } else {
      c2+=30;
      d2+=30;
      a2=10;
      b2=30;
    }
  }

  //make blank squares to cover previous lines
  int blankx2=70;
  int blanky2=70;
  for (int i=0; i<(rect-4)*(rect-4); i++) {
    square(blankx2, blanky2, 20);
    if (blankx2 <=420) {
      blankx2+=30;
    } else {
      blanky2+=30;
      blankx2=70;
    }
  }

  //create add another layer of lines
  for (int i=0; i<rect*rect; i++) {
    float[] x1 = {a3+10, a3, a3, a3, a3, a3+10, a3, a3+10};
    float[] y1 = {c3, c3+10, d3, c3, c3+10, c3, c3+10, d3};
    float[] x2 = {a3+10, b3, b3, b3, a3+10, b3, a3+10, b3};
    float[] y2 = {d3, c3+10, c3, d3, c3, c3+10, d3, c3+10};
    int line= int(random (8));
    line(x1[line], y1[line], x2[line], y2[line]);
    if (a3 <=480) {
      a3+=30;
      b3+=30;
    } else {
      c3+=30;
      d3+=30;
      a3=10;
      b3=30;
    }
  }

  //make blank squares to cover previous lines
  int blankx3=100;
  int blanky3=100;
  for (int i=0; i<(rect-6)*(rect-6); i++) {
    square(blankx3, blanky3, 20);
    if (blankx3 <=390) {
      blankx3+=30;
    } else {
      blanky3+=30;
      blankx3=100;
    }
  }

  //create add another layer of lines
  for (int i=0; i<rect*rect; i++) {
    float[] x1 = {a4+10, a4, a4, a4, a4, a4+10, a4, a4+10};
    float[] y1 = {c4, c4+10, d4, c4, c4+10, c4, c4+10, d4};
    float[] x2 = {a4+10, b4, b4, b4, a4+10, b4, a4+10, b4};
    float[] y2 = {d4, c4+10, c4, d4, c4, c4+10, d4, c4+10};
    int line= int(random (8));
    line(x1[line], y1[line], x2[line], y2[line]);
    if (a4 <=480) {
      a4+=30;
      b4+=30;
    } else {
      c4+=30;
      d4+=30;
      a4=10;
      b4=30;
    }
  }

  //make blank squares to cover previous lines
  int blankx4=130;
  int blanky4=130;
  for (int i=0; i<(rect-8)*(rect-8); i++) {
    square(blankx4, blanky4, 20);
    if (blankx4 <=360) {
      blankx4+=30;
    } else {
      blanky4+=30;
      blankx4=130;
    }
  }
  //create add another layer of lines
  for (int i=0; i<rect*rect; i++) {
    float[] x1 = {a5+10, a5, a5, a5, a5, a5+10, a5, a5+10};
    float[] y1 = {c5, c5+10, d5, c5, c5+10, c5, c5+10, d5};
    float[] x2 = {a5+10, b5, b5, b5, a5+10, b5, a5+10, b5};
    float[] y2 = {d5, c5+10, c5, d5, c5, c5+10, d5, c5+10};
    int line= int(random (8));
    line(x1[line], y1[line], x2[line], y2[line]);
    if (a5 <=480) {
      a5+=30;
      b5+=30;
    } else {
      c5+=30;
      d5+=30;
      a5=10;
      b5=30;
    }
  }
  //make blank squares to cover previous lines
  int blankx5=160;
  int blanky5=160;
  for (int i=0; i<(rect-10)*(rect-10); i++) {
    square(blankx5, blanky5, 20);
    if (blankx5 <=330) {
      blankx5+=30;
    } else {
      blanky5+=30;
      blankx5=160;
    }
  }
  //create add another layer of lines
  for (int i=0; i<rect*rect; i++) {
    float[] x1 = {a6+10, a6, a6, a6, a6, a6+10, a6, a6+10};
    float[] y1 = {c6, c6+10, d6, c6, c6+10, c6, c6+10, d6};
    float[] x2 = {a6+10, b6, b6, b6, a6+10, b6, a6+10, b6};
    float[] y2 = {d6, c6+10, c6, d6, c6, c6+10, d6, c6+10};
    int line= int(random (8));
    line(x1[line], y1[line], x2[line], y2[line]);
    if (a6 <=480) {
      a6+=30;
      b6+=30;
    } else {
      c6+=30;
      d6+=30;
      a6=10;
      b6=30;
    }
  }
  //make blank squares to cover previous lines
  int blankx6=190;
  int blanky6=190;
  for (int i=0; i<(rect-12)*(rect-12); i++) {
    square(blankx6, blanky6, 20);
    if (blankx6 <=300) {
      blankx6+=30;
    } else {
      blanky6+=30;
      blankx6=190;
    }
  }

  //create add another layer of lines
  for (int i=0; i<rect*rect; i++) {
    float[] x1 = {a7+10, a7, a7, a7, a7, a7+10, a7, a7+10};
    float[] y1 = {c7, c7+10, d7, c7, c7+10, c7, c7+10, d7};
    float[] x2 = {a7+10, b7, b7, b7, a7+10, b7, a7+10, b7};
    float[] y2 = {d7, c7+10, c7, d7, c7, c7+10, d7, c7+10};
    int line= int(random (8));
    line(x1[line], y1[line], x2[line], y2[line]);
    if (a7 <=480) {
      a7+=30;
      b7+=30;
    } else {
      c7+=30;
      d7+=30;
      a7=10;
      b7=30;
    }
  }
    //make blank squares to cover previous lines
  int blankx7=220;
  int blanky7=220;
  for (int i=0; i<(rect-14)*(rect-14); i++) {
    square(blankx7, blanky7, 20);
    if (blankx7 <=270) {
      blankx7+=30;
    } else {
      blanky7+=30;
      blankx7=220;
    }
  }
  
    //create add another layer of lines
  for (int i=0; i<rect*rect; i++) {
    float[] x1 = {a8+10, a8, a8, a8, a8, a8+10, a8, a8+10};
    float[] y1 = {c8, c8+10, d8, c8, c8+10, c8, c8+10, d8};
    float[] x2 = {a8+10, b8, b8, b8, a8+10, b8, a8+10, b8};
    float[] y2 = {d8, c8+10, c8, d8, c8, c8+10, d8, c8+10};
    int line= int(random (8));
    line(x1[line], y1[line], x2[line], y2[line]);
    if (a8 <=480) {
      a8+=30;
      b8+=30;
    } else {
      c8+=30;
      d8+=30;
      a8=10;
      b8=30;
    }
  }
      //make blank squares to cover previous lines
  int blankx8=250;
  int blanky8=250;
  for (int i=0; i<(rect-16)*(rect-16); i++) {
    square(blankx8, blanky8, 20);
    if (blankx8 <=240) {
      blankx8+=30;
    } else {
      blanky8+=30;
      blankx8=250;
    }
  }
}

/* line(a+10, c, a+10, d);  //vertical
 line(a, c+10, b, c+10);  //horizontal
 line(a, d, b, c);  //diagonal up
 line(a, c, b, d);  //diagonal down
 line(a, c+10, a+10, c);  //small diagonal 1
 line(a+10, c, b, c+10);  //small diagonal 2
 line(a, c+10, a+10, d);  //small diagonal 3
 line(a+10, d, b, c+10);  //small diagonal 4 */
