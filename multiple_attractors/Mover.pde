class Mover {
  PVector acceleration;
  PVector velocity;
  PVector location;
  float mass;

  Mover(float m, float x, float y) {
    mass = m;
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    checkEdges();
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  PVector attract(Mover m) {
    float G = 0.7;
    
    PVector force = PVector.sub(location, m.location);
    float distance = force.mag();
    distance = constrain(distance, 5, 25);
    force.normalize();
    
    float strength = (G * mass * m.mass) / (distance * distance);
    force.mult(strength);
    
    return force; 
  }
  
  void checkEdges() {
    float halfSize = mass * 5 * 0.5;
    float bounceBack = 1;

    if (location.x + halfSize > width) {
      location.x = width - halfSize;
      velocity.x *= -bounceBack;
    } else if (location.x - halfSize < 0) {
      velocity.x *= -bounceBack;
      location.x = halfSize;
    }

    if (location.y + halfSize > height) {
      location.y = height - halfSize;
      velocity.y *= -bounceBack;
    } else if (location.y - halfSize < 0) {
      velocity.y *= -bounceBack;
      location.y = halfSize;
    }
  }

  void display() {
    stroke(67);
    fill(255, 150);
    ellipse(location.x, location.y, mass * 5, mass * 5);
  }
}
