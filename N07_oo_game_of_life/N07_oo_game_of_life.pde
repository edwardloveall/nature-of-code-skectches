Board life;
boolean paused;

void setup() {
  size(700, 400);
  smooth();
  noStroke();
  frameRate(30);
  paused = false;

  life = new Board();
}

void draw() {
  background(255);
  fill(127);
  rect(30, 30, 9, 9);
  life.display();

  if (frameCount % 4 == 0 && !paused) {
    life.update();
  }
}

int mod(int in, int wrap) {
    int result = in % wrap;
    if (result < 0) {
        result += wrap;
    }
    return result;
}

void keyPressed() {
  if (key == ' ') paused = true;
}

void keyReleased() {
  if (key == ' ') paused = false;
}

void mousePressed() {
  life.addLife(mouseX, mouseY);
}

void mouseDragged() {
  // life.toggleLife(mouseX, mouseY);
}
