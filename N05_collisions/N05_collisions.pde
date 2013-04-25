import pbox2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.dynamics.contacts.*;
import org.jbox2d.collision.shapes.*;

import java.util.Iterator;

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
  world.listenForCollisions();

  boxes = new ArrayList<Box>();
  bridge = new Bridge();
}

void draw() {
  background(255);
  world.step();

  Iterator<Box> bIt = boxes.iterator();

  while(bIt.hasNext()) {
    Box b = bIt.next();
    if (b.outOfBounds()) {
      bIt.remove();
    }
  }

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

void beginContact(Contact cp) {
  fill(#ff0000);
  noStroke();
  ellipse(width/2, height * 0.2, 150, 150);
}

void endContact(Contact cp) {

}

void mouseMoved() {
  Vec2 mouse = world.coordPixelsToWorld(mouseX, mouseY);
  Vec2 pmouse = world.coordPixelsToWorld(pmouseX, pmouseY);
  Vec2 distance = mouse.sub(pmouse);
  distance = distance.mul(20);

  for(Box b: boxes) {
    b.applyForce(distance);
  }
  bridge.applyForce(distance);
}
