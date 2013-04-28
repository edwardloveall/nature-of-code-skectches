import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;
import toxi.geom.*;

VerletPhysics2D world;
ArrayList<Particle> particles;

void setup() {
  size(700, 400);
  smooth();
  noStroke();
  fill(0, 100);

  world = new VerletPhysics2D();
  world.setWorldBounds(new Rect(0, 0, width, height));
  world.addBehavior(new GravityBehavior(new Vec2D(0, 0.5)));

  particles = new ArrayList<Particle>();
}

void draw() {
  world.update();
  background(255);

  if (mousePressed) {
    Vec2D mouse = new Vec2D(mouseX, mouseY);
    Particle p = new Particle(mouse);
    particles.add(p);
    world.addParticle(p);
  }


  for(Particle p: particles) {
    p.display();
  }
}
