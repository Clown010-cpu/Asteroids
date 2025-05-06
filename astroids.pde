
import ddf.minim.*;
import java.util.ArrayList;

int mode;
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;
int gameOverType = 0;

boolean upkey, downkey, leftkey, rightkey, spacekey;

float d;
int score, lives, highscore;
float size;

Minim minim;
AudioPlayer theme, coin, bump, gameover;

Spaceship player1;
ArrayList<GameObject> objects;

PFont arcadeFont;

void setup() {
  size(800, 800);
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  mode = INTRO;

  arcadeFont = createFont("Arial Black", 32);
  textFont(arcadeFont);

  objects = new ArrayList<GameObject>();
  player1 = new Spaceship();
  objects.add(player1);
  for (int i = 0; i < 5; i++) {
    objects.add(new Asteroid());
  }

  minim = new Minim(this);
  theme = minim.loadFile("theme.MP3");
  coin = minim.loadFile("coin.wav");
  bump = minim.loadFile("bump.wav");
  gameover = minim.loadFile("downer_noise.mp3");
}

void draw() {
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAMEOVER) {
    gameover();
  } else {
    println("Error: Invalid mode: " + mode);
  }
}

void resetGame() {
  objects.clear();
  player1 = new Spaceship();
  objects.add(player1);
  for (int i = 0; i < 5; i++) {
    objects.add(new Asteroid());
  }
  score = 0;
  lives = 3;
  gameOverType = 0;
  frameCount = 0;
}
