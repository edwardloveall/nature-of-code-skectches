Path p;
Vehicle v;

void setup() {
  size(700, 400);
  smooth();

  p = new Path();
  v = new Vehicle();
}

void draw() {
  background(255);
  p.display();
  v.follow(p);
  v.update();
  v.checkEdges();
  v.display();
}
