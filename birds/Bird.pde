class Bird {
  PVector location;
  float baseR, r, rOff, theta, thetaVel;

  Bird(float _baseR, float _theta) {
    location = new PVector(width/2, height/2);

    baseR = _baseR;
    rOff = random(0, 1000);
    theta = _theta;
    thetaVel = random(0.002, 0.004);
  }

  void update() {
    theta += thetaVel;

    r = baseR + map(noise(rOff), 0, 1, -30, 30);
    rOff += 0.001;
  }

  void display() {
    arc(location.x, location.y, r, r, theta, theta + radians(5));
  }
}
