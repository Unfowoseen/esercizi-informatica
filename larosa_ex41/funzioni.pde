float readFloat(String message) {
  String input;
  float f = Float.NaN;

  do {
    input = JOptionPane.showInputDialog(message);
    if (input != null) {
      f = float(input);
    }
  } while (Float.isNaN(f) || f <= 0.0);

  return f;
}

float computeVelocity(float diameter, float nRounds) {
  float velocity = PI * diameter * nRounds * 6;

  return metersSecondToKmHour(velocity);
}

float metersSecondToKmHour(float metersSecond) {
  return metersSecond / 16.667;
}