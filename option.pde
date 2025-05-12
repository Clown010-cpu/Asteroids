void rectButton(String label, float x, float y, float w, float h) {
  if (mouseX > x - w / 2 && mouseX < x + w / 2 &&
      mouseY > y - h / 2 && mouseY < y + h / 2) {
    strokeWeight(5);
    stroke(Blue);
    fill(255);
  } else {
    strokeWeight(2);
    stroke(0);
    fill(255);
  }

  rect(x, y, w, h);
  fill(0);
  textSize(30);
  text(label, x, y);
}
