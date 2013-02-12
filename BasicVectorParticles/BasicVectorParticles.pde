PVector p, acceleration, velocity;

void setup() {
  size(300, 300);
  background(16);
  smooth();
  fill(255);
  noStroke();
  frameRate = 30;

  p = new PVector(width/2, height/2);

  acceleration = new PVector(random(-1, 1), random(-1, 1));
  acceleration.normalize();
  acceleration.mult(0.01);

  velocity = new PVector(random(-1, 1), random(-1, 1));
  velocity.limit(10);
  velocity.normalize();

  println(acceleration + ", " + velocity);
}

void draw(){
  background(16);

  velocity.add(acceleration);
  p.add(velocity);

  if (p.x > width || p.x < 0) {
    p.x = width - p.x;
  } else if (p.y > height || p.y < 0) {
    p.y = height - p.y;
  }

  ellipse(p.x, p.y, 10, 10);
}
