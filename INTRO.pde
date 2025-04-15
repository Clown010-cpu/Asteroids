void intro(){
  background(black);
  
  fill(white);
  textSize(100);
  text("ASTEROIDS", width/2, height/2-100);
  
  drawSquareButton(white,black,red,width/4,height/2+100,150,75);
  
}

void introClicks(){
  if(buttonTouchesMouse(width/4, height/2+100,150,75))[
  mode = GAME;
}
}
