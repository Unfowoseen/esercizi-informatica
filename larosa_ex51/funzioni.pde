int[][] generateTable(int nRows, int nCols, int min, int max) {
  if (min >= max) {
    return null;
  }

  int[][] table = new int[nRows][nCols];

  for (int i = 0; i < table.length; i++) {
    for (int j = 0; j < table[i].length; j++) {
      table[i][j] = (int) random(min, max + 1);
    }
  }

  return table;
}

void printTable(int[][] table) {
  if (table != null) {
    for (int i = 0; i < table.length; i++) {
      for (int j = 0; j < table[i].length; j++) {
        print(table[i][j] + " ");
      }

      println();
    }
  }

  println();
}

int[][] sumTables(int[][] t1, int[][] t2) {
  if (t1 == null || t2 == null || t1.length != t2.length) {
    return null;
  }

  int[][] t3 = new int[t1.length][];

  for (int i = 0; i < t3.length; i++) {
    if (t1[i] == null || t2[i] == null || t1[i].length != t2[i].length) {
      return null;
    }

    t3[i] = new int[t1[i].length];

    for (int j = 0; j < t3[i].length; j++) {
      t3[i][j] = t1[i][j] + t2[i][j];
    }
  }

  return t3;
}

int[][] sumTablesMismatched(int[][] t1, int[][] t2) {
  if (t1 == null || t2 == null) {
    return null;
  }

  int nRows = min(t1.length, t2.length);
  int[][] t3 = new int[nRows][];

  for (int i = 0; i < nRows; i++) {
    if (t1[i] == null || t2[i] == null) {
      return null;
    }

    int nCols = min(t1[i].length, t2[i].length);
    t3[i] = new int[nCols];

    for (int j = 0; j < nCols; j++) {
      t3[i][j] = t1[i][j] + t2[i][j];
    }
  }

  return t3;
}

int[][] multiplyTables(int[][] t1, int[][] t2) {
  if (t1 == null || t2 == null) {
    return null;
  }

  int nCols1 = 0, nCols2 = 0;

  for (int i = 0; i < t1.length; i++) {
    if (i == 0) {
      nCols1 = t1[i].length;
      nCols2 = t2[i].length;
    } else if (nCols1 != t1[i].length || nCols2 != t2[i].length) {
      return null;
    }
  }

  if (nCols1 != t2.length) {
    return null;
  }

  int[][] t3 = new int[t1.length][nCols2];

  for (int row = 0; row < t3.length; row++) {
    for (int col = 0; col < t3[row].length; col++) {
      for (int i = 0; i < t2.length; i++) {
        t3[row][col] += t1[row][i] * t2[i][col];
      }
    }
  }

  return t3;
}
