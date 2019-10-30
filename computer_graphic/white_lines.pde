void setup() {
  size(500, 550);
  background(0, 0, 0);
  stroke(255, 255, 255);
  strokeWeight(1.5);

  int a=10;  
  int b=30;
  int c=10;
  int d=30;

  int a2=10;  
  int b2=30;
  int c2=10;
  int d2=30;

  int a3=210;  
  int b3=230;
  int c3=210;
  int d3=230;

  int a4=210;  
  int b4=230;
  int c4=210;
  int d4=230;



  for (int i=0; i<600; i++) {
    float[] x1 = {a+10, a, a, a, a, a+10, a, a+10};
    float[] y1 = {c, c+10, d, c, c+10, c, c+10, d};
    float[] x2 = {a+10, b, b, b, a+10, b, a+10, b};
    float[] y2 = {d, c+10, c, d, c, c+10, d, c+10};
    int line= int(random (8));
    line(x1[line], y1[line], x2[line], y2[line]);
    if (a <=450) {
      a+=20;
      b+=20;
    } else {
      c+=20;
      d+=20;
      a=10;
      b=30;
    }
  }
  for (int i=0; i<600; i++) {
    float[] x1 = {a2+10, a2, a2, a2, a2, a2+10, a2, a2+10};
    float[] y1 = {c2, c2+10, d2, c2, c2+10, c2, c2+10, d2};
    float[] x2 = {a2+10, b2, b2, b2, a2+10, b2, a2+10, b2};
    float[] y2 = {d2, c2+10, c2, d2, c2, c2+10, d2, c2+10};
    int line= int(random (8));
    line(x1[line], y1[line], x2[line], y2[line]);
    if (a2 <=450) {
      a2+=20;
      b2+=20;
    } else {
      c2+=20;
      d2+=20;
      a2=10;
      b2=30;
    }
  }

  //stroke(255, 0, 0);     //if uncommented, the added lines are visible in red
  
  //creating a denser region by adding two more layers in specific area 
  for (int i=0; i<50; i++) {
    float[] x1 = {a3+10, a3, a3, a3, a3, a3+10, a3, a3+10};
    float[] y1 = {c3, c3+10, d3, c3, c3+10, c3, c3+10, d3};
    float[] x2 = {a3+10, b3, b3, b3, a3+10, b3, a3+10, b3};
    float[] y2 = {d3, c3+10, c3, d3, c3, c3+10, d3, c3+10};
    int line= int(random (8));
    line(x1[line], y1[line], x2[line], y2[line]);
    if (a3 <=310) {
      a3+=20;
      b3+=20;
    } else {
      c3+=20;
      d3+=20;
      a3=210;
      b3=230;
    }
  }
  for (int i=0; i<50; i++) {
    float[] x1 = {a4+10, a4, a4, a4, a4, a4+10, a4, a4+10};
    float[] y1 = {c4, c4+10, d4, c4, c4+10, c4, c4+10, d4};
    float[] x2 = {a4+10, b4, b4, b4, a4+10, b4, a4+10, b4};
    float[] y2 = {d4, c4+10, c4, d4, c4, c4+10, d4, c4+10};
    int line= int(random (8));
    line(x1[line], y1[line], x2[line], y2[line]);
    if (a4 <=310) {
      a4+=20;
      b4+=20;
    } else {
      c4+=20;
      d4+=20;
      a4=210;
      b4=230;
    }
  }
}
