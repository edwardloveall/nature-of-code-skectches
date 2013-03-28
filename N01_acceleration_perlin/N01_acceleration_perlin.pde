Mover mover;
int xOff = 0;
int yOff = 1000;

void setup() {
  size(640,360);
  smooth();
  stroke(0);
  strokeWeight(2);
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
  float topspeed = 3;

  Mover() {
    location = new PVector(random(width),random(height));
    velocity = new PVector(0,0);
  }

  void update() {
    acceleration = new PVector(noise(xOff), noise(yOff));
    acceleration.mult(0.01);
    xOff++;
    yOff++;

    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);

    check_edges();
  }

  void display() {
    ellipse(location.x,location.y,30,30);
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
