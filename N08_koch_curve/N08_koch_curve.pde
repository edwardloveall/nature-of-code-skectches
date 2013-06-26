ArrayList<KochLine> lines;

void setup() {
  size(700, 400);
  lines = new ArrayList<KochLine>();

  PVector start = new PVector(0, height/2);
  PVector end = new PVector(width, height/2);

  lines.add(new KochLine(start, end));
}

void draw() {
  background(255);
  println(lines.size());

  for(KochLine k: lines) {
    k.display();
  }
}


void mousePressed() {
  ArrayList next = new ArrayList<KochLine>();

  for(KochLine k: lines) {
    PVector a = k.kochA();
    PVector b = k.kochB();
    PVector c = k.kochC();
    PVector d = k.kochD();
    PVector e = k.kochE();

    next.add(new KochLine(a, b));
    next.add(new KochLine(b, c));
    next.add(new KochLine(c, d));
    next.add(new KochLine(d, e));
  }

  lines = next;
}
