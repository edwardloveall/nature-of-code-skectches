Mover[] asteroids = new Mover[40];
Attractor[] planets = new Attractor[2];

void setup() {
  size(700, 400);

  for(int i = 0; i < asteroids.length; i++) {
    asteroids[i] = new Mover(random(0.2, 1.2), random(width), random(height));
  }
  
  planets[0] = new Attractor(new PVector(150, height/2));
  planets[1] = new Attractor(new PVector(550, height/2));
}

void draw() {
  background(255);
  
  for (int i = 0; i < planets.length; i++) {
    for (int j = 0; j < asteroids.length; j++) {
      PVector gravity = planets[i].attract(asteroids[j]);
      asteroids[j].applyForce(gravity);
      asteroids[j].update();
      asteroids[j].display();
    }
    planets[i].display();
  }
}
