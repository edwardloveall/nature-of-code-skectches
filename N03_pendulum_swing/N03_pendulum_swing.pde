Pendulum bob;

void setup() {
  size(700, 400);
  smooth();

  bob = new Pendulum(300, 45);
}

void draw() {
  background(255);

  bob.update();
  bob.display();
}
