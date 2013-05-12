class Vehicle extends Mover {
  void seek(PVector target) {
    PVector desired = PVector.sub(target, location);
    desired.normalize();
    desired.mult(topSpeed);

    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxForce);
    applyForce(steer);
  }

  void flee(PVector target) {
    PVector desired = PVector.sub(target, location);
    desired.normalize();
    desired.mult(topSpeed);

    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxForce);
    steer.mult(-1);
    applyForce(steer);
  }
}
