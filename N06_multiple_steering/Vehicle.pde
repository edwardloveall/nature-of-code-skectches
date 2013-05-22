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
    topSpeed = 2;
    maxForce = 0.5;
    mass = 1;
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }

  void applyBehaviors(ArrayList<Vehicle> vehicles) {
    PVector separate = separate(vehicles);
    PVector seekMouse = seek(new PVector(mouseX,mouseY));

    seekMouse.mult(0.5);

    applyForce(seekMouse);
    applyForce(separate);
  }

  void display() {
    float hue = map(velocity.mag(), 0, topSpeed, 0, 60);
    float b = map(velocity.mag(), 0, topSpeed, 100, 30);
    fill(hue, b, b);
    ellipse(location.x, location.y, 10, 10);
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  PVector seek(PVector target) {
    PVector desired = PVector.sub(target, location);
    desired.normalize();
    desired.mult(topSpeed);

    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxForce);
    return steer;
  }

  PVector arrive(PVector target) {
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
      return steer;
  }

  PVector separate(ArrayList<Vehicle> vehicles) {
    float desiredSeparation = 20;
    PVector average = new PVector();
    int count = 0;
    PVector steer = new PVector(0, 0);

    for(Vehicle other : vehicles) {
      float d = PVector.dist(location, other.location);

      if ((d > 0) && (d < desiredSeparation)) {
        PVector diff = PVector.sub(location, other.location);
        diff.normalize();
        diff.div(d);
        average.add(diff);
        count++;
      }
    }

    if (count > 0) {
      average.div(count);
      average.normalize();
      average.mult(topSpeed);

      steer = PVector.sub(average, velocity);
      steer.limit(maxForce);
    }

    return steer;

  }

  void checkEdges() {
    if (location.x > width) location.x = 0;
    if (location.x < 0) location.x = width;
    if (location.y > height) location.y = 0;
    if (location.y < 0) location.y = height;
  }
}
