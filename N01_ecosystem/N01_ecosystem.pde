Fish[] fishies = new Fish[10];

void setup() {
  size(700, 400);
  smooth();
  noiseDetail(5);
  noiseSeed(millis() + second() + minute());
  
  background(255);
  
  for(int i = 0; i < fishies.length; i++) {
    fishies[i] = new Fish();
  }
}

void draw() {
  background(255);
  
  for(int i = 0; i < fishies.length; i++) {
    fishies[i].update();
    fishies[i].display();
  }
}

class Fish {
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector bias;
  float xOff, yOff;
  float topSpeed = 0.8;
  
  Fish() {
    location = new PVector(random(0, width), random(0, height));
    velocity = new PVector(0, 0);
    bias = new PVector(0.5, 0.5);
    xOff = random(0, 1000);
    yOff = random(1000, 2000);
  }
  
  void update() {
    acceleration = new PVector(noise(xOff), noise(yOff));
    acceleration.sub(bias);
    
    velocity.add(acceleration);
    velocity.limit(topSpeed);
    location.add(velocity);
    check_edges();
    
    xOff += 0.01;
    yOff += 0.01;
  }
  
  void display() {
    ellipse(location.x, location.y, 10, 10);
  }
  
  void check_edges() {
    if (location.x > width) {
      location.x = 0;
    } else if (location.x < 0) {
      location.x = width;
    }
    
    if (location.y > height) {
      location.y = 0;
    } else if (location.y < 0) {
      location.y = height;
    }
  }
}
