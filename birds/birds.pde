Bird[] flock = new Bird[50];

void setup() {
  size(700, 400);
  smooth(4);
  stroke(22, 51, 110);
  strokeWeight(2);
  noFill();

  for (int i = 0; i < flock.length; i++) {
    flock[i] = new Bird(150, random(0, TWO_PI));
  }
}

void draw() {
  background(50, 118, 255);

  for (int i = 0; i < flock.length; i++) {
    flock[i].update();
    flock[i].display();
  }
}
