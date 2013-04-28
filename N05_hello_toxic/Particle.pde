class Particle extends VerletParticle2D {
  VerletParticle2D p;

  Particle(Vec2D pos) {
    super(pos);
  }

  void display() {
    ellipse(x, y, 16, 16);
  }
}
