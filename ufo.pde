class UFO extends GameObject {
  int fireCooldown;

  UFO() {
    super(random(1) < 0.5 ? -50 : width + 50, random(height), 0, 0);
    vel = new PVector(random(1) < 0.5 ? 2 : -2, random(-1, 1));
    fireCooldown = 120;
    d = 40;
  }

  void show() {
    fill(255, 0, 255);
    noStroke();
    ellipse(loc.x, loc.y, d, d / 2);
    fill(255);
    ellipse(loc.x, loc.y - 5, 20, 10);
  }

  void act() {
    loc.add(vel);
    wrapAround();
    fireCooldown--;

    if (fireCooldown <= 0) {
      fireAtPlayer();
      fireCooldown = 120;
    }

    if (loc.x < -60 || loc.x > width + 60) lives = 0;

    checkForHit();
  }

  void fireAtPlayer() {
    PVector aim = PVector.sub(player1.loc, this.loc).normalize();
    Bullet b = new Bullet(this.loc, aim, true);
    objects.add(b);
  }

  void checkForHit() {
    for (int i = 0; i < objects.size(); i++) {
      GameObject obj = objects.get(i);
      if (obj instanceof Bullet) {
        Bullet b = (Bullet) obj;
        if (!b.fromUFO && dist(loc.x, loc.y, b.loc.x, b.loc.y) < d / 2 + b.d / 2) {
          lives = 0;
          b.lives = 0;

          for (int p = 0; p < 15; p++) {
            PVector pv = PVector.random2D().mult(random(1, 2));
            objects.add(new Particle(loc.copy(), pv, color(255, 0, 255)));
          }

          totalKills++;
          if (totalKills % 10 == 0) {
            objects.add(new UpgradeItem());
          }
        }
      }
    }
  }
}
