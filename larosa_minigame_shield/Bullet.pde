class Bullet {
  final float DISTANCE = max(width, height);

  PVector position;
  float angle;
  float speed;
  float diameter;
  int damageDealt;
  boolean isDisabled;

  Bullet(float angle, float speed, float diameter, int damageDealt) {
    this.angle = angle;

    float x = DISTANCE * cos(this.angle);
    float y = DISTANCE * sin(this.angle);

    this.speed = speed;
    this.diameter = diameter;
    this.damageDealt = damageDealt;
    position = new PVector(x, y);
    isDisabled = false;
  }

  void display() {
    if (isDisabled) {
      return;
    }

    pushMatrix();
    translate(width / 2, height / 2);
    strokeWeight(diameter);
    stroke(255);
    point(position.x, position.y);
    popMatrix();
  }

  void updatePosition() {
    if (!isDisabled) {
      position.setMag(position.mag() - speed);
    }
  }

  void onPlayerHit() {
    isDisabled = true;
  }
}
