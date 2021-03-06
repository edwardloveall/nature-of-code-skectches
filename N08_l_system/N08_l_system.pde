LSystem lsys;
Turtle turtle;

void setup() {
  size(700, 400);

  Rule[] ruleset = new Rule[1];
  // ruleset[0] = new Rule('F', "FF+[+F-F-F]-[-F+F+F]");
  // ruleset[0] = new Rule('F', "GF--F+G");
  ruleset[0] = new Rule('F', "F+F+F-F");
  lsys = new LSystem("F", ruleset);
  turtle = new Turtle(lsys.getSentence(), height/30, radians(60));

  strokeWeight(2);
}

void draw() {
  background(255);
  translate(width/2, height/2);
  rotate(-PI);
  turtle.render();
  noLoop();
}

int counter = 0;

void mousePressed() {
  if (counter < 50) {
    pushMatrix();
      lsys.generate();
      turtle.setTodo(lsys.getSentence());
    popMatrix();
    redraw();
    counter++;
  }
}
