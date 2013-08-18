Mover[] movers = new Mover[20];
Liquid gravy;
PVector wind, gravity;

void setup() {
  size(700, 400);
  strokeWeight(2);
  frameRate(30);

  for(int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(0.5, 5), random(50, width - 50), 90);
  }

  gravy = new Liquid(0, height/2, width, height/2, 0.1);

  wind = new PVector(0.001, 0);
  gravity = new PVector(0, 0.1);
}

void draw() {
  background(255);

  gravy.display();

  for(int i = 0; i < movers.length; i++) {

    if (movers[i].isInside(gravy)) {
      movers[i].drag(gravy);
    }

    float m = 0.1 * movers[i].mass;
    PVector gravity = new PVector(0, m);
    movers[i].applyForce(gravity);

    movers[i].update();
    movers[i].display();
  }
}
