float startAngle = 0;
float angleVel = 0.1;

void setup() {
  size(700, 400);
  smooth();

}

void draw() {
  background(255);

  float angle = startAngle;

  for (int x = 0; x <= width; x += 24) {
    float y = map(sin(angle), -1, 1, 0, height);
    ellipse(x, y, 38, 38);
    angle += angleVel;
  }

  startAngle += 0.01;
}
