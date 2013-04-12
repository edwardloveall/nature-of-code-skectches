class Particle extends Mover {
  float vx, vy;

  Particle(PVector _location, PVector _velocity, float _mass, float _density) {
    super();
    location = _location;
    velocity = _velocity;
    mass = _mass;
    density = _density;
    vx = 0;
    vy = 0;
  }

  void update() {
    super.update();
    velocity.mult(0.9);
  }

  void display() {
    int size = int(mass);
    // img.resize(size, size);
    image(img, location.x, location.y);
  }

  boolean offScreen() {
    float size = mass / density;
    boolean offScreen = false;

    if (location.y + size < 0) {
      return true;
    } else {
      return false;
    }
  }
}
