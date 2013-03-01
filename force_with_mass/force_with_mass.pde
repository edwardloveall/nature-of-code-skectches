Mover[] movers = new Mover[40];
PVector wind, gravity;

void setup() {
  size(700, 400, OPENGL);
  smooth();
  fill(230);
  stroke(0);
  strokeWeight(2);
  frameRate(30);
  for(int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(0.1, 5), 30, 30);
  }

  wind = new PVector(0.2, 0);
  gravity = new PVector(0, 1);
}

void draw() {
  background(255);
  for(int i = 0; i < movers.length; i++) {
    movers[i].applyForce(wind);
    movers[i].applyForce(gravity);
    movers[i].update();
    movers[i].display();
  }
}

class Mover {
  PVector acceleration;
  PVector velocity;
  PVector location;
  float mass;
  float size;

  Mover(float m, float x, float y) {
    size = 16;
    mass = m;
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    checkEdges();
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  void display() {
    if (location.x > 500) { // wtf, this shouldn't be a thing...
      fill(255, 0, 0);
    } else {
      fill(230, 0, 0);
    }

    ellipse(location.x, location.y, mass * size, mass * size);
  }

  void checkEdges() {
    // needs fixing. overtime, this sinks more and more into the top of the window

    float halfSize = size * 0.5;
    float bounceBack = 1;

    if (location.x + halfSize > width) {
      location.x = width;
      velocity.x *= -bounceBack;
    } else if (location.x - halfSize < 0) {
      velocity.x *= -bounceBack;
      location.x = 0;
    }

    if (location.y + halfSize > height) {
      location.y = height;
      velocity.y *= -bounceBack;
    } else if (location.y - halfSize < 0) {
      velocity.y *= -bounceBack;
      location.y = 0;
    }
  }
}
