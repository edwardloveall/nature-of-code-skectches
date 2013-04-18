import pbox2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.collision.shapes.*;

ArrayList<Box> boxes;
PBox2D box2d;
Vec2 center;

void setup() {
  size(700, 400);
  smooth();

  boxes = new ArrayList<Box>();

  box2d = new PBox2D(this);
  box2d.createWorld();

  center = box2d.coordPixelsToWorld(width/2, height/2);
}

void draw() {
  box2d.step();
  background(255);

  Vec2 mouse = box2d.coordPixelsToWorld(mouseX, mouseY);
  mouse.normalize();
  mouse = mouse.mul(10);
  box2d.setGravity(mouse.x, mouse.y);

  if (frameCount % 30 == 0) {
    Box p = new Box();
    boxes.add(p);
  }

  for(Box b: boxes) {
    b.display();
  }
}
