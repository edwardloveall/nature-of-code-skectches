class Bob extends Mover {
  PVector bob;

  Bob(float m, float x, float y) {
    super(m, x, y);
  }

  void display() {
    ellipse(location.x, location.y, 30, 30);
  }
}