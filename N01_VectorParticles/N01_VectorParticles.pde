ArrayList<Particle> particles;

void setup() {
  size(300, 300);
  background(16);
  smooth();
  fill(255);
  noStroke();
  particles = new ArrayList();
  frameRate = 30;
}

void draw(){
  background(16);

  /*if (frameCount % 30 == 0) {*/
    PVector center = new PVector(width/2, height/2);
    PVector vel = new PVector(random(-0.2, 0.2), random(-0.2, 0.2));
    PVector accel = new PVector(random(-0.01, 0.01), random(-0.01, 0.01));
    particles.add(new Particle(center, vel, accel, 0));
  /*}*/

  Iterator<Particle> pIter = particles.iterator();
  while(pIter.hasNext()) {
    Particle p = pIter.next();
    if (p.inBounds()) {
      p.update();
      p.draw();
    } else {
      pIter.remove();
    }
  }
}
