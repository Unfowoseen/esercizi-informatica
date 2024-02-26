void setup() {
  int[][] t1 = generateTable(3, 4, 1, 10);
  int[][] t2 = generateTable(3, 4, 1, 10);
  int[][] t3 = sumTables(t1, t2);

  printTable(t1);
  printTable(t2);

  if (t3 != null) {
    printTable(t3);
  }
}
