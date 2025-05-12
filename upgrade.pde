class UpgradeItem extends GameObject {
  String type;
  color glow;

  UpgradeItem() {
    super(random(width), random(height), random(-1, 1), random(-1, 1));
    vel.setMag(random(1, 2));
    String[] types = { "heal", "rapidFire", "shield", "doubleShot", "tripleShot" };
    type = types[int(random(types.length))];
    d = 30;
    glow = type.equals("heal") ? color(0, 255, 0) :
           type.equals("rapidFire") ? color(0, 150, 255) :
           type.equals("shield") ? color(255, 255, 0) :
           type.equals("doubleShot") ? color(255, 128, 0) :
           color(255, 0, 255);
  }

  void show() {
    pushMatrix();
    translate(loc.x, loc.y);
    noStroke();
    fill(glow, 180);
    ellipse(0, 0, d + 10, d + 10);
    stroke(255); fill(0);
    ellipse(0, 0, d, d);
    textSize(16);
    fill(255);
    text(type.substring(0, 1).toUpperCase(), 0, 2);
    popMatrix();
  }

  void act() {
    loc.add(vel);
    wrapAround();
    checkHit();
  }

  void checkHit() {
    for (int i = 0; i < objects.size(); i++) {
      GameObject obj = objects.get(i);
      if (obj instanceof Bullet && dist(loc.x, loc.y, obj.loc.x, obj.loc.y) < d / 2 + obj.d / 2) {
        applyUpgrade();
        obj.lives = 0;
        lives = 0;
      }
    }
  }

  void applyUpgrade() {
    if (type.equals("heal") && player1.lives < 5) {
      player1.lives++;
    } else if (type.equals("rapidFire")) {
      player1.upgradeTimer = 600;
      player1.upgradeType = "rapidFire";
    } else if (type.equals("shield")) {
      player1.invincibleTimer = 300;
    } else if (type.equals("doubleShot")) {
      player1.upgradeType = "doubleShot";
      player1.upgradeTimer = 600;
    } else if (type.equals("tripleShot")) {
      player1.upgradeType = "tripleShot";
      player1.upgradeTimer = 600;
    }

    println("Upgrade Activated: " + type);
  }
}
