class Cell {
  int x, y;
  float s;

  int state;
  int prev;

  Cell(int _x, int _y, float _s) {
    x = _x;
    y = _y;
    s = _s;

    state = 0;
    prev = 0;
  }

  void display() {
    fill(state == 1 ? 0 : 255);
    rect(x, y, s-1, s-1);
  }
}
