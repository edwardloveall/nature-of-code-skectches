class Swatch {
  float hue, saturation, brightness;
  float x, y;
  int side;
  float mutationAmount = 0.02;

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

  Swatch tetradic(Swatch parent) {
    // Tetradic color from here: http://www.tigercolor.com/color-lab/color-theory/color-harmonies.htm

    int[] angles = { 0, 1/6, 3/6, 4/6 };
    Swatch s = new Swatch(parent.x, parent.y);

    s.hue += angles[int(random(angles.length))];
    mod(s.hue, 1.0);

    return s;
  }

  void mutate() {
    if (random(1) > mutationRate) {
      return;
    }

    hue += random(-mutationAmount, mutationAmount);
    saturation += random(-mutationAmount, mutationAmount);

    mod(hue, 1.0);
    mod(saturation, 1.0);
  }

  void display() {
    fill(hue, saturation, brightness);
    rect(x, y, size, size);
  }
}
