void setup() {
  size(700, 400);
  smooth();
  noFill();
}

void draw() {
  background(255);
  drawCircle(width/2, height/2, 500);
  noLoop();
}

void drawCircle(float x, float y, float r) {
  ellipse(x, y, r, r);

  if (r > 2) {
    r *= 0.5;
    drawCircle(x+r, y, r);
    drawCircle(x-r, y, r);
  }

}
