float[] readGrades() {
  float[] grades = new float[N_GRADES];
  int i = 0;

  while (i < N_GRADES) {
    float grade = readFloat(String.format("(%d/%d) Inserisci un voto compreso tra 1 e 10", i + 1, N_GRADES));

    if (grade >= 1 && grade <= 10) {
      grades[i] = grade;
      i++;
    }
  }

  return grades;
}

float readFloat(String message) {
  String input;
  float result = Float.NaN;

  do {
    input = JOptionPane.showInputDialog(message);

    if (input != null) {
      result = float(input);
    }
  } while (Float.isNaN(result));

  return result;
}

float computeAverage(float[] nums) {
  float sum = 0.0;

  for (int i = 0; i < nums.length; i++) {
    sum += nums[i];
  }

  return sum / nums.length;
}
