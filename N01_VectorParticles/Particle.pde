class Particle {
  PVector location, velocity, acceleration;
  float mass, topSpeed;
  float size;

  Particle(PVector _location, PVector _velocity, PVector _acceleration, float _mass) {
    location =      _location;
    velocity =      _velocity;
    acceleration =  _acceleration;
    mass =          _mass;
    topSpeed = 2;
    size = 1f;
  } // Particle Constructor

  void update() {
    velocity.add(acceleration);
    velocity.limit(topSpeed);
    location.add(velocity);
  }

  void draw() {
    ellipse(location.x, location.y, size, size);
  }

  /*boolean alive() {
    if (life > 0) {
      return true;
    } else {
      return false;
    }
  }*/

  boolean inBounds() {
    if (location.x + size*0.5 > width || location.x - size*0.5 < 0 || location.y + size*0.5 > height || location.y - size*0.5 < 0) {
      return false;
    } else {
      return true;
    }
  }

}
