void setup() {
  int[][] t1 = generateTable(3, 4, 0, 5);
  int[][] t2 = generateTable(4, 3, 0, 5);
  int[][] t3 = multiplyTables(t1, t2);

  printTable(t1);
  printTable(t2);

  if (t3 == null) {
    println("Input non valido");
  } else {
    printTable(t3);
  }
}
