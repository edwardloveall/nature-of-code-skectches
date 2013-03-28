class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topSpeed;
  float mass, density;

  Mover() {
    location = new PVector(random(0, width), random(0, height));
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    topSpeed = 1;
    mass = 1;
    density = 0.1;
  }

  void update() {
    velocity.add(acceleration);
    velocity.limit(topSpeed);
    location.add(velocity);
    acceleration.mult(0);
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  void checkEdges(float bounceBack) {
    float halfSize = (mass / density) * 0.5;

    if (location.x + halfSize > width) {
      location.x = width - halfSize;
      velocity.x *= -bounceBack;
    } else if (location.x - halfSize < 0) {
      velocity.x *= -bounceBack;
      location.x = halfSize;
    }

    if (location.y + halfSize > height) {
      location.y = height - halfSize;
      velocity.y *= -bounceBack;
    } else if (location.y - halfSize < 0) {
      velocity.y *= -bounceBack;
      location.y = halfSize;
    }
  }

  void display() {
    stroke(0);
    fill(0, 30);
    ellipse(location.x, location.y, mass / density, mass / density);
  }
}
