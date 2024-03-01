int[][] generaMatrice(int size, int min, int max) {
  if (size < 0 || min >= max) {
    return null;
  }

  int[][] matrix = new int[size][size];

  for (int i = 0; i < matrix.length; i++) {
    for (int j = 0; j < matrix[i].length; j++) {
      matrix[i][j] = (int) random(min, max + 1);
    }
  }

  return matrix;
}

int[][] trasponiMatrice(int[][] matrix) {
  if (matrix == null) {
    return null;
  }

  for (int i = 0; i < matrix.length; i++) {
    if (matrix[i].length != matrix.length) {
      return null;
    }
  }

  int[][] transpose = new int[matrix.length][matrix.length];

  for (int i = 0; i < matrix.length; i++) {
    for (int j = 0; j < matrix[i].length; j++) {
      transpose[j][i] = matrix[i][j];
    }
  }

  return transpose;
}

void stampaMatrice(int[][] matrix) {
  if (matrix != null) {
    for (int i = 0; i < matrix.length; i++) {
      for (int j = 0; j < matrix[i].length; j++) {
        print(matrix[i][j] + " ");
      }

      println();
    }
  }

  println();
}
