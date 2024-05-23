class TextButton {
  String content;
  int fillColor;
  PVector origin;
  PVector extents;

  TextButton(String content, int fillColor, float originX, float originY, float extentsX, float extentsY) {
    this.content = content;
    this.fillColor = fillColor;
    origin = new PVector(originX, originY);
    extents = new PVector(extentsX, extentsY);
  }

  TextButton(String content, int fillColor, PVector origin, PVector extents) {
    this.content = content;
    this.fillColor = fillColor;
    this.origin = origin;
    this.extents = extents;
  }

  void display() {
    rectMode(CENTER);
    strokeWeight(2);
    stroke(255);
    fill(fillColor);
    rect(origin.x, origin.y, extents.x, extents.y);
    textAlign(CENTER, CENTER);
    fill(255);
    textSize(extents.x / max(1, content.length()));
    text(content, origin.x, origin.y);
  }

  boolean isHovering() {
    float halfX = extents.x / 2;
    float halfY = extents.y / 2;

    return mouseX >= origin.x - halfX && mouseX <= origin.x + halfX
      && mouseY >= origin.y - halfY && mouseY <= origin.y + halfY;
  }
}
