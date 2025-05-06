class EnemyBullet extends GameObject {
int timer;

EnemyBullet(PVector l, PVector v) {
super(l.copy(), v.copy());
vel.setMag(6);
timer = 120;
d = 8;
}

void show() {
fill(255, 50, 50);
noStroke();
ellipse(loc.x, loc.y, d, d);
}

void act() {
loc.add(vel);
wrapAround();
timer--;
if (timer <= 0) lives = 0;

// Check collision with player
if (player1.lives > 0 && dist(loc.x, loc.y, player1.loc.x, player1.loc.y) < d / 2 + player1.d / 2) {
player1.lives = 0;
this.lives = 0;
}
}
}
