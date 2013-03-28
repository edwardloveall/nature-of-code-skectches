import java.util.Iterator;
color dropletColor = color(41, 172, 255);
ParticleSystem fire;

void setup() {
  size(700, 400);
  smooth();
  fill(0);
  noiseDetail(8);
  colorMode(HSB, 360, 100, 100, 100);

  fire = new ParticleSystem();
}

void draw() {
  background(30);
  noStroke();
  fire.run();
}