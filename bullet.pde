class Bullet extends GameObject {
  int timer;
  boolean fromUFO;

  Bullet() {
    super(player1.loc.copy(), player1.dir.copy());
    vel.setMag(10);
    timer = 60;
    d = 5;
    fromUFO = false;
  }

  Bullet(PVector pos, PVector direction, boolean ufoShot) {
    super(pos.copy(), direction.copy());
    vel.setMag(6);
    timer = 60;
    d = 5;
    fromUFO = ufoShot;
  }

  void show() {
    stroke(fromUFO ? color(255, 0, 0) : 255);
    strokeWeight(2);
    noFill();
    circle(loc.x, loc.y, d);
  }

  void act() {
    loc.add(vel);
    wrapAround();
    timer--;
    if (timer <= 0) lives = 0;
  }
}
