class Branch {
  PVector start, end;
  float length;
  float angle;

  Branch(PVector _start, PVector _end, float _parentAngle) {
    start = _start;
    end = _end;
    angle = _parentAngle;
    println(degrees(angle));
  }

  void branch() {
    PVector distance = PVector.sub(end, start);
    length = distance.mag();
    length *= 0.66;

    // angle += radians(random(-5, 5));
    PVector nextA = branchA();
    PVector nextB = branchB();
    branches.add(new Branch(end, nextA, angle + theta));
    branches.add(new Branch(end, nextB, angle - theta));
  }

  PVector branchA() {
    PVector a = new PVector();

    a.x = length * cos(angle + theta);
    a.y = length * sin(angle + theta);

    return a;
  }

  PVector branchB() {
    PVector b = new PVector();

    b.x = length * cos(angle - theta);
    b.y = length * sin(angle - theta);

    return b;
  }

  void display() {
    line(start.x, start.y, end.x, end.y);
  }
}
