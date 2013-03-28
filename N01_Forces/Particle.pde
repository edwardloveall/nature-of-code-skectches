class Particle {
  PVector location, velocity, acceleration;
  float mass, topSpeed;
  float size;
  color aColor;

  Particle(PVector _location, PVector _velocity, float _mass, color _color) {
    location =      _location;
    velocity =      _velocity;
    acceleration =  new PVector(0, 0);
    mass =          _mass;
    aColor =         _color;
    topSpeed = 2;
    size = 2f;
  } // Particle Constructor

  void update() {
    velocity.add(acceleration);
    velocity.limit(topSpeed);
    location.add(velocity);
    acceleration.mult(0);
  }

  void draw() {
    fill(aColor);
    ellipse(location.x, location.y, size, size);
  }

  void addForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  /*boolean alive() {
    if (life > 0) {
      return true;
    } else {
      return false;
    }
  }*/

  boolean inBounds() {
    if (location.x - size*0.5 > width || location.x + size*0.5 < 0 || location.y - size*0.5 > height || location.y + size*0.5 < 0) {
      return false;
    } else {
      return true;
    }
  }

}
