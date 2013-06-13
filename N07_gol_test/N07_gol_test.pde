Board life;
boolean paused;

void setup() {
  size(700, 400);
  smooth();
  strokeWeight(1);
  stroke(200);
  frameRate(30);
  paused = false;

  life = new Board();
}

void draw() {
  background(255);
  fill(127);
  rect(30, 30, 9, 9);
  life.display();

  stroke(200);
  for (int i = 0; i < width; i += 10) {
    line(0, i, height, i);
  }

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
