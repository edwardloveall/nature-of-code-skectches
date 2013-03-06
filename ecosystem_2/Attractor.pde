class Attractor {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  float topSpeed = 2;
  
  Attractor(PVector _location) {
    location = _location;
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0.005);
    mass = 50;
  }
  
  void update() {
    velocity.add(acceleration);
    velocity.limit(topSpeed);
    location.add(velocity);
    checkEdges();
  }
  
  PVector attract(Mover m) {
    float G = 10000;
    
    PVector force = PVector.sub(location, m.location);
    float distance = force.mag();
    distance = constrain(distance, 5, 500);
    force.normalize();
    
    float strength = (G * mass * m.mass) / (distance * distance);
    force.mult(strength);
    
    return force; 
  }
  
  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }
  
  void checkEdges() {
    float halfSize = mass * 0.25;
    float bounceBack = 0;

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
    fill(66);
    noStroke();
    ellipse(location.x, location.y, mass * 0.5, mass * 0.5);
  }
}
