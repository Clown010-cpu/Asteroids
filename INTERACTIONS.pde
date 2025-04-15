void mouseReleased(){
  if(mode == INTRO) introClicks();
  else if (mode == GAME) gameClicks();
  else if (mode == PAUSE) pasueClicks();
  else if (mode == GAMEOVER) GameOverClicks();
}

void keyPressed(){
  if(keyCode == UP) upkey = true;
  else if (keyCode == DOWN) downkey = true;
  else if (keyCode == LEFT) leftkey = true;
  else if (keyCode == RIGHT) rightkey = true;
}
