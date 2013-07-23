float rectArea = 10;
float border = 1;
float cols = 70;
float rows = 40;

float size;
int pickedSide, halfWay;

ArrayList<Swatch> swatches, matingPool;

void setup() {
  size(int(cols * rectArea + border), int(rows * rectArea + border));
  colorMode(HSB, 1.0);
  noStroke();

  halfWay = int(width/2);
  size = rectArea - border;
  swatches = new ArrayList<Swatch>();

  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      Swatch s = new Swatch(border + i * rectArea, border + j * rectArea);
      swatches.add(s);
    }
  }
}

void draw() {
  background(0, 0, 1);

  for(Swatch s: swatches) {
    s.display();
  }
}

void generate() {
  matingPool = new ArrayList<Swatch>();

  for(Swatch s: swatches) {
    if (s.isFit()) {
      matingPool.add(s);
    }
  }

  for(Swatch s: swatches) {
    Swatch parentA = matingPool.get(int(random(matingPool.size())));
    Swatch parentB = matingPool.get(int(random(matingPool.size())));

    Swatch child = parentA.crossover(parentB, s.x, s.y);
    child.mutate();

    int i = swatches.indexOf(s);
    swatches.set(i, child);
  }
}

void keyPressed() {
  if (keyCode == 37) { // left
    pickedSide = 0;
  } else if (keyCode == 39) { // right
    pickedSide = 1;
  } else {
    return;
  }

  generate();
}
