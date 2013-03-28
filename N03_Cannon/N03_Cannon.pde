ArrayList<Shrapnel> shrapnel;
PVector gravity = new PVector(0, 1);

void setup() {
  size(700, 400);
  smooth();
  rectMode(CENTER);

  shrapnel = new ArrayList();
}

void draw() {
  background(255);

  for(int i = 0; i < shrapnel.size(); i++) {
    Shrapnel fragment = (Shrapnel)shrapnel.get(i);
    fragment.applyForce(gravity);
    fragment.update();
    fragment.checkEdges(0.2);
    fragment.display();
    println(fragment.aVelocity + " - " + fragment.velocity.x);
  }
}

void mouseClicked() {
  for(int i = 0; i < 1; i++) {
    PVector explosion = new PVector(100, random(-20, 0));
    Shrapnel fragment = new Shrapnel(random(5, 10), random(0.5, 0.1));
    fragment.applyForce(explosion);
    shrapnel.add(fragment);
  }
}
