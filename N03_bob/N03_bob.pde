float period;
float amplitude;

void setup() {
  size(700, 400);
  smooth();

  period = 300;
  amplitude = 150;
}

void draw() {
  background(255);

  float y = amplitude * sin(TWO_PI * frameCount / period);
  float y_pos = y + height/2;

  line(width/2, 50, width/2, y_pos);
  ellipse(width/2, y_pos, 30, 30);
}
