ArrayList<Branch> branches;
float theta = radians(60);
float length = 100;

void setup() {
  size(700, 400);
  strokeWeight(2);
  stroke(255);

  branches = new ArrayList<Branch>();
  Branch root = new Branch(new PVector(width/2, height), new PVector(width/2, height - length), 0);

  branches.add(root);
}

void draw() {
  background(20);

  for(Branch b: branches) {
    b.display();
  }
}

void mousePressed() {
  ArrayList<Branch> next;

  for (int i = branches.size() - 1; i >= 0; i--) {
    Branch b = (Branch)branches.get(i);
    b.branch();
  }
  println("------");
}
