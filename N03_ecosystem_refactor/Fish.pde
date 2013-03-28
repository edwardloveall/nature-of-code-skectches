class Fish extends Mover{
  float xOff, yOff;
  PVector bias;
  
  Fish(float _mass) {
    super();
    bias = new PVector(-0.5, -0.5);
    xOff = random(0, 1000);
    yOff = random(1000, 2000);
    topSpeed = 1;
    mass = _mass;
    density = 0.08;
  }
  
  void update() {
    PVector noise = new PVector(noise(xOff), noise(yOff));
    noise.add(bias);
    // bias is here because perlin noise returns 0 - 1
    // which by default creates south-easterly motion
    acceleration.add(noise);
    
    super.update();
    
    xOff += 0.01;
    yOff += 0.01;
  }
  
  void display() {
    stroke(0);
    fill(0, 30);
    ellipse(location.x, location.y, mass / density, mass / density);
  }
}
