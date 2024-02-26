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
    if (t1[i].length != t2[i].length) {
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
    int nCols = min(t1[i].length, t2[i].length);
    t3[i] = new int[nCols];

    for (int j = 0; j < nCols; j++) {
      t3[i][j] = t1[i][j] + t2[i][j];
    }
  }

  return t3;
}
