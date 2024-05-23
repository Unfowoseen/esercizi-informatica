class MinigameManager {
  final float ROUND_DURATION = 60;
  final float DELAY_MIN = 0.5;
  final float DELAY_MAX = 2;

  Player player;
  ArrayList<Bullet> bullets;
  WaveManager waveManager;
  SurvivalClock clock;
  Timer timer;
  PImage backgroundSprite;
  TextButton retryButton;

  MinigameManager() {
    player = new Player(this);
    bullets = new ArrayList<>();
    waveManager = new WaveManager(this);
    clock = new SurvivalClock(ROUND_DURATION * 1000);
    timer = new Timer(random(DELAY_MIN, DELAY_MAX + 1) * 1000);
    backgroundSprite = loadImage("images/background.png");
    backgroundSprite.resize(width, 0);
    retryButton = new TextButton("RIPROVA", color(255, 0, 0), width / 2, height / 2, width / 5, height / 10);
  }

  void tick() {
    if (!(player.isDead() || clock.isFinished())) {
      if (waveManager.bulletCount <= 0) {
        timer.setDuration(random(DELAY_MIN, DELAY_MAX + 1) * 1000);
        waveManager = new WaveManager(this);
      }

      if (timer.isFinished()) {
        waveManager.spawnBullet();
      }

      player.computeDamage();
    }

    display();
  }

  void display() {
    if (player.isDead()) {
      retryButton.display();
    } else if (clock.isFinished()) {
      background(0, 255, 0);
    } else {
      imageMode(CENTER);
      image(backgroundSprite, width / 2, height / 2);

      player.lookAtMouse();
      player.display();
      clock.display();

      for (Bullet bullet : bullets) {
        bullet.display();
        bullet.updatePosition();
      }
    }
  }

  void reset() {
    bullets.clear();
    player = new Player(this);
    waveManager = new WaveManager(this);
    clock.reset();
    timer.reset();
  }

  void onMousePressed() {
    if (player.isDead() && retryButton.isHovering()) {
      reset();
    }
  }
}
