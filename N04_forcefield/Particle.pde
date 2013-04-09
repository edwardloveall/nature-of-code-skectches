class Particle extends Mover {
  float life;
  float yOff;
  PVector loc2;

  Particle(PVector _location, float _mass, float _density) {
    super();
    life = random(80, 100);
    location = _location;
    mass = _mass;
    density = _density;
    yOff = random(0, 1000);
    loc2 = new PVector(0, 0);
    topSpeed = 2;
  }

  void update() {
    acceleration.y += map(noise(yOff), 0, 1, -0.1, 0.1);
    yOff += 3;

    PVector pLine = location.get();

    super.update();
    loc2 = PVector.sub(pLine, location);
    loc2.mult(3);

    life -= random(0.15, 0.3);
  }

  void display() {
    stroke(255, life);
    line(location.x, location.y, location.x - loc2.x, location.y - loc2.y);
  }

  boolean isDead() {
    if (life < 0) {
      return true;
    } else {
      return false;
    }
  }
}
