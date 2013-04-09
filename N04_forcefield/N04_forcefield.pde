import java.util.Iterator;
color dropletColor = color(41, 172, 255);
ParticleSystem ps;
Repeller r;
PVector wind;

void setup() {
  size(700, 400);
  smooth();
  noiseDetail(8);

  ps = new ParticleSystem();
  r = new Repeller(new PVector(width * 0.74, height / 2), 5000);
  wind = new PVector(35, 0);
}

void draw() {
  background(30);
  noStroke();
  r.display();
  ps.applyRepeller(r);
  ps.run();
}