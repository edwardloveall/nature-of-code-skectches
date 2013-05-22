Vehicle[] things;
Flowfield field;

void setup() {
  size(700, 400);
  smooth();
  noStroke();


  things = new Vehicle[50];
  for(int i = 0; i < 50; i++) {
    things[i] = new Vehicle();
  }
  field = new Flowfield();
}

void draw() {
  background(255);

  for(Vehicle v : things) {
    v.flow(field);
    v.update();
    v.checkEdges();
    v.display();
  }
}
