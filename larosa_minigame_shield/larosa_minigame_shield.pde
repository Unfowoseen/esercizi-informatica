MinigameManager manager;

void setup() {
  fullScreen();

  manager = new MinigameManager();
}

void draw() {
  manager.tick();
}

void mousePressed() {
  manager.onMousePressed();
}
