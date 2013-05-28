CA automata;

void setup() {
  size(700, 400);
  smooth();
  stroke(127);
  frameRate(25);
  background(255);

  automata = new CA();
}

void draw() {
  automata.display();
  automata.generate();
}

void printArray(int[] a) {
  for (int i = 0; i < a.length; i++) {
    print(a[i]);
    if (i != a.length - 1) {
      print(", ");
    }
  }
  println();
}