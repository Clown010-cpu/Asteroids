void game(){
  background(0,255,0);
  
  circle(x,y,d);
  
  x = x + vx;
  y = y + vy;
  
  if(y <d/2 || y > height-d/2) vy = -vy;
   if(y <d/2 || x > height-d/2) vx = -vx;
}

void gameClicks(){
  
}
