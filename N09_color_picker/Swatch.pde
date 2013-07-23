class Swatch {
  float hue, saturation, brightness;
  float x, y;
  int side;

  Swatch(float _x, float _y) {
    hue = random(1);
    saturation = random(1);
    brightness = 1;

    x = _x;
    y = _y;

    side = (x > halfWay) ? 1 : 0;
  }

  boolean isFit() {
    return (side == pickedSide) ? true : false;
  }

  Swatch crossover(Swatch mate, float x, float y) {
    Swatch s = new Swatch(x, y);

    float newHue = (hue + mate.hue) / 2;
    float newSaturation = (saturation + mate.saturation) / 2;
    s.hue = newHue;
    s.saturation = newSaturation;

    return s;
  }

  void mutate() {
    hue += random(-0.1, 0.1);
    saturation += random(-0.1, 0.1);
  }

  void display() {
    fill(hue, saturation, brightness);
    rect(x, y, size, size);
  }
}
