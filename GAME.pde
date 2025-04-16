void game(){
  background(0,255,0);
  
  circle(loc.x,loc.y,d);
  
loc.add(vel)
  
  if(loc.y <d/2 || loc.y > height-d/2) vel.y = -vel.y;
   if(loc.x <d/2 || loc.x > height-d/2) vel.x = -vel.x;
}

void gameClicks(){
  
}
