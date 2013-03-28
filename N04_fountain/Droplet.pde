class Droplet extends Mover {
  float life;

  Droplet(PVector _location, float _mass, float _density) {
    super();
    life = random(200, 255);
    location = _location;
    mass = _mass;
    density = _density;
  }

  void update() {
    super.update();
    life -= 1;
  }

  void display() {
    fill(37, 141, 255, constrain(life, 0, 255));
    ellipse(location.x, location.y, mass / density, mass / density);
  }

  boolean isDead() {
    if (life < 0) {
      return true;
    } else {
      return false;
    }
  }
}
