class Surface {
  ArrayList<Vec2> surface;
  ChainShape chain;

  Surface() {
    surface = new ArrayList<Vec2>();
    surface.add(new Vec2(0, height / 2));
    surface.add(new Vec2(width / 2, height));
    surface.add(new Vec2(width, height / 2));

    Vec2[] verticies = new Vec2[surface.size()];

    for (int i = 0; i < verticies.length; i++) {
      verticies[i] = box2d.coordPixelsToWorld(surface.get(i));
    }

    chain = new ChainShape();
    chain.createChain(verticies, verticies.length);

    BodyDef bd = new BodyDef();
    Body body = box2d.createBody(bd);
    body.createFixture(chain, 1);
  }

  void display() {
    stroke(0);
    noFill();
    beginShape();
      for(Vec2 v: surface) {
        vertex(v.x, v.y);
      }
    endShape();
  }
}
