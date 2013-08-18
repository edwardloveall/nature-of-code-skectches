Mover balloon;
PVector helium;

void setup() {
  size(700, 400);
  fill(230);
  noStroke();
  strokeWeight(2);
  fill(255, 50, 50);
  balloon = new Mover();
  helium = new PVector(0, -0.02);
}

void draw() {
  background(255);
  balloon.applyForce(helium);
  balloon.update();
  balloon.display();
}

class Mover {
  PVector acceleration;
  PVector velocity;
  PVector location;
  float size = 30;

  Mover() {
    location = new PVector(width / 2, height - size);
    velocity = new PVector(random(-1, 1), 0);
    acceleration = new PVector(0, 0);
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    check_edges();
  }

  void applyForce(PVector force) {
    acceleration.add(force);
  }

  void display() {
    ellipse(location.x, location.y, size, size);
  }

  void check_edges() {
    // needs fixing. overtime, this sinks more and more into the top of the window

    float halfSize = size * 0.5;
    float bounceBack = 0.5;
    if (location.x + halfSize > width) {
      velocity.x *= -bounceBack;
    } else if (location.x - halfSize < 0) {
      velocity.x *= -bounceBack;
    }

    if (location.y + halfSize > height) {
      velocity.y *= -bounceBack;
    } else if (location.y - halfSize < 0) {
      velocity.y *= -bounceBack;
    }
  }
}
