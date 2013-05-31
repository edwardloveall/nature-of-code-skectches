Board life;

void setup() {
  size(700, 400);
  smooth();
  fill(0);
  noStroke();
  frameRate(30);

  life = new Board();
}

void draw() {
  background(255);

  life.display();
  if (frameCount % 4 == 0) {
    life.update();
  }

  if (frameCount % 30 == 0) {
    for (int i = 0; i < 40; i++) {
      life.addLife(random(width), random(height));
    }
  }
}

int mod(int in, int wrap) {
    int result = in % wrap;
    if (result < 0) {
        result += wrap;
    }
    return result;
}
