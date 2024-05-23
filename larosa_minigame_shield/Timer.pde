class Timer {
  float duration;
  float timestamp;

  Timer() {
    this.duration = 0F;
    timestamp = millis();
  }

  Timer(float duration) {
    this.duration = duration;
    timestamp = millis();
  }

  boolean isFinished() {
    return duration > 0F && millis() - timestamp >= duration;
  }

  float getTimeRemaining() {
    return timestamp + duration - millis();
  }

  boolean isSet() {
    return duration > 0F;
  }

  void setDuration(float duration) {
    this.duration = duration;
    reset();
  }

  void reset() {
    timestamp = millis();
  }
}
