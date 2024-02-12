import javax.swing.JOptionPane;

void setup() {
  boolean shouldContinue = true;

  do {
    String input1 = JOptionPane.showInputDialog("Inserisci la prima data:");
    String input2 = JOptionPane.showInputDialog("Inserisci la seconda data:");

    if (input1 == null || input2 == null) {
      shouldContinue = false;
    } else {
      int[] date1 = getFormattedDate(input1), date2 = getFormattedDate(input2);

      if (date1 == null || date2 == null) {
        println("Formato delle date non valido.");
      } else {
        int daysDiff = getDaysBetweenDates(
          date1[0], date1[1], date1[2],
          date2[0], date2[1], date2[2]);

        if (daysDiff < 0) {
          println("La prima data deve essere collocata prima della seconda data.");
        } else {
          println("La differenza tra le due date è di " + daysDiff + " giorni.");
        }
      }

      String choice = JOptionPane.showInputDialog("Vuoi ripetere l'inserimento? (y/n)");
      shouldContinue = ("y").equalsIgnoreCase(choice);
    }
  } while (shouldContinue);

  println("Hai terminato il programma.");
}

void draw() {
}
