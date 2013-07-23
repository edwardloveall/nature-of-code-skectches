int rectArea = 10;
int border = 1;
int cols = 70;
int rows = 40;

float size;
int pickedSide, halfWay;

ArrayList<Swatch> matingPool;
Swatch[][] swatches;

void setup() {
  size(cols * rectArea + border, rows * rectArea + border);
  colorMode(HSB, 1.0);
  noStroke();

  halfWay = int(width/2);
  size = rectArea - border;

  swatches = new Swatch[cols][rows];

  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      Swatch s = new Swatch(border + i * rectArea, border + j * rectArea);
      swatches[i][j] = s;
    }
  }
}

void draw() {
  background(0, 0, 1);

  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      swatches[i][j].display();
    }
  }

}

void generate() {
  matingPool = new ArrayList<Swatch>();

  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      Swatch s = swatches[i][j];
      if (s.isFit()) {
        matingPool.add(s);
      }
    }
  }

  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      Swatch s = swatches[i][j];
      Swatch parent = matingPool.get(int(random(matingPool.size())));

      s.hue = parent.hue;
      s.saturation = parent.saturation;

      s.mutate();
    }
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
