class Attractor {
  float mass;
  PVector location;
  
  Attractor(PVector _location) {
    location = _location;
    mass = 20;
  }
  
  PVector attract(Mover m) {
    PVector force = PVector.sub(location, m.location);
    float distance = force.mag();
    distance = constrain(distance, 5, 25);
    force.normalize();
    
    float strength = (mass * m.mass) / (distance * distance);
    force.mult(strength);
    
    return force; 
  }
  
  void display() {
    stroke(0);
    fill(50);
    ellipse(location.x, location.y, mass * 2, mass * 2);
  }
}
