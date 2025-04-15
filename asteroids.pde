//charles
//4-15-2025

color black = #000000;
color white = #FFFFFF;
color red = #DD0000

final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;

int mode = INTRO;

boolean upkey, downkey, leftkey, rightkey;

void setup(){
  siz(800,600);
  textAlign(CENTER,CENTER);
  rectMode(CENTER);
  
}

void draw() {
  if (mode == INTRO) intro();
  else if (mode == GAME) game();
  else if (mode == PAUSE) pause();
  else if (mode == GAMEOVER) gameOver();
}
