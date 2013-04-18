import pbox2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.collision.shapes.*;

ArrayList<Box> boxes;
Surface surface;
PBox2D box2d;

void setup() {
  size(700, 400);
  smooth();
  rectMode(CENTER);

  box2d = new PBox2D(this);
  box2d.createWorld();

  boxes = new ArrayList<Box>();
  surface = new Surface();
}

void draw() {
  box2d.step();
  background(255);

  surface.display();

  if (mousePressed) {
    Box p = new Box();
    boxes.add(p);
  }

  for(Box b: boxes) {
    b.display();
  }
}
