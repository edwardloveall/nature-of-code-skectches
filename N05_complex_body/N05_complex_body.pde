import pbox2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.collision.shapes.*;

ArrayList<Baton> batons;
Surface surface;
PBox2D box2d;

void setup() {
  size(700, 400);
  smooth();
  rectMode(CENTER);

  box2d = new PBox2D(this);
  box2d.createWorld();

  batons = new ArrayList<Baton>();
  surface = new Surface();
}

void draw() {
  box2d.step();
  background(255);

  surface.display();

  if (mousePressed) {
    Baton b = new Baton();
    batons.add(b);
  }

  for(Baton b: batons) {
    b.display();
  }
}
