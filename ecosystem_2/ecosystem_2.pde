Mover[] fishies = new Mover[10];
ArrayList<Attractor> food;

void setup() {
  size(700, 400);
  smooth();
  noiseDetail(5);
  noiseSeed(millis() + second() + minute());

  background(255);

  for (int i = 0; i < fishies.length; i++) {
    fishies[i] = new Mover(1);
  }

  food = new ArrayList();
}

void draw() {
  background(255);

  for (int i = 0; i < fishies.length; i++) {
    for (int j = 0; j < food.size(); j++) {
      Attractor feed = (Attractor)food.get(j);
      PVector attraction = feed.attract(fishies[i]);
      fishies[i].applyForce(attraction);
    }

    fishies[i].update();
    fishies[i].display();
  }

  for (int i = 0; i < food.size(); i++) {
    Attractor feed = (Attractor)food.get(i);
    feed.update();
    feed.display();
  }
}

void mouseClicked() {
  food.add(new Attractor(new PVector(mouseX, mouseY)));
}

