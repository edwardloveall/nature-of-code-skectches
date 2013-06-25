void setup() {
  size(700, 400);
  smooth();

}

void draw() {
  background(255);
  drawCircle(width/2, height/2, width);
  noLoop();
}

void drawCircle(float x, float y, float r) {
  ellipse(x, y, r, r);

  if (r > 2) {
    r *= 0.75;
    drawCircle(x, y, r);
  }

}
