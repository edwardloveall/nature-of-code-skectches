Mover[] movers = new Mover[20];
PVector wind;

void setup() {
  size(700, 400);
  fill(230);
  stroke(67);
  strokeWeight(2);

  for(int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(0.5, 5), 30, 30);
  }

  wind = new PVector(0.2, 0);
}

void draw() {
  background(255);
  noStroke();
  rect(300, 0, 100, height);

  stroke(67);
  for(int i = 0; i < movers.length; i++) {
    float m = movers[i].mass;
    PVector gravity = new PVector(0, 0.2 * m);

    float c;

    if (movers[i].location.x > 300 &&
        movers[i].location.x < 400) {
      c = 1;
    } else {
      c = 0.01;
    }


    PVector friction = movers[i].velocity.get();
    friction.mult(-1);
    friction.normalize();
    friction.mult(c);

    movers[i].applyForce(friction);
    movers[i].applyForce(wind);
    movers[i].applyForce(gravity);
    movers[i].update();
    movers[i].display();
  }

  saveFrame("/Users/edwardloveall/Desktop/frames/frame-####.png");
}

class Mover {
  PVector acceleration;
  PVector velocity;
  PVector location;
  float mass;
  float size;

  Mover(float m, float x, float y) {
    size = 16;
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

  void display() {
    ellipse(location.x, location.y, mass * size, mass * size);
  }

  void checkEdges() {
    float halfSize = mass * size * 0.5;
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
}
