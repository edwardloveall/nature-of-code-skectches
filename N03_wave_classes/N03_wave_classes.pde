Wave one, two;

void setup() {
  size(700, 400);
  smooth();
  noStroke();
  fill(240, 30, 30);
  one = new Wave(40,  // segments
                 5,  // spacing
                 1,   // amplitude
                 0.2, // angleVelocity
                 0,   // startAngle
                 400  // xStart
                 );
   two = new Wave(10,  // segments
                  15,  // spacing
                  100,   // amplitude
                  0.5, // angleVelocity
                  10,   // startAngle
                  50  // xStart
                  );
}

void draw() {
  background(20);
  one.update();
  two.update();
}