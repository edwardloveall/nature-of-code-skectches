class Bob extends Mover {
  PVector bob;

  Bob(float _mass, float _density, PVector _location) {
    super(_mass, _density, _location);
  }

  void display() {
    ellipse(location.x, location.y, 30, 30);
  }
}