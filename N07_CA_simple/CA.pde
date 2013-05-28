class CA {
  int[] cells;
  int[] ruleset;
  int w;
  int generation;

  CA() {
    generation = 0;
    w = 10;
    cells = new int[width/w];
    ruleset = new int[]{0,1,0,1,1,0,1,0};

    for (int i = 0; i < cells.length; i++) {
      cells[i] = 0;
    }

    cells[int(cells.length/2)] = 1;
  }

  void generate() {
    int[] nextGen = new int[cells.length];
    for (int i = 1; i < cells.length-1; i++) {
      int left = cells[i-1];
      int center = cells[i];
      int right = cells[i+1];
      nextGen[i] = rules(left, center, right);
    }
    cells = nextGen;
    generation++;
  }

  int rules(int a, int b, int c) {
    String s = "" + a + b + c;
    int index = Integer.parseInt(s, 2);
    return ruleset[index];
  }

  void display() {
    for (int i = 0; i < cells.length; i++) {
      fill(cells[i] * 255);
      rect(i*w, generation*w, w, w);
    }
  }
}
