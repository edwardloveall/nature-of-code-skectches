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

    randomInit();

    // cells[int(cells.length/2)] = 1;
  }

  void randomInit() {
    for (int i = 0; i < cells.length; i++) {
      cells[i] = int(random(0, 2));
    }
  }

  void randomRules() {
    for (int i = 0; i < ruleset.length; i++) {
      ruleset[i] = int(random(0, 2));
    }
    printArray(ruleset);
  }

  void generate() {
    int[] nextGen = new int[cells.length];
    for (int i = 0; i < cells.length; i++) {
      int left = cells[mod(i - 1, cells.length)];
      int center = cells[i];
      int right = cells[mod(i + 1, cells.length)];
      nextGen[i] = rules(left, center, right);
    }
    cells = nextGen;

    if (generation >= height/s) {
      randomInit();
      randomRules();
      generation = 0;
    } else {
      generation++;
    }
  }

  int rules(int a, int b, int c) {
    String s = "" + a + b + c;
    int index = Integer.parseInt(s, 2);
    return ruleset[index];
  }

  void display() {
    for (int i = 0; i < cells.length; i++) {
      fill(cells[i] == 1 ? 62 : 200);
      rect(i*s, generation*s, s, s);
    }
  }
}
