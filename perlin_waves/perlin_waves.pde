float startVal = random(0, 1000);
float inc = 0.1;

void setup() {
  size(700, 400);
  colorMode(HSB, 100);
  noStroke();
}

void draw() {
  background(10);

  float value = startVal;

  for (int x = 0; x <= width; x += 5) {
    float y = noise(value) * height - 10;

    fill(map(sin(value), -1, 1, 0, 20), 100, 100);
    rect(x, y, 2, 10);
    value += inc;
  }

  startVal += 0.005;
}
