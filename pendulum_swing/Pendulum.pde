class Pendulum {
  float r, angle, aVelocity, aAcceleration;
  PVector origin;
  PVector location;
  float damping;

  Pendulum(float _r, float _angle) {
    r = _r;
    angle = _angle;
    origin = new PVector (width/2, 40);
    damping = .995;
  }

  void update() {
    float gravity = 0.1;
    aAcceleration = -1 * gravity * sin(angle) / r;
    aVelocity += aAcceleration;
    angle += aVelocity;
    aVelocity *= damping;

    location = new PVector(r * sin(angle), r * cos(angle));
    location.add(origin);
  }

  void display() {
    line(origin.x, origin.y, location.x, location.y);
    ellipse(location.x, location.y, 40, 40);
  }
}
