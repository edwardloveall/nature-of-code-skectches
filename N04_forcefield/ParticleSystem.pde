class ParticleSystem {
  ArrayList<Particle> particles;

  ParticleSystem() {
    particles = new ArrayList<Particle>();
  }

  void run() {
    PVector startLoc = new PVector(0, random(height));
    Particle particle = new Particle(startLoc, 20, 2);
    particle.applyForce(wind);
    particles.add(particle);

    Iterator<Particle> pIt = particles.iterator();

    while(pIt.hasNext()) {
      Particle p = pIt.next();
      p.update();

      if (p.isDead()) {
        pIt.remove();
      } else {
        p.display();
      }
    }
  }

  void applyForce(PVector f) {
    for(Particle p: particles) {
      p.applyForce(f);
    }
  }

  void applyRepeller(Repeller r) {
    for(Particle p: particles) {
      PVector force = r.repel(p);
      p.applyForce(force);
    }
  }
}
