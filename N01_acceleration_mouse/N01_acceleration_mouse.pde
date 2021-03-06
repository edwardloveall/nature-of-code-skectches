Mover mover;

void setup() {
  size(640,360);
  smooth();
  stroke(0);
  fill(197);
  mover = new Mover();
}

void draw() {
  background(255);

  mover.update();
  mover.display();
}

class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;
  
  float topspeed = 5;

  Mover() {
    location = new PVector(random(width),random(height));
    velocity = new PVector(0,0);
  }

  void update() {
    PVector mouse = new PVector(mouseX, mouseY);
    PVector dir = PVector.sub(mouse, location);
    dir.normalize();
    dir.mult(0.5);
    
    acceleration = dir;
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
    check_edges();
  }

  void display() {
    ellipse(location.x,location.y,16,16);
  }

  void check_edges() {
    if (location.x > width) {
      location.x = 0;
    } else if (location.x < 0) {
      location.x = width;
    }

    if (location.y > height) {
      location.y = 0;
    } else if (location.y < 0) {
      location.y = height;
    }
  }
}
