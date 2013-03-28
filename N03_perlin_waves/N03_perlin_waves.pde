float startVal = random(0, 1000);
float inc = 0.1;
float hueMax = 30;

void setup() {
  size(700, 400);
  colorMode(HSB, 100);
  noStroke();
  noiseDetail(2);
}

void draw() {
  background(10);

  float value = startVal;

  for (int x = 0; x <= width; x += 5) {
    float y = noise(value) * height - 10;

    fill(map(y, 0, height - 10, 0, hueMax), 100, 100);
    rect(x, y, 2, 10);
    value += inc;
  }

  println(noise(value));

  startVal += 0.005;
}
