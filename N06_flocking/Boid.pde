class Boid {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topSpeed, maxForce;
  float mass;
  float thresh;

  Boid() {
    location = new PVector(width/2, height/2);
    // location = new PVector(random(0, width), random(0, height));
    velocity = new PVector(random(-0.5, 0.5), random(-0.5, 0.5));
    acceleration = new PVector(0, 0);
    topSpeed = 3;
    maxForce = 2;
    mass = 5;
    thresh = mass * 2;
  }

  void update() {
    velocity.add(acceleration);
    velocity.limit(topSpeed);
    location.add(velocity);
    acceleration.mult(0);
  }

  void flock(ArrayList<Boid> boids) {
    PVector separate = separate(boids);
    PVector align = align(boids);
    PVector cohesion = cohesion(boids);
    PVector seekMouse = seek(new PVector(mouseX, mouseY));

    separate.mult(1.5);
    align.mult(1);
    cohesion.mult(1);
    seekMouse.mult(0.1);

    applyForce(separate);
    applyForce(align);
    applyForce(cohesion);
    applyForce(seekMouse);
  }

  void display() {
    PVector mouse = new PVector(mouseX, mouseY);

    float mouseDistance = PVector.dist(mouse, location);
    float hue = map(mouseDistance, 0, width, 360, 240);
    float b = map(mouseDistance, 0, width, 70, 0);

    fill(hue, b, b);
    ellipse(location.x, location.y, mass*2, mass*2);
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

  PVector separate(ArrayList<Boid> boids) {
    float desiredSeparation = thresh;
    PVector average = new PVector();
    int count = 0;
    PVector steer = new PVector(0, 0);

    for(Boid other : boids) {
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

  PVector align(ArrayList<Boid> boids) {
    PVector average = new PVector(0, 0);
    PVector steer = new PVector(0, 0);
    int count = 0;

    for(Boid other: boids) {
      float dist = PVector.dist(other.location, location);

      if ((dist > 0) && (dist < thresh)) {
        average.add(other.velocity);
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

  PVector cohesion(ArrayList<Boid> boids) {
    PVector average = new PVector(0, 0);
    PVector steer = new PVector(0, 0);
    int count = 0;

    for(Boid other: boids) {
      float dist = PVector.dist(other.location, location);

      if ((dist > 0) && (dist < thresh)) {
        average.add(other.location);
        count++;
      }
    }

    if (count > 0) {
      average.div(count);
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

  void checkEdges(float bounceBack) {
    float halfSize = mass / 2.0;
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
