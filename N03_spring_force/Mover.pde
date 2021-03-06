class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topSpeed;
  float mass, density, damping;

  Mover(float _mass, float _density, PVector _location) {
    location = _location;
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    topSpeed = 1;
    mass = _mass;
    density = _density;
    damping = 0.98;
  }

  void update() {
    velocity.add(acceleration);
    velocity.limit(topSpeed);
    velocity.mult(damping);
    location.add(velocity);
    checkEdges(1);
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
}
