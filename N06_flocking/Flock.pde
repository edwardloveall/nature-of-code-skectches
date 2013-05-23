class Flock {
  ArrayList<Boid> boids;

  Flock(int count) {
    boids = new ArrayList<Boid>();
    for (int i = 0; i < count; i++) {
      boids.add(new Boid());
    }
  }

  void addBoid() {
    boids.add(new Boid());
  }

  void run() {
    for(Boid b: boids) {
      b.flock(boids);
      b.update();
      b.checkEdges();
      b.display();
    }
  }
}
