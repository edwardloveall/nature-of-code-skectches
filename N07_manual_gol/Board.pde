class Board {
  int s = 10;
  int columns;
  int rows;
  int[][] board;
  int[][] next;

  Board() {
    columns = width/s;
    rows = height/s;

    board = new int[columns][rows];
    next = new int[columns][rows];

    for (int i = 0; i < columns; i++) {
      for (int j = 0; j < rows; j++) {
        // board[i][j] = int(random(0, 2));
      }
    }
  }

  void update() {
    for (int i = 0; i < columns; i++) {
      for (int j = 0; j < rows; j++) {
        int neighbors = aliveNeighbors(i, j);
        next[i][j] = calcState(board[i][j], neighbors);
      }
    }

    board = next;
  }

  void display() {
    for (int i = 0; i < columns; i++) {
      for (int j = 0; j < rows; j++) {
        fill(board[i][j] == 1 ? 0 : 255);
        rect(i * s, j * s, s-1, s-1);
      }
    }
  }

  int aliveNeighbors(int x, int y) {
    int result = 0;

    for (int i = -1; i <= 1; i++) {
      for (int j = -1; j <= 1; j++) {
        int mod_x = mod(x + i, columns);
        int mod_y = mod(y + j, rows);
        result += board[mod_x][mod_y];
      }
    }

    result -= board[x][y];

    return result;
  }

  int calcState(int currentState, int neighborCount) {
    if      (currentState == 1 && neighborCount < 2) return 0;
    else if (currentState == 1 && neighborCount > 3) return 0;
    else if (currentState == 0 && neighborCount == 3) return 1;
    else    return currentState;
  }

  void toggleLife(float x, float y) {
    x = int(x/s);
    y = int(y/s);

    board[int(x)][int(y)] = 1 - board[int(x)][int(y)];

    // println("New life at " + x + ", " + y);
  }
}
