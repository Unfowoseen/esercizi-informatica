MinigameManager manager;

void setup() {
  fullScreen();

  manager = new MinigameManager();
}

void draw() {
  background(0);

  manager.display();
}
