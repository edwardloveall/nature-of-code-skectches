class Turtle {
  String todo;
  float len;
  float theta;

  Turtle(String _todo, float _len, float _theta) {
    todo = _todo;
    len = _len;
    theta = _theta;
  }

  void render() {
    for (int i = 0; i < todo.length(); i++) {
      char c = todo.charAt(i);

      if (c == 'F') {
        line(0, 0, 0, len);
        translate(0, len);
      } else if (c == 'G') {
        translate(0, len);
      } else if (c == '+') {
        rotate(theta);
      } else if (c == '-') {
        rotate(-theta);
      } else if (c == '[') {
        pushMatrix();
      } else if (c == ']') {
        popMatrix();
      }
    }
  }

  void setLen(float l) {
    len = l;
  }

  void setTodo(String s) {
    todo = s;
  }
}
