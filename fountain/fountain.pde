import java.util.Iterator;
color dropletColor = color(41, 172, 255);
Stream water;

void setup() {
  size(700, 400);
  smooth();
  noStroke();
  fill(0);

  water = new Stream();
}

void draw() {
  background(255);
  water.run();
}
