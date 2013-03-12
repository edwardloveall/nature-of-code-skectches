class Vehicle extends Mover {
  float angle;

  Vehicle(PVector _l) {
    super();
    location = _l;
  }

  void display() {
    angle = velocity.heading();

    pushMatrix();
      translate(location.x, location.y);
      rotate(angle);
      rect(0, 0, 30, 10);
    popMatrix();
  }
}
