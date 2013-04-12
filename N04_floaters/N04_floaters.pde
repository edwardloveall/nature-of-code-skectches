import java.util.Iterator;
ParticleSystem ps;
PVector buoyancy = new PVector(0, -0.5);
PImage img;

void setup() {
  size(700, 400);
  // smooth();

  ps = new ParticleSystem(30);
  img = loadImage("particle.png");
}

void draw() {
  background(20);

  ps.applyForce(buoyancy);
  ps.run();
}

void mouseMoved() {
  PVector mouse = new PVector(mouseX, mouseY);
  PVector pmouse = new PVector(pmouseX, pmouseY);
  PVector distance = PVector.sub(mouse, pmouse);
  distance.mult(0.1);

  ps.applyForce(distance);
}
