import processing.core.*;
import processing.xml.*;

import java.applet.*;
import java.awt.Dimension;
import java.awt.Frame;
import java.awt.event.MouseEvent;
import java.awt.event.KeyEvent;
import java.awt.event.FocusEvent;
import java.awt.Image;
import java.io.*;
import java.net.*;
import java.text.*;
import java.util.*;
import java.util.zip.*;
import java.util.regex.*;

public class Forces extends PApplet {

ArrayList<Particle> particles;

public void setup() {
  size(700, 400);
  background(16);
  smooth();
  fill(255);
  noStroke();
  particles = new ArrayList();
  frameRate = 30;
}

public void draw(){
  background(16);

  if (frameCount % 10 == 0) {
    PVector center = new PVector(width/2, height/2);
    PVector vel = new PVector(random(-0.2f, 0.2f), random(-0.2f, 0.2f));
    while (vel.x == 0) {
      println(vel);
      vel.x = random(-0.2f, 0.2f);
    }

    int aColor = color(random(30, 255));
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

public void mousePressed() {
  PVector wind = new PVector(random(-0.2f, 0.2f), 0);
  while (wind.x <= 0.01f || wind.x >= -0.01f) {
    wind.x = random(-0.2f, 0.2f);
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
class Particle {
  PVector location, velocity, acceleration;
  float mass, topSpeed;
  float size;
  int aColor;

  Particle(PVector _location, PVector _velocity, float _mass, int _color) {
    location =      _location;
    velocity =      _velocity;
    acceleration =  new PVector(0, 0);
    mass =          _mass;
    aColor =         _color;
    topSpeed = 2;
    size = 2f;
  } // Particle Constructor

  public void update() {
    velocity.add(acceleration);
    velocity.limit(topSpeed);
    location.add(velocity);
    acceleration.mult(0);
  }

  public void draw() {
    fill(aColor);
    ellipse(location.x, location.y, size, size);
  }

  public void addForce(PVector force) {
    force.div(mass);
    acceleration.add(force);
  }

  /*boolean alive() {
    if (life > 0) {
      return true;
    } else {
      return false;
    }
  }*/

  public boolean inBounds() {
    if (location.x - size*0.5f >  width || location.x + size*0.5f <  0 || location.y - size*0.5f >  height || location.y + size*0.5f <  0) {
      return false;
    } else {
      return true;
    }
  }

}
  static public void main(String args[]) {
    PApplet.main(new String[] { "--bgcolor=#FFFFFF", "Forces" });
  }
}
