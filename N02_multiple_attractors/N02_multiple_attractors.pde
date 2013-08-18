Mover[] magnets = new Mover[10];

void setup() {
  size(700, 400);

  for(int i = 0; i < magnets.length; i++) {
    magnets[i] = new Mover(random(2, 3.2), random(width), random(height));
  }
}

void draw() {
  background(255);

  for (int i = 0; i < magnets.length; i++) {
    for (int j = 0; j < magnets.length; j++) {
      if(i != j) {
        PVector gravity = magnets[i].attract(magnets[j]);
        magnets[j].applyForce(gravity);
      }
    }
    magnets[i].update();
    magnets[i].display();
  }

  saveFrame("/Users/edwardloveall/Desktop/frames/frame-####.png");
}
