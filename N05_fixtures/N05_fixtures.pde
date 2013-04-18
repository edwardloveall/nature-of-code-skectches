import pbox2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.collision.shapes.*;

ArrayList<Box> boxes;
ArrayList<Boundary> boundaries;
PBox2D box2d;

void setup() {
  size(700, 400);
  smooth();
  rectMode(CENTER);

  boxes = new ArrayList<Box>();
  boundaries = new ArrayList<Boundary>();

  box2d = new PBox2D(this);
  box2d.createWorld();

  Boundary lower = new Boundary(width * 0.25, height * 0.66, width/2, 20);
  Boundary upper = new Boundary(width * 0.75, height * 0.33, width/2, 20);
  boundaries.add(lower);
  boundaries.add(upper);
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

  for(Boundary b: boundaries) {
    b.display();
  }
}
