Manager[] managers;

void setup() {
  size(800, 600);

  managers = new Manager[] {
    new Manager("Mario", "Rossi", "PLCHLDR", "mariorossi@example.com", "+0 000", 10_000, "Ford", 5_000),
    new Manager("Pinco", "Pallo", "PLCHLDR", "pincopallo@example.com", "+0 000", 20_000, "Fiat", 35_000),
    new Manager("Tizio", "Caio", "PLCHLDR", "tiziocaio@example.com", "+0 000", 30_000, "Chevrolet", 20_000),
  };

  println("Digita un'opzione:\n"
    + "S) stampa la scheda informativa di ogni manager;\n"
    + "M) stampa la scheda informativa di ogni manager con stipendio lordo;\n"
    + "A) stampa la scheda informativa di ogni manager con stipendio netto.");

  noLoop();
}

void draw() {
}

void keyTyped() {
  char letter = Character.toUpperCase(key);

  switch (letter) {
  case 'S':
    for (Manager manager : managers) {
      manager.display();
      println();
    }
    break;
  case 'M':
    for (Manager manager : managers) {
      manager.displayMore(true);
      println();
    }
    break;
  case 'A':
    for (Manager manager : managers) {
      manager.displayMore(false);
      println();
    }
    break;
  }

  redraw();
}
