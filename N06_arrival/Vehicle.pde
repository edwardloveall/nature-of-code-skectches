class Vehicle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topSpeed, maxForce;
  float mass;

  Vehicle() {
    location = new PVector(random(0, width), random(0, height));
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    topSpeed = 4;
    maxForce = 0.1;
    mass = 1;
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }

  void display() {
    fill(#FF7035);
    ellipse(location.x, location.y, 20, 20);
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  void seek(PVector target) {
    PVector desired = PVector.sub(target, location);

    float d = desired.mag();
    desired.normalize();

    if (d < 100) {
      float m = map(d, 0, 100, 0, topSpeed);
      desired.mult(m);
    } else {
      desired.mult(topSpeed);
    }

    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxForce);
    applyForce(steer);
  }

  void checkEdges(float bounceBack) {
    float halfSize = (mass) * 0.5;

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
