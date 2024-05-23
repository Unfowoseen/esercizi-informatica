class Player {
  final int MAX_HEALTH = 100;
  final float SHIELD_ANGLE = PI / 6;

  MinigameManager parent;
  float angle;
  int hitboxRadius;
  int health;
  float lastHitTimestamp;
  PImage[] sprites;

  Player(MinigameManager parent) {
    this.parent = parent;
    angle = 0;
    hitboxRadius = min(width, height) / 10;
    health = MAX_HEALTH;
    lastHitTimestamp = 0;
    sprites = new PImage[] {
      loadImage("images/knight_idle.png"),
      loadImage("images/knight_parry.png"),
    };
  }

  void display() {
    float centerX = width / 2;
    float centerY = height / 2;
    float barWidthMax = 4 * hitboxRadius;
    float barWidth = constrain(map(health, 0, MAX_HEALTH, 0, barWidthMax), 0, barWidthMax);

    pushMatrix();
    translate(centerX, centerY);

    rectMode(CENTER);
    fill(255, 0, 0);
    noStroke();
    rect(0, -2 * hitboxRadius, barWidth, barWidthMax / 15);

    rectMode(CENTER);
    noFill();
    strokeWeight(2);
    stroke(255);
    rect(0, -2 * hitboxRadius, barWidthMax, barWidthMax / 15);

    imageMode(CENTER);
    rotate(angle);
    fill(255);

    if (abs(angle) > HALF_PI) {
      scale(1, -1);
    }

    PImage sprite = mousePressed ? sprites[1] : sprites[0];
    sprite.resize(3 * hitboxRadius, 0);

    image(sprite, 0, 0);

    popMatrix();
  }

  void lookAtMouse() {
    if (mousePressed) {
      angle = atan2(mouseY - height / 2, mouseX - width / 2);
    }
  }

  void computeDamage() {
    for (Bullet bullet : parent.bullets) {
      if (!bullet.isDisabled && bullet.position.mag() <= hitboxRadius) {
        bullet.onPlayerHit();

        float angleDiff = abs(angle - bullet.angle);

        if (!mousePressed || angleDiff > SHIELD_ANGLE) {
          health -= bullet.damageDealt;
        }
      }
    }
  }

  boolean isDead() {
    return health <= 0;
  }
}
