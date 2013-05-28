CA automata;

void setup() {
  size(700, 400);
  smooth();
  noStroke();
  frameRate(25);
  background(200);

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

int mod(int x, int y)
{
    int result = x % y;
    if (result < 0) {
        result += y;
    }
    return result;
}