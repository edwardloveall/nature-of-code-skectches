Bob lulu;
Spring fozzy;
PVector gravity;

void setup() {
  size(700, 400);
  smooth();

  lulu = new Bob(20, 349, 100);
  fozzy = new Spring(50, new PVector(width/2, 40));

  gravity = new PVector(0, 1);
}

void draw() {
  background(255);

  PVector sproing = fozzy.connect(lulu);
  println(sproing);

  lulu.applyForce(gravity);
  lulu.applyForce(sproing);
  lulu.update();

  fozzy.display(lulu);
  lulu.display();
}