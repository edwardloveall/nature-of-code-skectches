import pbox2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;

PBox2D world;
ArrayList<Pair> pairs;
Boundary bound;

void setup() {
  size(700, 400);
  smooth();
  rectMode(CENTER);

  world = new PBox2D(this);
  world.createWorld();

  pairs = new ArrayList<Pair>();
  bound = new Boundary(width/2, height, width, 20);
}

void draw() {
  background(255);
  world.step();

  if (frameCount % 20 == 0) {
    pairs.add(new Pair());
  }

  for(Pair p: pairs) {
    p.display();
  }

  bound.display();
}
