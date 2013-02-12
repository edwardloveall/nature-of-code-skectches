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

public class VectorParticles extends PApplet {

ArrayList<Particle> particles;

public void setup() {
  size(300, 300);
  background(16);
  smooth();
  fill(255);
  noStroke();
  particles = new ArrayList();
  frameRate = 30;
}

public void draw(){
  println(particles.size());

  background(16);

  /*if (frameCount % 30 == 0) {*/
    PVector center = new PVector(width/2, height/2);
    PVector vel = new PVector(random(-0.2f, 0.2f), random(-0.2f, 0.2f));
    PVector accel = new PVector(random(-0.01f, 0.01f), random(-0.01f, 0.01f));
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
class Particle {
  PVector location, velocity, acceleration;
  float mass, topSpeed;
  float size;

  Particle(PVector _location, PVector _velocity, PVector _acceleration, float _mass) {
    location =      _location;
    velocity =      _velocity;
    acceleration =  _acceleration;
    mass =          _mass;
    topSpeed = 2;
    size = 1f;
  } // Particle Constructor

  public void update() {
    velocity.add(acceleration);
    velocity.limit(topSpeed);
    location.add(velocity);
  }

  public void draw() {
    ellipse(location.x, location.y, size, size);
  }

  /*boolean alive() {
    if (life > 0) {
      return true;
    } else {
      return false;
    }
  }*/

  public boolean inBounds() {
    if (location.x + size*0.5f >  width || location.x - size*0.5f <  0 || location.y + size*0.5f >  height || location.y - size*0.5f <  0) {
      return false;
    } else {
      return true;
    }
  }

}
  static public void main(String args[]) {
    PApplet.main(new String[] { "--bgcolor=#FFFFFF", "VectorParticles" });
  }
}
