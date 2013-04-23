class Boundary {
  float x, y;
  float w, h;
  Body body;

  Boundary(float _x, float _y, float _w, float _h) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;

    BodyDef bd = new BodyDef();
    bd.type = BodyType.STATIC;
    bd.position.set(world.coordPixelsToWorld(x, y));
    body = world.createBody(bd);

    PolygonShape ps = new PolygonShape();
    float ps_w = world.scalarPixelsToWorld(w/2);
    float ps_h = world.scalarPixelsToWorld(h/2);
    ps.setAsBox(ps_w, ps_h);

    body.createFixture(ps, 1);
  }

  void display() {
    noStroke();
    rect(x, y, w, h);
  }
}
