int[][] generateMatrix(int size) {
  if (size < 0) {
    return null;
  }

  int[][] matrix = new int[size][size];

  for (int i = 0; i < size; i++) {
    for (int j = 0; j < size; j++) {
      int value = size * i + (j + 1);

      if (i % 2 == 0) {
        matrix[i][j] = value;
      } else {
        matrix[i][size - j - 1] = value;
      }
    }
  }

  return matrix;
}

void printMatrix(int[][] matrix) {
  if (matrix != null) {
    for (int[] row : matrix) {
      if (row != null) {
        for (int n : row) {
          print(n + " ");
        }

        println();
      }
    }
  }
}
