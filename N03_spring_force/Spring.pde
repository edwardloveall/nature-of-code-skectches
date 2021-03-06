class Spring {
  PVector anchor;
  float restLength;
  float k;

  Spring(float _restLength, PVector _anchor) {
    anchor = _anchor;
    restLength = _restLength;
    k = 0.05;
  }

  PVector connect(Bob b) {
    PVector force = PVector.sub(b.location, anchor);
    float currentLength = force.mag();
    float stretch = currentLength - restLength;

    force.normalize();
    force.mult(-1 * k * stretch);

    return force;
  }

  void display(Bob b) {
    line(anchor.x, anchor.y, b.location.x, b.location.y);
  }
}