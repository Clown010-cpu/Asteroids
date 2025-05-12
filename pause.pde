void pause() {
  background(#1C1C1C);
  fill(#00FFB3);
  textSize(60);
  text("PAUSED", width / 2, 200);

  fill(#FF007F);
  ellipse(width / 2 + sin(frameCount * 0.1) * 100, 400, 60, 60);

  rectButton("RESUME", width / 2, 600, 200, 100);
}

void pauseClicks() {
  if (mouseX > 300 && mouseX < 500 && mouseY > 550 && mouseY < 650) {
    mode = GAME;
  }
}
