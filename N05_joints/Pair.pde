class Pair {
  Box b1, b2;
  float len = 40;

  Pair() {
    Vec2 b_location = new Vec2(random(width), random(height));
    b1 = new Box(b_location.x, b_location.y);
    b2 = new Box(b_location.x + len, b_location.y);

    DistanceJointDef djd = new DistanceJointDef();
    djd.bodyA = b1.body;
    djd.bodyB = b2.body;
    djd.length = world.scalarPixelsToWorld(len);
    djd.frequencyHz = 5;
    djd.dampingRatio = 0.5;

    DistanceJoint dj = (DistanceJoint) world.world.createJoint(djd);
  }

  void display() {
    Vec2 b1_loc = world.getBodyPixelCoord(b1.body);
    Vec2 b2_loc = world.getBodyPixelCoord(b2.body);

    fill(140);
    stroke(50);
    strokeWeight(2);

    line(b1_loc.x, b1_loc.y, b2_loc.x, b2_loc.y);
    b1.display();
    b2.display();
  }
}
