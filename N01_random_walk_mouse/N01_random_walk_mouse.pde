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

class Walker {
  float pos_x = width / 2;
  float pos_y = height / 2;
  
  void update() {
    float r = random(2);
    if(r > 0.5) {
      if(mouseX > pos_x) {
        pos_x++;
      } else {
        pos_x--;
      }
      
      if(mouseY > pos_y) {
        pos_y++;
      } else {
        pos_y--;
      }
    } else {
      if(r < 0.25) {
        pos_x++;
      } else if(r < 0.5) {
        pos_x--;
      } else if(r < 0.75) {
        pos_y++;
      } else if(r < 1) {
        pos_y--;
      }
    }
  }
  
  void draw() {
    point(pos_x, pos_y);
  }
}

