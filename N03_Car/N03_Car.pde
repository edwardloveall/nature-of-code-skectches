Vehicle car;

void setup() {
  size(700, 400);
  smooth();

  car = new Vehicle(new PVector(width/2, 10));
}

void draw() {
  background(255);

  car.update();
  car.checkEdges();
  car.display();
}

void keyPressed() {
  // left = 37
  // up = 38
  // right = 39
  // down = 40

  float force = 0.2;

  if (keyCode == 37) {
    car.applyForce(new PVector(-force, 0));
  } else if(keyCode == 38) {
    car.applyForce(new PVector(0, -force));
  } else if(keyCode == 39) {
    car.applyForce(new PVector(force, 0));
  } else if(keyCode == 40) {
    car.applyForce(new PVector(0, force));
  }
}
