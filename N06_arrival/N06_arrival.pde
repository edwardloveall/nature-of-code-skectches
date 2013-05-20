Vehicle thing;

void setup() {
  size(700, 400);
  smooth();
  noStroke();

  thing = new Vehicle();
}

void draw() {
  background(255);
  thing.seek(new PVector(mouseX, mouseY));
  thing.update();
  thing.display();
}
