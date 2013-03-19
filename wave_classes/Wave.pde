class Wave {
  float segments, spacing;
  float amplitude, angleVelocity;
  float startAngle;
  float xStart;

  Wave(float _segments, float _spacing, float _amp, float _aVel, float _angle, float _x) {
    segments = _segments;
    spacing = _spacing;
    amplitude = _amp;
    angleVelocity = _aVel;
    startAngle = _angle;
    xStart = _x;
  }

  void update() {
    float angle = startAngle;

    for (float x = xStart; x < segments * spacing + xStart; x += spacing) {
      float y = amplitude * sin(angle);
      angle += angleVelocity;
      rect(x, y + height / 2, 12, 2);
    }
    startAngle += 0.1;
  }
}
