class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector bias;
  float xOff, yOff;
  float topSpeed;
  float mass;
  
  Mover(float _mass) {
    location = new PVector(random(0, width), random(0, height));
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    bias = new PVector(-0.5, -0.5);
    xOff = random(0, 1000);
    yOff = random(1000, 2000);
    topSpeed = 0.8;
    mass = _mass;
  }
  
  void update() {
    PVector noise = new PVector(noise(xOff), noise(yOff));
    noise.add(bias);
    // this is here because perlin noise returns 0 - 1
    // which creates south-easterly motion
    acceleration.add(noise);
    
    velocity.add(acceleration);
    velocity.limit(topSpeed);
    location.add(velocity);
    checkEdges();
    acceleration.mult(0);
    
    xOff += 0.01;
    yOff += 0.01;
  }
  
  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
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
    stroke(0);
    fill(0, 30);
    ellipse(location.x, location.y, 20, 20);
  }
}
