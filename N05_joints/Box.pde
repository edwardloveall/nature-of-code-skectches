class Box {
  Body body;
  Vec2 location;
  float w, h;

  Box(float x, float y) {
    w = 10;
    h = 10;

    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(world.coordPixelsToWorld(x, y));
    // bd.position.set(world.vectorPixelsToWorld(location));
    bd.angularVelocity = 10;
    body = world.createBody(bd);

    PolygonShape ps = new PolygonShape();
    float ps_w = world.scalarPixelsToWorld(w/2);
    float ps_h = world.scalarPixelsToWorld(h/2);
    ps.setAsBox(ps_w, ps_h);

    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    fd.density = 1;
    fd.restitution = 0.8;
    fd.friction = 0.5;

    body.createFixture(fd);
  }

  void display() {
    Vec2 location = world.getBodyPixelCoord(body);
    float angle = body.getAngle();

    pushMatrix();
      translate(location.x, location.y);
      rotate(angle);
      rect(0, 0, w, h);
    popMatrix();
  }
}
