int[][] generateMatrix(int nRows, int nCols) {
  int[][] matrix = new int[nRows][nCols];

  for (int i = 0; i < matrix.length; i++) {
    for (int j = 0; j < matrix[i].length; j++) {
      matrix[i][j] = (int) random(0, 2);
    }
  }

  return matrix;
}

void drawMatrix(int[][] matrix) {
  if (matrix == null || matrix.length < 1) {
    return;
  }

  int nCols = 0;

  for (int i = 0; i < matrix.length; i++) {
    if (i == 0) {
      nCols = matrix[i].length;
    } else if (nCols != matrix[i].length) {
      return;
    }
  }

  int sizeX = width / matrix.length;
  int sizeY = height / nCols;

  for (int i = 0; i < matrix.length; i++) {
    for (int j = 0; j < matrix[i].length; j++) {
      int x = sizeX * i;
      int y = sizeY * j;

      if (matrix[i][j] == 0) {
        stroke(colorA);
        strokeWeight(weightA);
        line(x, y, x + sizeX, y + sizeY);
      } else {
        stroke(colorB);
        strokeWeight(weightB);
        line(x + sizeX, y, x, y + sizeY);
      }
    }
  }
}

int generateRandomColor() {
  int r = (int) random(0, 256);
  int g = (int) random(0, 256);
  int b = (int) random(0, 256);

  return color(r, g, b);
}
