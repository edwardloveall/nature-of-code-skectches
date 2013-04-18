import pbox2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.collision.shapes.*;

ArrayList<Box> boxes;
PBox2D box2d;

void setup() {
  size(700, 400);
  smooth();

  boxes = new ArrayList<Box>();

  box2d = new PBox2D(this);
  box2d.createWorld();
}

void draw() {
  box2d.step();
  background(255);

  if (mousePressed) {
    Box p = new Box();
    boxes.add(p);
  }

  for(Box b: boxes) {
    b.display();
  }
}
