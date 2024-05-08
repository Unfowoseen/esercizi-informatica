void setup() {
  size(800, 800);
}

void draw() {
  background(255);
  translate(width / 2, height / 2);
  drawFractal(min(width, height) * 0.75, false, 50);
}

void drawFractal(float len, boolean flipColor, int depth) {
  rectMode(CENTER);
  rotate(map(mouseX, 0, width, -PI / 12, PI / 12));
  fill(flipColor ? random(128, 256) : random(0, 128), 0, 0);
  strokeWeight(2);
  square(0, 0, len);

  if (depth > 0) {
    drawFractal(len * 0.95, !flipColor, depth - 1);
  }
}
