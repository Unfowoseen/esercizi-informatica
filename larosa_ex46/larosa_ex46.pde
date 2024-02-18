import javax.swing.JOptionPane;

final int N_GRADES = 16;

void setup() {
  boolean shouldContinue = true;
  float[] grades = null;

  do {
    String choice = JOptionPane.showInputDialog("Inserisci un'opzione:\n"
      + "A) Inserisci i voti di uno studente, incluso il comportamento;\n"
      + "B) Stampa la media dei voti dello studente;\n"
      + "C) Stampa i voti superiori a 8;\n"
      + "Q) Termina il programma.");

    switch(choice.toLowerCase()) {
    case "a":
      grades = readGrades();
      break;
    case "b":
      if (grades == null) {
        println("Prima devi inserire i voti!");
      } else {
        println("La media dei voti è " + computeAverage(grades));
      }

      break;
    case "c":
      if (grades == null) {
        println("Prima devi inserire i voti!");
      } else {
        for (int i = 0; i < grades.length; i++) {
          float grade = grades[i];

          if (grade > 8) {
            println(String.format("[%d] %.2f", i, grade));
          }
        }
      }

      break;
    case "q":
      shouldContinue = false;
      break;
    default:
      println("Opzione non valida; riprova.");
    }
  } while (shouldContinue);

  println("Hai terminato il programma.");
}

void draw() {
}
