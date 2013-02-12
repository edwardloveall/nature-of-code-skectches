class Walker {
  float pos_x = width / 2;
  float pos_y = height / 2;
  
  void update() {
    pos_x += random(-1.1, 1);
    pos_y += random(-1, 1.1);
  }
  
  void draw() {
    point(pos_x, pos_y);
  }
}

Walker w;

void setup() {
  size(700, 400);
  noSmooth();
  background(255);
  stroke(0);
  
  w = new Walker();
}

void draw() {
//  background(255);
  w.update();
  w.draw();
}
