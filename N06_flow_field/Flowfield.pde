class Flowfield {
  PVector[][] field;
  int cols, rows;
  int resolution;

  Flowfield() {
    resolution = 10;
    cols = width / resolution;
    rows = height / resolution;
    field = new PVector[cols][rows];

    float xOff = 0;
    for(int i = 0; i < cols; i++) {
      float yOff = 0;
      for(int j = 0; j < rows; j++) {
        float theta = map(noise(xOff, yOff), 0, 1, 0, TWO_PI);
        field[i][j] = new PVector(cos(theta), sin(theta));
        yOff += 0.1;
      }
      xOff += 0.1;
    }
  }

  PVector lookup(PVector lookup) {
    int column = int(constrain(lookup.x / resolution, 0, cols - 1));
    int row = int(constrain(lookup.y / resolution, 0, rows - 1));

    return field[column][row].get();
  }
}