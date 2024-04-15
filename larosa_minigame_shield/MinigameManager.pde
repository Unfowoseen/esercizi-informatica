class MinigameManager {
  static final float SPAWN_DELAY = 0;
  static final float WAVE_DELAY = 0;

  Player player;
  ArrayList<Arrow> arrows;

  MinigameManager() {
    player = new Player();
    arrows = new ArrayList<>();
  }

  void display() {
    player.display();
  }

  void spawnArrows() {
  }
}
