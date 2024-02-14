import javax.swing.JOptionPane;

final int CODE_LENGTH = 13;

void setup() {
  boolean shouldContinue = true;

  do {
    String choiceS = JOptionPane.showInputDialog("Inserisci un'opzione:\n"
      + "1) Stampa il codice a barre di un prodotto;\n"
      + "2) Verifica se un codice a barre è ben formato;\n"
      + "3) Termina il programma.");

    if (choiceS == null) {
      shouldContinue = false;
    } else {
      int choice = int(choiceS);

      switch (choice) {
      case 1:
        String name = JOptionPane.showInputDialog("Inserisci il nome del prodotto:");

        if (name != null) {
          int[] codeDigits = generaCodiceBarre(name);
          String productCode = "";

          for (int i = 0; i < codeDigits.length; i++) {
            productCode += codeDigits[i];
          }

          println("Codice a barre: " + productCode);
        }

        break;
      case 2:
        String productCode = JOptionPane.showInputDialog("Inserisci il codice a barre da controllare:");

        if (productCode != null) {
          if (check(productCode)) {
            println("Il codice a barre '" + productCode + "' è valido.");
          } else {
            println("Il codice a barre '" + productCode + "' non è valido.");
          }
        }

        break;
      case 3:
        shouldContinue = false;
      default:
        println("Scelta non valida; riprova.");
      }
    }
  } while (shouldContinue);

  println("Hai terminato il programma.");
}

void draw() {
}
