class Bridge {
  ArrayList<Box> boxes;
  float boxSize = 10;
  float len = boxSize * 1.2;

  Bridge() {
    boxes = new ArrayList<Box>();

    for (int i = 0; i < width / len; i++) {
      boolean fixed = false;

      println(i);

      if (i == 0 || i == 58) {
        fixed = true;
      }

      Box b = new Box(i * len, height * .66, fixed);
      boxes.add(b);
    }

    for (int i = 0; i < boxes.size() - 1; i++) {
      DistanceJointDef djd = new DistanceJointDef();
      djd.bodyA = boxes.get(i).body;
      djd.bodyB = boxes.get(i + 1).body;
      djd.length = world.scalarPixelsToWorld(len);
      djd.frequencyHz = 0;
      djd.dampingRatio = 1;

      DistanceJoint dj = (DistanceJoint) world.world.createJoint(djd);
    }
  }

  void display() {
    fill(205, 176, 128);
    stroke(112, 96, 70);

    for(Box b: boxes) {
      b.display();
    }

    // Vec2 b1_loc = world.getBodyPixelCoord(b1.body);
  }
}
