//charles
//4-15-2025

color black = #000000;
color white = #FFFFFF;
color red = #DD0000

final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;

PVector loc;
PVector vel;
float d;


boolean upkey, downkey, leftkey, rightkey;

void setup(){
  siz(800,600);
  mode = INTRO;
  textAlign(CENTER,CENTER);
  rectMode(CENTER);
  
  loc = new PVector(width/2, height/2);
  //x = width/2;
  //y = height/2;
  d = 100;
  
  vel = new PVector(random(-5,5),random(-5,5));
  //vx = random(-5,5);
  //vy = random(-5,5);
}

void draw() {
  if (mode == INTRO) intro();
  else if (mode == GAME) game();
  else if (mode == PAUSE) pause();
  else if (mode == GAMEOVER) gameOver();
}
