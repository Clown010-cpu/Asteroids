void gameover() {
  background(0);

  if (gameOverType == 1) {
    fill(#00FF00);
    textSize(70);
    text("YOU WIN!", width / 2, 200);
  } else if (gameOverType == 2) {
    fill(#FF0000);
    textSize(70);
    text("GAME OVER", width / 2, 200);
  } else {
    fill(255);
    textSize(70);
    text("GAME OVER", width / 2, 200);
  }

  // Animated orbiting visual
  pushMatrix();
  translate(width / 2, height / 2);
  rotate(frameCount * 0.02);
  stroke(255);
  fill(255, 50);
  ellipse(100, 0, 40, 40);
  popMatrix();

  rectButton("RESTART", width / 2, 600, 200, 100);
}

void gameoverClicks() {
  if (mouseX > 300 && mouseX < 500 && mouseY > 550 && mouseY < 650) {
    mode = INTRO;
    resetGame();
  }
}
