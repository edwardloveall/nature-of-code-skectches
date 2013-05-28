class CA {
  int[] cells;
  int[] ruleset;
  int s;
  int generation;

  CA() {
    generation = 0;
    s = 10;
    cells = new int[width/s];
    ruleset = new int[]{0,1,0,1,1,0,1,0};
    printArray(ruleset);

    for (int i = 0; i < cells.length; i++) {
      cells[i] = 0;
    }

    cells[int(cells.length/2)] = 1;
  }

  void randomRules() {
    for (int i = 0; i < ruleset.length; i++) {
      ruleset[i] = int(random(0, 2));
    }
    printArray(ruleset);
    generation = 0;
  }

  void generate() {
    if (generation >= height/s) {
      randomRules();
    }

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
      fill(cells[i] == 1 ? 0 : 255);
      rect(i*s, generation*s, s, s);
    }
  }
}
