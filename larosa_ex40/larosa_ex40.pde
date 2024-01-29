import javax.swing.JOptionPane;

String[] coinSides;
String[] colors;

void setup() {
  boolean shouldExit = false;

  coinSides = new String[] {"testa", "croce"};
  colors = new String[] {"blu", "rosso", "bianco", "verde", "grigio"};

  do {
    String choiceS = JOptionPane.showInputDialog("Inserisci un'opzione:\n"
      + "1) Lancio di un dado;\n"
      + "2) Lancio di due dadi;\n"
      + "3) Lancio di una moneta (" + join(coinSides, ", ") + ");\n"
      + "4) Indovina il colore (" + join(colors, ", ") + ");\n"
      + "5) Uscita.");

    if (choiceS == null) {
      shouldExit = true;
    } else {
      int choice = int(choiceS);

      if (choice < 1 || choice > 4) {
        shouldExit = true;
      } else {
        String guess = JOptionPane.showInputDialog("Inserisci la tua supposizione");
        boolean hasWon = false;

        if (guess == null) {
          shouldExit = true;
        } else {
          switch (choice) {
          case 1:
          case 2:
            hasWon = guessDiceRoll(choice, guess);
            break;
          case 3:
            hasWon = guessCoinFlip(guess);
            break;
          case 4:
            hasWon = guessColor(guess);
            break;
          }
        }

        if (!shouldExit) {
          println("Hai inserito: " + guess);

          if (hasWon) {
            println("Hai vinto!");
          } else {
            println("Hai perso!");
          }
        }
      }
    }
  } while (!shouldExit);

  println("Hai terminato il programma.");
}

void draw() {
}
