class Particle extends GameObject {
  float alpha;
  color col;

  Particle(PVector pos, PVector velocity, color c) {
    super(pos.copy(), velocity.copy());
    d = random(2, 5);
    alpha = 255;
    col = c;
  }

  void show() {
    noStroke();
    fill(col, alpha);
    ellipse(loc.x, loc.y, d, d);
  }

  void act() {
    loc.add(vel);
    alpha -= 4;
    if (alpha <= 0) lives = 0;
  }
}
