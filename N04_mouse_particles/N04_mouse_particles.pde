import java.util.Iterator;
ParticleSystem ps;

void setup() {
  size(700, 400);
  smooth();
  stroke(0);
  strokeWeight(2);

  ps = new ParticleSystem();
}

void draw() {
  background(255);
  ps.run();
}

void addParticle() {
  PVector mouse = new PVector(mouseX, mouseY);
  PVector pmouse = new PVector(pmouseX, pmouseY);
  PVector distance = PVector.sub(mouse, pmouse);
  distance.mult(0.4);

  Particle p = new Particle(mouse, distance, 10, 5 / distance.mag());
  ps.add(p);
}

void slowDown() {
  ps.slow();
}

void mouseMoved() { addParticle(); }

void mousePressed() { slowDown(); }

void mouseReleased() { slowDown(); }