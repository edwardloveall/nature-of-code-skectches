float noiseStep, noiseScale;
PVector offset;
Vehicle good, evil;

void setup() {
  size(700, 400);
  smooth();
  noStroke();

  good = new Vehicle();
  evil = new Vehicle();
  offset = new PVector(random(1000), random(1000) + 1000);
  noiseStep = 0.01;
  noiseScale = 0.1;
}

void draw() {
  background(255);
  PVector wind = new PVector((noise(offset.x) - 0.5) * noiseScale,
                             (noise(offset.y) - 0.5) * noiseScale);
  evil.applyForce(wind);
  evil.update();
  evil.display(#F5554F);
  offset.add(noiseStep, noiseStep, 0);

  good.seek(new PVector(mouseX, mouseY));
  good.flee(evil.location);
  good.update();
  good.display(#7FCF38);

}
