ArrayList<Particle> particles;

void setup() {
  size(700, 400);
  background(16);
  smooth();
  fill(255);
  noStroke();
  particles = new ArrayList();
  frameRate = 30;
}

void draw(){
  background(16);

  if (frameCount % 10 == 0) {
    PVector center = new PVector(width/2, height/2);
    PVector vel = new PVector(random(-0.2, 0.2), random(-0.2, 0.2));

    color aColor = color(random(30, 255));
    particles.add(new Particle(center, vel, 1, aColor));
  }

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

void mousePressed() {
  PVector wind = new PVector(random(-0.2, 0.2), 0);
  while (wind.x <= 0.01 || wind.x >= -0.01) {
    wind.x = random(-0.2, 0.2);
  }

  Iterator<Particle> pIter = particles.iterator();
  while(pIter.hasNext()) {
    Particle p = pIter.next();
    p.addForce(wind);
  }
}

/*void mouseReleased() {
  PVector wind = new PVector(random(-1, 1));

  Iterator<Particle> pIter = particles.iterator();
  while(pIter.hasNext()) {
    Particle p = pIter.next();
    p.removeForce(wind);
  }
}*/
