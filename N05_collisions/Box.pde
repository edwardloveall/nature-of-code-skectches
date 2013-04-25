class Box {
  Body body;
  Vec2 location;
  float x, y;
  float w, h;

  Box(float _x, float _y, boolean fixed) {
    x = _x;
    y = _y;
    w = 10;
    h = 10;

    BodyDef bd = new BodyDef();

    bd.type = (fixed) ? BodyType.STATIC : BodyType.DYNAMIC;
    bd.position.set(world.coordPixelsToWorld(x, y));
    // bd.position.set(world.vectorPixelsToWorld(location));
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

  void killBody() {
    world.destroyBody(body);
  }

  boolean outOfBounds() {
    PVector pos = world.coordWorldToPixelsPVector(body.getPosition());
    if (pos.x > width + width ||
        pos.x < 0 - width ||
        pos.y - h > height) {
      killBody();
      return true;
    } else {
      return false;
    }
  }

  void applyForce(Vec2 force) {
    body.applyForceToCenter(force);
  }
}
