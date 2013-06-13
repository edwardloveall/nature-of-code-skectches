class Cell {
  int x, y;
  float s;

  float state;
  float display_state;
  float prev;

  Cell(int _x, int _y, float _s) {
    x = _x;
    y = _y;
    s = _s;

    state = 0;
    prev = 0;
  }

  void display() {
    fill(255 - (state * 255));
    rect(x, y, s-1, s-1);
  }
}
