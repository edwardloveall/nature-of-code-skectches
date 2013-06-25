void setup() {
  size(700, 400);
  noSmooth();
  noFill();
  strokeWeight(20);
  strokeCap(SQUARE);
}

void draw() {
  background(255);
  cantor(50, 20, width*0.8);
  noLoop();
}

void cantor(float x, float y, float length) {
  line(x, y, x+length, y);
  if (length > 2) {
    length /= 3;
    y += 30;
    cantor(x, y, length);
    cantor(x+(length*2), y, length);
  }
}