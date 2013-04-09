class Repeller {
  float strength;
  PVector location;

  Repeller(PVector _location, float _strength) {
    strength = _strength;
    location = _location;
  }

  PVector repel(Mover m) {
    PVector dir = PVector.sub(location, m.location);
    float distance = dir.mag();
    // distance = constrain(distance, 5, 25);
    dir.normalize();

    float force = -1 * strength / (distance * distance);
    dir.mult(force);

    return dir;
  }

  void display() {
    noStroke();
    fill(255, 37, 45);
    ellipse(location.x, location.y, 30, 30);
  }
}
