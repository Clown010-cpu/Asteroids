void intro() {
  background(#0A0A2A);
  textSize(90);
  fill(#FF9C21);
  text("SPACE GAME", width / 2, 200);

  // Simulated animated asteroid
  pushMatrix();
  translate(width / 2, 400);
  rotate(frameCount * 0.05);
  stroke(255);
  noFill();
  ellipse(0, 0, 80, 80);
  popMatrix();

  rectButton("START", width / 2, 600, 200, 100);
}

void introClicks() {
  if (mouseX > 300 && mouseX < 500 && mouseY > 550 && mouseY < 650) {
    mode = GAME;
  }
}
