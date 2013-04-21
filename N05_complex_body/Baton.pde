class Baton {
  Body body;
  float w, h, r;

  Baton() {
    w = 20;
    h = 10;
    r = 15;

    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(mouseX, mouseY));
    body = box2d.createBody(bd);

    PolygonShape ps = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);
    ps.setAsBox(box2dW, box2dH);

    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(r/2);
    Vec2 circle_offset = new Vec2(w/2, 0);
    circle_offset = box2d.vectorPixelsToWorld(circle_offset);
    cs.m_p.set(circle_offset.x, circle_offset.y);

    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    fd.density = 1;
    fd.friction = 0.3;
    fd.restitution = 0.5;

    body.createFixture(fd);
    body.createFixture(cs, 1.0);
    body.setAngularVelocity(random(-40, 40));
  }

  void display() {
    Vec2 location = box2d.getBodyPixelCoord(body);
    float angle = body.getAngle();

    pushMatrix();
      translate(location.x, location.y);
      rotate(-angle);
      fill(80);
      stroke(0);
      rect(0, 0, w, h);
      ellipse(w/2, 0, r, r);
    popMatrix();
  }

  void killBody() {
    box2d.destroyBody(body);
  }
}
