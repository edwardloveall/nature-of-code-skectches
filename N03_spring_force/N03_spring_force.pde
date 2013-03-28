Bob ball;
Spring stretch;
PVector gravity;

void setup() {
  size(700, 400);
  smooth();

  ball = new Bob(1.0, 0.1, new PVector(random(0, width), random(0, height)));
  stretch = new Spring(80, new PVector(width/2, 40));

  gravity = new PVector(0, 1);
}

void draw() {
  background(255);

  PVector springForce = stretch.connect(ball);

  ball.applyForce(gravity);
  ball.applyForce(springForce);
  ball.update();

  stretch.display(ball);
  ball.display();
}