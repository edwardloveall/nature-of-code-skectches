class ParticleSystem {
  ArrayList<Ember> embers;
  PVector buoyancy;

  ParticleSystem() {
    embers = new ArrayList<Ember>();
    buoyancy = new PVector(0, -40);
  }

  void run() {
    // for(int i = 0; i < 2; i++) {
      PVector startLoc = new PVector(width/2 + random(-80, 80), height + 20);
      Ember ember = new Ember(startLoc, 20, 2);
      ember.applyForce(buoyancy);
      embers.add(ember);
    // }

    Iterator<Ember> eIt = embers.iterator();

    while(eIt.hasNext()) {
      Ember e = eIt.next();
      e.update();

      if (e.isDead()) {
        eIt.remove();
      } else {
        e.display();
      }

    }
  }
}
