PVector a, b;

void setup() {
  size(700, 400);
  smooth();

  a = new PVector(100, 0);
  b = new PVector();
}

void draw() {
  background(255);

  b.x = mouseX;
  b.y = mouseY;
  line(0, 0, a.x, a.y);
  line(0, 0, b.x, b.y);

  float theta = acos(a.dot(b) / (a.mag() * b.mag()));

  if (frameCount % 30 == 0) {
    println(degrees(theta));
  }
}
