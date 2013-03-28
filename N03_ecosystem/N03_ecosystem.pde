Fish[] fishies = new Fish[10];
ArrayList<Food> food;

void setup() {
  size(700, 400);
  smooth();
  noiseDetail(5);
  noiseSeed(millis() + second() + minute());

  background(255);

  for (int i = 0; i < fishies.length; i++) {
    fishies[i] = new Fish(1);
  }

  food = new ArrayList();
}

void draw() {
  background(255);

  for (int i = 0; i < fishies.length; i++) {
    for (int j = 0; j < food.size(); j++) {
      Food feed = (Food)food.get(j);
      PVector attraction = feed.attract(fishies[i]);
      fishies[i].applyForce(attraction);
      if (feed.eatenByFish(fishies[i])) {
        food.remove(feed);
      }
    }

    fishies[i].update();
    fishies[i].display();
  }

  for (int i = 0; i < food.size(); i++) {
    Food feed = (Food)food.get(i);
    feed.update();
    feed.display();
  }
}

void mouseClicked() {
  food.add(new Food(new PVector(mouseX, mouseY)));
}

