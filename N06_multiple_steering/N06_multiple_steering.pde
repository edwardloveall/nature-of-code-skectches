ArrayList<Vehicle> vehicles;

void setup() {
  size(700, 400);
  smooth();
  noStroke();
  colorMode(HSB, 360, 100, 100);

  vehicles = new ArrayList<Vehicle>();
  for (int i = 0; i < 200; i++) {
    vehicles.add(new Vehicle());
  }
}

void draw() {
  background(32);

  for(Vehicle v: vehicles) {
    v.applyBehaviors(vehicles);
    v.update();
    v.checkEdges();
    v.display();
  }
}
