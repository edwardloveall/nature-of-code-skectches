class Stream {
  ArrayList<Droplet> drops;
  PVector gravity;

  Stream() {
    drops = new ArrayList<Droplet>();

    gravity = new PVector(0, 1);
  }

  void run() {
    Droplet drop = new Droplet(new PVector(width/2, height), 4, 1);

    PVector spray = PVector.fromAngle(radians(random(-100, -80)));
    spray.setMag(random(50, 55));

    drop.applyForce(spray);
    drops.add(drop);
    applyForce(gravity);

    Iterator<Droplet> dIt = drops.iterator();

    while(dIt.hasNext()) {
      Droplet d = dIt.next();
      d.update();
      d.checkEdges(0);

      if (d.isDead()) {
        dIt.remove();
      } else {
        d.display();
      }
    }
  }

  void applyForce(PVector f) {
    for(Droplet d: drops) {
      d.applyForce(f);
    }
  }
}
