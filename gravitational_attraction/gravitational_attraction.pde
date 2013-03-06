Mover asteroid;
Attractor planet;

void setup() {
  size(700, 400);

  asteroid = new Mover(1, 320, 200);
  planet = new Attractor();
}

void draw() {
  background(255);
  
  PVector gravity = planet.attract(asteroid);
  asteroid.applyForce(gravity);
  
  planet.display();
  asteroid.update();
  asteroid.display();
}
