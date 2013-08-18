Ant kevin;

void setup() {
  size(700, 400);
  smooth();
  rectMode(CENTER);

  kevin = new Ant();
}

void draw() {
  background(255);

  kevin.update();
  kevin.display();

  saveFrame("/Users/edwardloveall/Desktop/frames/frame-####.png");
}
