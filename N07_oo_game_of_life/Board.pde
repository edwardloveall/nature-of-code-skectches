class Board {
  int s = 10;
  int columns;
  int rows;
  Cell[][] board;

  Board() {
    columns = width/s;
    rows = height/s;

    board = new Cell[columns][rows];

    for (int i = 0; i < columns; i++) {
      for (int j = 0; j < rows; j++) {
        board[i][j] = new Cell(i * s, j * s, s);
      }
    }
  }

  void update() {
    for (int i = 0; i < columns; i++) {
      for (int j = 0; j < rows; j++) {
        board[i][j].prev = board[i][j].state;
      }
    }

    for (int i = 0; i < columns; i++) {
      for (int j = 0; j < rows; j++) {
        int neighbors = aliveNeighbors(i, j);
        int state = calcState(board[i][j].prev, neighbors);
        board[i][j].state = state;
      }
    }
  }

  void display() {
    for (int i = 0; i < columns; i++) {
      for (int j = 0; j < rows; j++) {
        board[i][j].display();
      }
    }
  }

  int aliveNeighbors(int x, int y) {
    int result = 0;

    for (int i = -1; i < 2; i++) {
      for (int j = -1; j < 2; j++) {
        int mod_x = mod(x + i, columns);
        int mod_y = mod(y + j, rows);
        result += board[mod_x][mod_y].prev;
      }
    }

    result -= board[x][y].prev;

    if (x == 3 && y == 3 && result > 0) {
      println(result);
    }

    return result;
  }

  int calcState(int prevState, int neighborCount) {
    if      (prevState == 1 && neighborCount < 2) return 0;
    else if (prevState == 1 && neighborCount > 3) return 0;
    else if (prevState == 0 && neighborCount == 3) return 1;
    else    return prevState;
  }

  void addLife(float _x, float _y) {
    int x = int(_x/s);
    int y = int(_y/s);

    board[int(x)][int(y)].state = 1;
  }
}
