int rectArea = 10;
int border = 1;
int cols = 10;
int rows = 10;

float mutationRate = 0.01;
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
      Swatch parent = matingPool.get(int(random(matingPool.size())));
      Swatch s = swatches[i][j];

      Swatch child = parent.tetradic(s);
      child.mutate();

      swatches[i][j] = child;
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

float mod(float in, float wrap) {
  float result = in % wrap;
  if (result < 0) { result += wrap; }

  return result;
}
