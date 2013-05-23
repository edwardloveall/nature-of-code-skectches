Flock flock;

void setup() {
  size(700, 400);
  smooth();
  noStroke();
  colorMode(HSB, 360, 100, 100);

  flock = new Flock(100);
}

void draw() {
  background(#242424);

  flock.run();
}
