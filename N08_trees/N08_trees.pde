float theta = degrees(10);

void setup() {
  size(700, 400);
  colorMode(HSB, 360, 100, 100, 100);
  strokeWeight(2);
}

void draw() {
  background(0, 0, 10);

  translate(width/2, height);
  branch(100);
}

void branch(float len) {
  float bri = map(len, 2, 100, 23, 100);
  float hue = map(len, 2, 100, 0, 80);
  stroke(hue, bri, bri);
  line(0, 0, 0, -len);
  translate(0, -len);

  len *= .66;

  if (len > 2) {
    pushMatrix();
      rotate(theta);
      branch(len);
    popMatrix();

    pushMatrix();
      rotate(-theta);
      branch(len);
    popMatrix();
  }
}

void mouseMoved() {
  theta = map(mouseX, 0, width, 0, PI);
  println(theta);
}
