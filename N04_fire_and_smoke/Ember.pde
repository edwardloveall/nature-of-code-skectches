class Ember extends Mover {
  float life;
  float xOff;

  Ember(PVector _location, float _mass, float _density) {
    super();
    life = random(80, 100);
    location = _location;
    mass = _mass;
    density = _density;
    xOff = random(0, 1000);
  }

  void update() {
    acceleration.x += map(noise(xOff), 0, 1, -0.1, 0.1);
    xOff += 2;

    super.update();
    life -= random(0.3, 0.6);
  }

  void display() {
    float h = 21;
    float s = constrain(map(life, 0, 100, -200, 200), 0, 80);
    float b = 100;
    fill(h, s, b, life);
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
