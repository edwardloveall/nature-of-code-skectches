Ant kevin;

void setup() {
  size(700, 400);
  smooth();
  stroke(0);
  fill(0, 30);
  rectMode(CENTER);
  
  kevin = new Ant();
}

void draw() {
  background(255);

  kevin.update();
  kevin.display();
}
