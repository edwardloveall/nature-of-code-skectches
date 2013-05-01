import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;
import toxi.geom.*;

VerletPhysics2D world;
ArrayList<Particle> points;

float length = 32;
float strength = 2;
int numPoints = 20;
float maxLength = length * (numPoints - 1);

void setup() {
  size(700, 400);
  smooth();
  fill(30);
  noStroke();

  world = new VerletPhysics2D();
  world.setWorldBounds(new Rect(0, 0, width, height));
  world.addBehavior(new GravityBehavior(new Vec2D(0, 0.5)));

  points = new ArrayList<Particle>();

  for (int i = 0; i < numPoints; i++) {
    Vec2D pos = new Vec2D((i * length) + 30, height / 2);
    Particle p = new Particle(pos);
    points.add(p);
    world.addParticle(p);

    if (i != 0) {
      Particle prev = points.get(i - 1);
      VerletSpring2D spring = new VerletSpring2D(p, prev, length, strength);
      world.addSpring(spring);
    }
  }

  Particle first = points.get(0);
  Particle last = points.get(numPoints-1);
  first.lock();
  last.lock();
}

void draw() {
  world.update();
  background(255);

  for(Particle p: points) {
    p.display();
  }

  if (mousePressed) {
    Particle first = points.get(0);
    Particle last = points.get(numPoints-1);
    Vec2D mouse = new Vec2D(mouseX, mouseY);

    if (first.distanceTo(mouse) > maxLength) {
      Vec2D distance = mouse.sub(first);
      distance.normalize();
      distance.x = distance.x * maxLength;
      distance.y = distance.y * maxLength;
      } else {
        last.x = mouseX;
        last.y = mouseY;
      }


  }

}
