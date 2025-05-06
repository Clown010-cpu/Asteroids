class Asteroid extends GameObject {

  float angle;
  float rotationSpeed;

  Asteroid() {
    super(random(width), random(height), 1, 1);
    vel.setMag(random(1, 3));
    vel.rotate(random(TWO_PI));
    lives = 3;
    d = lives * 40;
    angle = random(TWO_PI);
    rotationSpeed = random(-0.02, 0.02);
  }

  Asteroid(PVector location, int level) {
    super(location.copy(), PVector.random2D().mult(random(1, 3)));
    lives = level;
    d = lives * 40;
    angle = random(TWO_PI);
    rotationSpeed = random(-0.02, 0.02);
  }

  void show() {
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(angle);
    stroke(255);
    noFill();
    beginShape();
    for (int i = 0; i < 8; i++) {
      float theta = TWO_PI / 8 * i;
      float r = d / 2 + random(-5, 5);
      vertex(cos(theta) * r, sin(theta) * r);
    }
    endShape(CLOSE);
    popMatrix();
  }

  void act() {
    loc.add(vel);
    angle += rotationSpeed;
    wrapAround();
    checkForCollisions();
  }

  void checkForCollisions() {
    int i = 0;
    while (i < objects.size()) {
      GameObject obj = objects.get(i);
      if (obj instanceof Bullet) {
        if (dist(loc.x, loc.y, obj.loc.x, obj.loc.y) < d / 2 + obj.d / 2) {
          int currentSize = lives;
          obj.lives = 0;

          if (currentSize > 1) {
            for (int j = 0; j < 2; j++) {
              objects.add(new Asteroid(loc, currentSize - 1));
            }
          }

          for (int p = 0; p < 12; p++) {
            PVector pv = PVector.random2D().mult(random(1, 3));
            objects.add(new Particle(loc.copy(), pv, color(200, 200, 200)));
          }

          lives = 0;
        }
      }
      i++;
    }
  }
}
