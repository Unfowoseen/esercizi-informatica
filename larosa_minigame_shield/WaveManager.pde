class WaveManager {
  final int COUNT_MIN = 2;
  final int COUNT_MAX = 10;
  final float BULLET_DIAMETER = min(width, height) / 50;
  final float BULLET_GAP = BULLET_DIAMETER / 2;
  final float BULLET_SPEED = 5;

  MinigameManager parent;
  Timer timer;
  int bulletCount;
  float bulletAngle;
  int bulletDamage;

  WaveManager(MinigameManager parent) {
    this.parent = parent;
    bulletCount = (int) random(COUNT_MIN, COUNT_MAX + 1);
    bulletAngle = random(-PI, PI);
    bulletDamage = (int) random(1, 10);
    timer = new Timer((50 * (BULLET_DIAMETER + BULLET_GAP)) / (3 * BULLET_SPEED));
  }

  void spawnBullet() {
    if (bulletCount > 0 && timer.isFinished()) {
      Bullet bullet = new Bullet(bulletAngle, BULLET_SPEED, BULLET_DIAMETER, bulletDamage);
      bulletCount--;

      parent.bullets.add(bullet);
      timer.reset();
    }
  }
}
