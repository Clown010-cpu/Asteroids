class GameObject {
  PVector loc;
  PVector vel;
  int lives;
  float d;

  GameObject(float lx, float ly, float vx, float vy) {
    loc = new PVector(lx, ly);
    vel = new PVector(vx, vy);
    lives = 1;
  }

  GameObject(PVector l, PVector v) {
    loc = l.copy();
    vel = v.copy();
    lives = 1;
  }

  void act() {
    // Override this
  }

  void show() {
    // Override this
  }

  void wrapAround() {
    if (loc.x > width) loc.x = 0;
    if (loc.x < 0) loc.x = width;
    if (loc.y < 0) loc.y = height;
    if (loc.y > height) loc.y = 0;
  }
}
