class Particle extends Mover {
  float life, decay;

  Particle(PVector _location, PVector _velocity, float _mass, float _density) {
    super();
    life = random(200, 255);
    decay = 4;
    location = _location;
    velocity = _velocity;
    mass = _mass;
    density = _density;
  }

  void update() {
    super.update();
    life -= decay;
  }

  void display() {
    float alpha = constrain(life, 0, 255);
    fill(50, alpha);
    stroke(50, alpha);
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
