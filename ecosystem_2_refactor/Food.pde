class Food extends Mover {
  
  Food(PVector _location) {
    location = _location;
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0.005);
    mass = 1000;
    density = 100;
    topSpeed = 2;
  }
  
  void update() {
    velocity.add(acceleration);
    velocity.limit(topSpeed);
    location.add(velocity);
    checkEdges(0);
  }
  
  boolean eatenByFish(Fish f) {
    float distance = PVector.sub(f.location, location).mag();
    if (distance > mass / density * 0.5) {
      return false;
    } else {
      return true;
    }
  }
  
  PVector attract(Mover m) {
    PVector force = PVector.sub(location, m.location);
    float distance = force.mag();
    distance = constrain(distance, 5, 500);
    force.normalize();
    
    float strength = (mass * m.mass) / (distance * distance);
    force.mult(strength);
    
    return force; 
  }
  
  void display() {
    fill(66);
    noStroke();
    ellipse(location.x, location.y, mass / density, mass / density);
  }
}
