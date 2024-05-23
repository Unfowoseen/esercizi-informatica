class SurvivalClock {
  Timer timer;

  SurvivalClock(float duration) {
    timer = new Timer(duration);
  }

  void display() {
    textAlign(RIGHT, TOP);
    textSize(24);
    fill(255, 0, 0);
    text(String.format("Sopravvivi per %.0f secondi", timer.getTimeRemaining() / 1000), width - 10, 10);
  }

  boolean isFinished() {
    return timer.isFinished();
  }

  void reset() {
    timer.reset();
  }
}
