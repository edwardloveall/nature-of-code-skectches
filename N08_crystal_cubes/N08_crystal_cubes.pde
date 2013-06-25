void setup() {
  size(600, 600);
  noStroke();
  fill(0, 127);
  rectMode(CENTER);
}

void draw() {
  background(255);
  crystal(width/2, height/2, 300, 0);
}

void crystal(float x, float y, float size, float rotation) {
  pushMatrix();
  translate(x, y);
  rotate(radians(-rotation));
  rect(0, 0, size, size);
  popMatrix();

  if (size > 4) {
    size *= map(mouseX, 0, width, 0, 0.5);
    rotation += map(mouseX, 0, width, 0, 320);
    crystal(x - size, y - size, size, rotation);
    crystal(x + size, y - size, size, rotation);
    crystal(x + size, y + size, size, rotation);
    crystal(x - size, y + size, size, rotation);
  }
}
