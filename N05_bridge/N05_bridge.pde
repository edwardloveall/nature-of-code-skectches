import pbox2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;

PBox2D world;
Bridge bridge;
ArrayList<Box> boxes;

void setup() {
  size(700, 400);
  smooth();
  rectMode(CENTER);
  strokeWeight(2);

  world = new PBox2D(this);
  world.createWorld();

  boxes = new ArrayList<Box>();
  bridge = new Bridge();
}

void draw() {
  background(255);
  world.step();

  for(Box b: boxes) {
    fill(140);
    stroke(50);
    b.display();
  }

  if (mousePressed) {
    boxes.add(new Box(mouseX, mouseY, false));
  }


  bridge.display();
}
