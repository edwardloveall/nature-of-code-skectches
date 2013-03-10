class Shrapnel extends Mover {
  float aVelocity, aAcceleration, angle;

  Shrapnel(float _m, float _d) {
    super();
    location = new PVector(width * 0.1, height * 0.5);
    topSpeed = 40;
    angle = 0;
    aVelocity = 0;
    aAcceleration = 0;
    mass = _m;
    density = _d;
  }

  void update() {
    velocity.add(acceleration);
    velocity.limit(topSpeed);
    location.add(velocity);
    
    aAcceleration = acceleration.x / 10;
    aVelocity += aAcceleration;
    aVelocity = constrain(aVelocity, -0.1, 0.1);
    angle += aVelocity;
    
    acceleration.mult(0);
  }

  void display() {
    stroke(0);
    fill(0, 30);
    pushMatrix();
      translate(location.x, location.y);
      rotate(angle);
      rect(0, 0, mass / density, mass / density);
    popMatrix();
  }
}
