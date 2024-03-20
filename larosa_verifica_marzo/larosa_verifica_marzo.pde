import javax.swing.JOptionPane;

final int N = 5;

void setup() {
  String[][] database = new String[N][2];
  String[][] datiPersonali = new String[N][3];
  boolean shouldContinue = true;

  do {
    String choice = JOptionPane.showInputDialog("Inserisci un'opzione:\n"
      + "1) inserisci un utente nel database;\n"
      + "2) inserisci i dati personali di un utente;\n"
      + "3) stampa gli utenti presenti nel database;\n"
      + "4) stampa i dati personali di un utente;\n"
      + "5) termina il programma.");

    if (choice == null) {
      shouldContinue = false;
    } else {
      String username, password;
      int index;

      switch(choice) {
      case "1":
        username = JOptionPane.showInputDialog("Inserisci il nome utente:");
        password = JOptionPane.showInputDialog("Inserisci la password:");

        if (username == null || password == null) {
          println("Hai annullato l'inserimento.");
        } else {
          if (doesUsernameExist(database, username)) {
            println("Questo utente è già presente nel database.");
          } else {
            index = getFirstNullIndex(database);

            if (index == database.length) {
              println("Il numero massimo di utenti è già registrato.");
            } else {
              database[index] = new String[] {username, password};
            }
          }
        }
        break;
      case "2":
        username = JOptionPane.showInputDialog("Inserisci il nome utente:");
        password = JOptionPane.showInputDialog("Inserisci la password:");

        if (username == null || password == null) {
          println("Hai annullato l'inserimento.");
        } else {
          index = trovaIndice(database, username, password);

          if (index < 0) {
            println("Questa coppia di username e password non esiste.");
          } else {
            String firstName = JOptionPane.showInputDialog("Inserisci il nome dell'utente:");
            String lastName = JOptionPane.showInputDialog("Inserisci il cognome dell'utente:");
            String dateOfBirth = JOptionPane.showInputDialog("Inserisci la data di nascita dell'utente:");

            if (firstName == null || lastName == null || dateOfBirth == null) {
              println("Hai annullato l'inserimento.");
            } else {
              datiPersonali[index] = new String[] {firstName, lastName, dateOfBirth};
            }
          }
        }

        break;
      case "3":
        index = getFirstNullIndex(database);

        if (index == 0) {
          println("Nel database non è registrato nessun utente.");
        } else {
          for (int i = 0; i < index; i++) {
            String[] user = database[i];
            println(user[0] + ", " + user[1]);
          }
        }

        break;
      case "4":
        username = JOptionPane.showInputDialog("Inserisci il nome utente:");
        password = JOptionPane.showInputDialog("Inserisci la password:");

        if (username == null || password == null) {
          println("Hai annullato l'inserimento.");
        } else {
          index = trovaIndice(database, username, password);

          if (index < 0) {
            println("Questa coppia di username e password non esiste.");
          } else {
            String[] userData = datiPersonali[index];

            if (userData.length != 3 || userData[0] == null || userData[1] == null || userData[2] == null) {
              println("Non sono stati inseriti i dati personali di questo utente.");
            } else {
              println(userData[0] + " " + userData[1] + ", " + userData[2]);
            }
          }
        }

        break;
      case "5":
        shouldContinue = false;
        break;
      default:
        println("Opzione non valida; riprova.");
      }
    }
  }
  while (shouldContinue);

  println("Hai terminato il programma.");
}
