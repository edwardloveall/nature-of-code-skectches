CA automata;

void setup() {
  size(700, 400);
  smooth();
  frameRate(25);
  background(255);

  automata = new CA();
}

void draw() {
  automata.display();
  automata.generate();
}
