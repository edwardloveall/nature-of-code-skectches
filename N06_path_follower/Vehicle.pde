class Vehicle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topSpeed, maxForce;
  float mass;

  Vehicle() {
    location = new PVector(random(0, width), random(0, height));
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    topSpeed = 4;
    maxForce = 1;
    mass = 1;
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }

  void display() {
    fill(#FF7035);
    ellipse(location.x, location.y, 20, 20);
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  void seek(PVector target) {
    PVector desired = PVector.sub(target, location);
    desired.normalize();
    desired.mult(topSpeed);

    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxForce);
    applyForce(steer);
  }

  void arrive(PVector target) {
    PVector desired = PVector.sub(target,location);

    float d = desired.mag();
    desired.normalize();

    if (d < 100) {
      float m = map(d, 0, 100, 0, topSpeed);
      desired.mult(m);
      } else {
        desired.mult(topSpeed);
      }

      PVector steer = PVector.sub(desired, velocity);
      steer.limit(maxForce);
      applyForce(steer);
  }

  PVector getNormalPoint(PVector p, PVector a, PVector b) {
    PVector ap = PVector.sub(p, a);
    PVector ab = PVector.sub(b, a);
    ab.normalize();
    ab.mult(ap.dot(ab));
    PVector normalPoint = PVector.add(a, ab);
    return normalPoint;
  }

  void follow(Path p) {
    PVector predict = velocity.get();
    predict.normalize();
    predict.mult(25);
    PVector predictLoc = PVector.add(location, predict);

    PVector a = p.start;
    PVector b = p.end;
    PVector normalPoint = getNormalPoint(predictLoc, a, b);

    PVector dir = PVector.sub(b, a);
    dir.normalize();
    dir.mult(10);
    PVector target = PVector.add(normalPoint, dir);

    float distance = PVector.dist(normalPoint, predictLoc);
    if (distance > p.radius) {
      seek(target);
    }
  }

  void checkEdges() {
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
