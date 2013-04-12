class ParticleSystem {
  ArrayList<Particle> particles;

  ParticleSystem(float number_of_particles) {
    particles = new ArrayList<Particle>();

    for (int i = 0; i < number_of_particles; i++) {
      PVector loc = new PVector(random(width), random(height));
      PVector vel = new PVector(0, 0);
      Particle p = new Particle(loc, vel, random(10, 20), 1);
      add(p);
    }
  }

  void run() {
    float chance = random(1);
    if (chance > 0.96) {
      PVector loc = new PVector(random(width), height + 10);
      PVector vel = new PVector(0, 0);
      Particle p = new Particle(loc, vel, random(10, 20), 1);
      add(p);
    }


    Iterator<Particle> partIt = particles.iterator();

    while(partIt.hasNext()) {
      Particle p = partIt.next();
      p.update();

      if (p.offScreen()) {
        partIt.remove();
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

  void add(Particle p) {
    p.applyForce(buoyancy);
    particles.add(p);
  }

  void shift(PVector amount) {
    for(Particle p: particles) {
      p.vx = amount.x;
      p.vy = amount.y;
    }
  }
}
