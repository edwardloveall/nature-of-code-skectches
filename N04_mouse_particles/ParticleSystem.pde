class ParticleSystem {
  ArrayList<Particle> particles;

  ParticleSystem() {
    particles = new ArrayList<Particle>();
  }

  void run() {

    Iterator<Particle> partIt = particles.iterator();

    while(partIt.hasNext()) {
      Particle p = partIt.next();
      p.update();
      // p.checkEdges(0);

      if (p.isDead()) {
        partIt.remove();
      } else {
        p.display();
      }

    }
  }

  void add(Particle p) {
    particles.add(p);
  }

  void slow() {
    float speed;

    Iterator<Particle> partIt = particles.iterator();

    while(partIt.hasNext()) {
      Particle p = partIt.next();
      if (mousePressed) {
        speed = 0.1;
      } else {
        speed = 10;
      }
      p.velocity.mult(speed);
      p.decay *= speed;
    }
  }
}
