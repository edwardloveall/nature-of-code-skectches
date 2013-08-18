class Ant extends Mover {
  Ant() {
    super();
    topSpeed = 3;
  }

  void update() {
    PVector mouse = new PVector(mouseX, mouseY);
    PVector dir = PVector.sub(mouse, location);
    dir.normalize();
    dir.mult(0.5);
    acceleration = dir;

    super.update();
  }

  void display() {
    stroke(0);
    fill(0, 30);

    float theta = velocity.heading2D();

    pushMatrix();
      translate(location.x, location.y);
      rotate(theta);
      rect(0, 0, 30, 10);
    popMatrix();
  }
}
