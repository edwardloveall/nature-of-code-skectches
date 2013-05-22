ArrayList<Vehicle> vehicles;

void setup() {
  size(700, 400);
  smooth();
  noStroke();

  vehicles = new ArrayList<Vehicle>();
  for (int i = 0; i < 100; i++) {
    vehicles.add(new Vehicle());
  }
}

void draw() {
  background(255);

  for(Vehicle v: vehicles) {
    v.separate(vehicles);
    v.update();
    v.checkEdges();
    v.display();
  }
}
