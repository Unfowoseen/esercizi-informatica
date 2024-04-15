class Player {
  static final int MAX_HEALTH = 100;

  float angle;
  float hitboxRadius;
  int health;
  float lastHitTimestamp;

  Player() {
    angle = 0;
    hitboxRadius = min(width, height) / 10;
    health = MAX_HEALTH;
    lastHitTimestamp = 0;
  }

  void display() {
    float centerX = width / 2;
    float centerY = height / 2;
    float barWidthMax = 4 * hitboxRadius;
    float barWidth = constrain(map(health, 0, MAX_HEALTH, 0, barWidthMax), 0, barWidthMax);

    ellipseMode(RADIUS);
    rectMode(CENTER);

    noFill();
    stroke(255);
    strokeWeight(2);
    circle(centerX, centerY, hitboxRadius);

    fill(255, 0, 0);
    noStroke();
    rect(centerX, centerY - 2 * hitboxRadius, barWidth, hitboxRadius / 5);
  }

  void lookAtMouse() {
  }

  void computeDamage(ArrayList<Arrow> arrows) {
  }
}
